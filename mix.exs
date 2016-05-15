defmodule EdipAppTestCi.Mixfile do
  use Mix.Project

  def project do
    [app: :edib_app_test_ci,
     version: "0.3.0",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  def application do
    [applications: [
      :logger,
      :cmark, :fnv,
      :ralitobu, :ralitobu_plug,
      :strinx,
      :flasked,
    ]]
  end

  defp deps do
    [
      {:exrm, "~> 1.0"},
      {:cmark, "~> 0.6"},
      {:fnv, "~> 0.3"},
      {:ralitobu, "~> 0.1"},
      {:ralitobu_plug, "~> 0.1"},
      {:flasked, "~> 0.3"},
      {:strinx, "~> 0.2"},
    ]
  end
end
