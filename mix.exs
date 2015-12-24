defmodule Cloudinaryex.Mixfile do
  use Mix.Project

  def project do
    [app: :cloudinaryex,
     version: "0.0.2",
     elixir: "~> 1.1",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps,
     package: package,
     name: "Cloudinaryex",
     description: "A library for connecting with Cloudinary in Elixir",
     source_url: "https://github.com/micahwedemeyer/cloudinaryex"
   ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:httpoison, "~> 0.8.0"},
      {:poison, "~> 1.5.0"},
      {:timex, "~> 1.0.0-rc4"}
    ]
  end

  defp package do
    [ maintainers: ["Micah Wedemeyer"],
      licenses: ["MIT"],
      links: %{"Github" => "https://github.com/micahwedemeyer/cloudinaryex"} ]
  end
end
