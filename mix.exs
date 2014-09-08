defmodule ExPermissions.Mixfile do
  use Mix.Project

  def project do
    [ app: :ex_permissions,
      version: version,
      name: "ExPermissions",
      description: "Utilities for clearly specifying permissions and flags for users, groups, and credentials.",
      source_url: "https://github.com/mtwilliams/ex_permissions",
      elixir: "~> 0.15.2-dev",
      homepage_url: "https://github.com/mtwilliams/ex_permissions",
      package: [links: %{"Website" => "https://github.com/mtwilliams/ex_permissions",
                         "Source" => "https://github.com/mtwilliams/ex_permissions"},
                contributors: ["Michael Williams"],
                licenses: ["Unlicense"]],
      deps: deps(Mix.env),
      docs: docs
    ]
  end

  def application do
    [applications: []]
  end

  def version do
    String.strip(File.read!("VERSION"))
  end

  defp deps(_) do
    []
  end

  defp docs do
    case System.cmd("git", ["rev-parse", "--verify", "--quiet", "HEAD"]) do
      {ref, 0} ->
        [source_ref: ref,
         readme: true,
         main: "README"]
      _ ->
        [readme: true,
         main: "README"]
    end
  end
end
