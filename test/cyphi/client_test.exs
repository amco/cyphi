defmodule Cyphi.ClientTest do
  use ExUnit.Case, async: true

  alias Cyphi.{Badge, Client}

  import Cyphi.ClientApiHelper

  describe "request/1" do
    test "list request returns decoded response (GET)" do
      opts = %{
        method: :get,
        url: "/badges",
        response: [{200, [{Cyphi.Badge, :t}]}]
      }

      with_response(%{status: 200, body: %{}}, fn ->
        {:ok, resp} = Client.request(opts)
        assert [resp] == [%Badge{}]
      end)
    end

    test "single item request returns decoded response (GET)" do
      opts = %{
        method: :get,
        url: "/badges/1",
        response: [{200, {Cyphi.Badge, :t}}]
      }

      with_response(%{status: 200, body: %{}}, fn ->
        {:ok, resp} = Client.request(opts)
        assert resp == %Badge{}
      end)
    end

    test "request returns raw body (PATCH 202)" do
      opts = %{
        method: :patch,
        url: "/badges/1",
        response: [{202, {Cyphi.Badges, :badge_crud_update_batch_202_json_resp}}]
      }

      with_response(%{status: 202, body: 10}, fn ->
        {:ok, resp} = Client.request(opts)
        assert resp == 10
      end)
    end

    test "create request returns decoded response (POST)" do
      opts = %{
        method: :post,
        url: "/badges",
        body: %{name: "New Badge"},
        response: [{201, {Cyphi.Badge, :t}}]
      }

      with_response(%{status: 201, body: %{}}, fn ->
        {:ok, resp} = Client.request(opts)
        assert resp == %Badge{}
      end)
    end

    test "returns error when adapter returns an error (Network Failure)" do
      opts = %{
        method: :get,
        url: "/badges",
        response: [{200, {Cyphi.Badge, :t}}]
      }

      with_response({:error, :timeout}, fn ->
        assert {:error, "Invalid request"} == Client.request(opts)
      end)
    end

    test "returns error when request is invalid (catch-all else block)" do
      opts = %{
        method: :head,
        url: "/",
        response: []
      }

      with_response(:ok, fn ->
        assert {:error, "Invalid request"} == Client.request(opts)
      end)
    end

    test "request fails when API URL configuration is empty (Invalid Host)" do
      opts = %{
        method: :get,
        url: "/users/1",
        response: [{200, {Cyphi.User, :t}}]
      }

      with_api_url("", fn ->
        with_response(:ok, fn ->
          assert {:error, "Invalid request"} == Client.request(opts)
        end)
      end)
    end

    test "request succeeds when URL is exactly 'localhost' (Localhost Edge Case)" do
      opts = %{
        method: :get,
        url: "localhost",
        response: [{200, {Cyphi.Badge, :t}}]
      }

      with_api_url("", fn ->
        with_response(%{status: 200, body: %{}}, fn ->
          assert {:ok, _resp} = Client.request(opts)
        end)
      end)
    end
  end
end
