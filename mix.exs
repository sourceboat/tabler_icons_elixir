defmodule TablerIcons.MixProject do
  use Mix.Project

  @source_url "https://github.com/sourceboat/ex_tabler_icons"

  defp description do
    """
    Tabler Icons as Phoenix.Component. Strongly inspired by heroicons elixir package.
    """
  end

  defp package do
    [
      files: ["lib", "mix.exs", "README*", "LICENSE*"],
      maintainers: ["Florian Arens", "Lennart Büttner"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/sourceboat/ex_tabler_icons"}
    ]
  end

  def project do
    [
      app: :tabler_icons,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: description(),
      package: package(),
      xref: [exclude: [:httpc, :public_key]],
      name: "Tabler Icons",
      source_url: @source_url,
      docs: docs()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:castore, ">= 0.0.0"},
      {:phoenix_live_view, "~> 0.18.3"},
      {:ex_doc, "~> 0.29.0", only: :dev, runtime: false}
    ]
  end

  defp docs do
    [
      source_ref: "main",
      source_url_pattern: "#{@source_url}/blob/main/%{path}#L%{line}"
    ]
  end
end
