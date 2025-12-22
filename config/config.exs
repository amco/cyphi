import Config

config :oapi_generator,
  default: [
    output: [
      base_module: Cyphi,
      location: "lib/cyphi"
    ]
  ]

config :cyphi,
  api_url: System.get_env("CL_API_URL"),
  api_key: System.get_env("CL_API_KEY")
