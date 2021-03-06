defmodule Extreme.System.Mixfile do
  use Mix.Project

  def project do
    [app: :extreme_system,
     version: "0.2.2",
     elixir: "~> 1.3.0 or ~> 1.4.0 or ~> 1.5.0",
     source_url: "https://github.com/exponentially/extreme_system",
     description: """
     Building blocks for distributed systems
     """,
     package: package(),
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     test_coverage: [tool: ExCoveralls],
     preferred_cli_env: ["coveralls": :test, "coveralls.detail": :test, "coveralls.post": :test, "coveralls.html": :test],
     deps: deps()]
  end

  def application do
    [
      applications: [
        :logger, :extreme, :amqp, :cachex
      ]
    ]
  end

  defp deps do
    [
      {:extreme, "~> 0.10.0"},
      {:cachex, "~> 2.1"},
      {:amqp,    "~> 0.1.4 or ~> 0.2.2"},
      {:ex_doc, ">= 0.11.4", only: [:dev]},
      {:earmark, ">= 0.0.0", only: [:dev]},
      {:inch_ex, ">= 0.0.0", only: :docs},
      {:excoveralls, "~> 0.6", only: :test},
    ]
  end

  defp package do
    [
      files: ["lib", "mix.exs", "README*", "LICENSE*"],
      maintainers: ["Milan Burmaja"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/exponentially/extreme_system"}
    ]
  end
end
