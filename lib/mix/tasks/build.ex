defmodule Mix.Tasks.Build do
  use Mix.Task

  @target_file "lib/tabler_icons.ex"

  def run(_) do
    version = Mix.Tasks.Download.version()
    svg_path = Mix.Tasks.Download.svg_path()
    icons = Path.wildcard(Path.join(svg_path, "*.svg"))

    icons =
      Enum.map(icons, fn icon ->
        {function_name(icon),
         File.read!(icon)
         |> String.split("\n")
         |> Enum.reject(&String.contains?(&1, "svg"))
         |> Enum.map(&String.trim/1)}
      end)

    Mix.Generator.copy_template(
      "assets/tabler_icons.exs",
      @target_file,
      %{icons: icons, version: version},
      force: true
    )

    Mix.Task.run("format")
  end

  defp function_name(file) do
    file |> Path.basename() |> Path.rootname() |> do_function_name()
  end

  defp do_function_name("2fa"), do: "two_fa"
  defp do_function_name("3d-cube-sphere-off"), do: "three_d_cube_sphere_off"
  defp do_function_name("3d-cube-sphere"), do: "three_d_cube_sphere"
  defp do_function_name("3d-rotate"), do: "three_d_rotate"
  defp do_function_name("123"), do: "one_two_three"
  defp do_function_name("360-view"), do: "three_sixty_view"

  defp do_function_name(rootname) do
    String.split(rootname, "-") |> Enum.join("_")
  end
end
