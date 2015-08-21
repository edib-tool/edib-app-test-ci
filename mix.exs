defmodule EdipAppTestCi.Mixfile do
  use Mix.Project

  def project do
    [app: :edip_app_test_ci,
     version: "0.1.0",
     elixir: "~> 1.0",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  def application do
    [applications: [:logger, :cmark, :discount, :fnv, :strinx]]
  end

  defp deps do
    [
      {:cmark, nil},
      {:discount, nil},
      {:fnv, nil},
      {:strinx, github: "asaaki/strinx"},

      {:exrm, nil}
    ]
  end
end
