defmodule Cyphi.ClientApiHelper do
  def with_api_url(url, fun) do
    original_url = Application.get_env(:cyphi, :api_url)
    Application.put_env(:cyphi, :api_url, url)

    try do
      fun.()
    after
      Application.put_env(:cyphi, :api_url, original_url)
    end
  end

  def with_response(response, fun) do
    Process.put(:http_response, response)

    try do
      fun.()
    after
      Process.delete(:http_response)
    end
  end
end
