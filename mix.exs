defmodule EdipAppTestCi.Mixfile do
  use Mix.Project

  def project do
    [app: :edib_app_test_ci,
     version: "0.1.0",
     elixir: "~> 1.0",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  def application do
    [applications: [:logger, :cmark, :fnv]]
  end

  defp deps do
    [
      {:exrm, "~> 0.19"},
      {:cmark, "~> 0.5"},
      {:fnv, "~> 0.2"},
    ]
  end
end
