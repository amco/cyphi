import Config

config :cyphi,
  api_url: System.get_env("CL_API_URL"),
  api_key: System.get_env("CL_API_KEY")

if config_env() == :dev do
  config :oapi_generator,
    default: [
      output: [
        base_module: Cyphi,
        location: "lib/cyphi"
      ]
    ]
end

if config_env() == :test do
  config :cyphi,
    api_key: "secret",
    api_url: "http://test.local/api",
    http_adapter: Cyphi.HttpAdapter.Test
end
