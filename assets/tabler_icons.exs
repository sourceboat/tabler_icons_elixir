defmodule TablerIcons do
  @moduledoc """
  Provides precompiled icon compiles from [tabler-icons.io v<%= @version %>](tabler-icons.io).

  Tabler icons are maintained by [Paweł Kuna](https://twitter.com/codecalm).
  For all contributors see https://github.com/tabler/tabler-icons/graphs/contributors.

  Each icon is designed on a 24x24 grid and a 2px stroke.

  ## Usage

      <TablerIcons.user />
      <TablerIcons.icon name={:user} />

  You may pass arbitrary HTML attributes to the component.

      <TablerIcons.user class="w-2 h-2" />
      <TablerIcons.icon name={:user} class="w-2 h-2" />
  """
  use Phoenix.Component

  @default_html_attrs %{
    width: "24",
    height: "24",
    viewBox: "0 0 24 24",
    "stroke-width": "2",
    stroke: "currentColor",
    fill: "none",
    "stroke-linecap": "round",
    "stroke-linejoin": "round"
  }

  @doc """
  Renders an icon dynamically.

  ## Examples

      <TablerIcons.icon name={:user} />
      <TablerIcons.icon name={:user} class="w-4 h-4" />
  """

  attr :rest, :global, doc: "arbitrary HTML attributes for the svg container", default: @default_html_attrs
  attr :name, :atom, required: true, doc: "the name of the icon to be rendered"

  def icon(assigns) do
    apply(TablerIcons, assigns.name, [assigns])
  end

  <%= for {func, paths} <- @icons do %>
  @doc """
  Renders the `<%= func %>` icon.

  You may pass arbitrary HTML attributes to the component.

  ## Examples

      <TablerIcons.<%= func %> />
      <TablerIcons.<%= func %> class="w-4 h-4" />
  """
  attr :rest, :global, doc: "arbitrary HTML attributes for the svg container", default: @default_html_attrs

  def <%= func %>(assigns) do
    ~H"""
    <svg
      xmlns="http://www.w3.org/2000/svg"
      {@rest}
    >
      <%= for path <- paths, do: path <> "\n" %>
    </svg>
    """
  end
  <% end %>
end
