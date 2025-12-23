![tests](https://img.shields.io/endpoint?url=https:%2F%2Famco-contentinator.web.app%2Fcoverage.json)

# Cyphi

REST client for CYpher Learning API. Created with [OpenAPI Code Generator](https://github.com/aj-foster/open-api-generator).

## Installation

```elixir
def deps do
  [
    {:cyphi, "~> 0.1.0"}
  ]
end
```

## Configuration

You will need to add to your `config/config.exs` file the API endpoint
and the API KEY:

```elixir
config :cyphy,
  api_url: "Cypher Learning API endpoint",
  api_key: "API KEY VALUE"
```

## Testing

You can set your test environment with a HTTP test adapter:

```elixir
config :cyphi,
  http_adapter: MyApp.TestAdapter
```

The adaprter should have a public `request/1` function with args
being a `map()` with `:method` and `url`  keys.

The url, being the REST paths published by Cypher Learning in their API documentation.
