defmodule TablerIcons do
  @moduledoc """
  Provides precompiled icon compiles from [tabler-icons.io v<%= @version %>](tabler-icons.io).

  Tabler icons are maintained by [Paweł Kuna](https://twitter.com/codecalm).
  For all contributors see https://github.com/tabler/tabler-icons/graphs/contributors.

  Each icon is designed on a 24x24 grid and a 2px stroke.

  ## Usage

  ```heex
  <TablerIcons.user />
  ```

  You may pass arbitrary HTML attributes to the components:

  ```heex
  <TablerIcons.user class="w-2 h-2" />
  ```
  """
  use Phoenix.Component

  attr :rest, :global, default: %{"aria-hidden": "true", viewBox: "0 0 24 24", stroke: "currentColor"}
  attr :path, :string, required: true

  defp svg(assigns) do
    ~H"""
    <svg xmlns="http://www.w3.org/2000/svg" {@rest}>
      <%%= {:safe, @path} %>
    </svg>
    """
  end

  <%= for icon <- @icons, {func, path} = icon do %>
  @doc """
  Renders the `<%= func %>` icon.

  You may pass arbitrary HTML attributes to be applied to the svg tag.

  ## Examples
  ```heex
  <Heroicons.<%= func %> />
  <Heroicons.<%= func %> class="w-4 h-4" />
  ```
  """
  attr :rest, :global, doc: "the arbitrary HTML attributes for the svg container", include: ~w(stroke)

  def <%= func %>(assigns) do
    svg(assign(assigns, path: path))
  end
  <% end %>
end
