defmodule Cyphi.Client.ResponseTest do
  use ExUnit.Case, async: true

  alias Cyphi.Client.Response
  alias Cyphi.User

  setup do
    {:ok,
     req_success: %Req.Response{status: 200, body: %{}},
     req_created: %Req.Response{status: 201, body: %{}},
     req_accepted: %Req.Response{status: 202, body: %{}},
     req_error: %Req.Response{status: 404, body: "Not Found"}}
  end

  describe "decode/2 with Adapter Error" do
    test "passes through adapter errors directly" do
      result = Response.decode({:error, :econnrefused}, %{response: []})
      assert result == {:error, :econnrefused}
    end
  end

  describe "decode/2 with Single Item (200/201)" do
    test "decodes 200 response into struct" do
      body = %{"first_name" => "Test Item", "id" => 123}
      req = %Req.Response{status: 200, body: body}
      opts = %{response: [{200, {User, :t}}]}

      assert {:ok, result} = Response.decode({:ok, req}, opts)
      assert result == %User{first_name: "Test Item", id: 123}
    end

    test "decodes 201 created response into struct" do
      body = %{"first_name" => "New Item", "id" => 999}
      req = %Req.Response{status: 201, body: body}
      opts = %{response: [{201, {Cyphi.User, :t}}]}

      assert {:ok, result} = Response.decode({:ok, req}, opts)
      assert result == %User{first_name: "New Item", id: 999}
    end

    test "ignores extra keys in the JSON body" do
      body = %{"first_name" => "Strict", "id" => 1, "extra" => "field"}
      req = %Req.Response{status: 200, body: body}
      opts = %{response: [{200, {Cyphi.User, :t}}]}

      assert {:ok, result} = Response.decode({:ok, req}, opts)
      assert result == %User{first_name: "Strict", id: 1}
      refute Map.has_key?(result, :extra)
    end
  end

  describe "decode/2 with List (200/201)" do
    test "decodes list of items into list of structs" do
      body = [
        %{"first_name" => "A", "id" => 1},
        %{"first_name" => "B", "id" => 2}
      ]

      req = %Req.Response{status: 200, body: body}
      opts = %{response: [{200, [{Cyphi.User, :t}]}]}

      assert {:ok, results} = Response.decode({:ok, req}, opts)
      assert is_list(results)
      assert length(results) == 2
      assert hd(results) == %User{first_name: "A", id: 1}
    end
  end

  describe "included relationships" do
    test "preserves included objects and their nested keys as raw maps" do
      organization = %{"id" => 7, "custom" => %{"active" => true}}
      body = %{"id" => 1, "organization" => organization, "manager" => %{"id" => 2}}
      req = %Req.Response{status: 200, body: body}

      assert {:ok, user} = Response.decode({:ok, req}, %{response: [{200, {User, :t}}]})
      assert user == %User{id: 1, organization: organization, manager: %{"id" => 2}}
    end

    test "absent and null relationships default to nil" do
      for body <- [%{"id" => 1}, %{"id" => 1, "organization" => nil}] do
        req = %Req.Response{status: 200, body: body}

        assert {:ok, %User{organization: nil, manager: nil} = user} =
                 Response.decode({:ok, req}, %{response: [{200, {User, :t}}]})

        assert user == %User{id: 1}
      end
    end

    test "preserves relations in list responses without changing scalar casting" do
      body = [
        %{
          "id" => 1,
          "user_id" => 2,
          "user" => %{"id" => 2},
          "progress" => %{"percent" => 50}
        },
        %{"id" => 3}
      ]

      req = %Req.Response{status: 200, body: body}

      assert {:ok, [first, second]} =
               Response.decode({:ok, req}, %{response: [{200, [{Cyphi.Learner, :t}]}]})

      assert first == %Cyphi.Learner{
               id: 1,
               user_id: 2,
               user: %{"id" => 2},
               progress: %{"percent" => 50}
             }

      assert second == %Cyphi.Learner{id: 3}
    end

    test "does not change decoding of previously declared nested fields" do
      metadata = %{"custom" => "value"}
      organization = %{"id" => 2}
      body = %{"id" => 1, "metadata" => metadata, "organization" => organization}
      req = %Req.Response{status: 200, body: body}

      assert {:ok, course} =
               Response.decode({:ok, req}, %{response: [{200, {Cyphi.Course, :t}}]})

      assert course.metadata == metadata
      assert course.organization == organization
    end
  end

  describe "decode/2 with Raw Body (200/202/204)" do
    test "returns raw body for 202 Accepted (async jobs)" do
      req = %Req.Response{status: 202, body: "Job Queued"}
      opts = %{response: [{202, {Cyphi.User, :t}}]}

      assert {:ok, "Job Queued"} = Response.decode({:ok, req}, opts)
    end

    test "returns raw body for 204 No Content" do
      req = %Req.Response{status: 204, body: ""}
      opts = %{response: [{204, nil}]}

      assert {:ok, ""} = Response.decode({:ok, req}, opts)
    end

    test "returns raw body for 200 if spec does not define a module/struct" do
      req = %Req.Response{status: 200, body: "OK"}
      opts = %{response: [{200, :any}]}

      assert {:ok, "OK"} = Response.decode({:ok, req}, opts)
    end
  end

  describe "decode/2 Errors" do
    test "returns error tuple for undefined status codes (e.g. 404)" do
      req = %Req.Response{status: 404, body: %{"error" => "Not Found"}}
      opts = %{response: [{200, {Cyphi.User, :t}}]}

      assert {:error, body} = Response.decode({:ok, req}, opts)
      assert body == %{"error" => "Not Found"}
    end

    test "returns error tuple for 500" do
      req = %Req.Response{status: 500, body: "Server Error"}
      opts = %{response: [{200, {Cyphi.User, :t}}]}

      assert {:error, "Server Error"} = Response.decode({:ok, req}, opts)
    end
  end
end
