defmodule Cyphi.MixProject do
  use Mix.Project

  def project do
    [
      app: :cyphi,
      version: "0.1.0",
      elixir: "~> 1.18",
      name: "Cyphi",
      description: "Cypher Learning API 3.0 REST adapter.",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      test_coverage: [tool: ExCoveralls],
      package: package(),
      deps: deps()
    ]
  end

  def cli do
    [
      preferred_envs: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test,
        "coveralls.cobertura": :test
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:credo, "~> 1.7", only: [:dev, :test], runtime: false},
      {:ex_doc, "~> 0.39", only: :dev},
      {:excoveralls, "~> 0.18", only: :test},
      {:mix_audit, "~> 2.1", only: [:dev, :test], runtime: false},
      {:oapi_generator, "~> 0.4", only: :dev, runtime: false},
      {:req, "~> 0.5"},
      {:sobelow, "~> 0.13", only: [:dev, :test], runtime: false}
    ]
  end

  defp package do
    [
      files: ["lib", "mix.exs", "README.md"],
      maintainers: ["Javier Guerra"],
      licenses: ["MIT"],
      links: %{
        "GitHub" => "https://github.com/amco/cyphi",
        "Docs" => "https://hexdocs.pm/cyphi"
      }
    ]
  end
end
