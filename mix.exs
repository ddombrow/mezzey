defmodule Mezzey.Mixfile do
  use Mix.Project

  def project do
    [
      app: :mezzey,
      version: "0.1.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {Mezzey.Application, []},
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:cowboy, "~> 1.1"},
      {:plug, "~> 1.4"},
      {:poison, "~> 3.1"},
      {:absinthe, "~> 1.3"},
      {:absinthe_plug, "~> 1.3"}
    ]
  end
end
