defmodule TablerIconsTest do
  use ExUnit.Case, async: true

  import Phoenix.LiveViewTest

  setup do
    Mix.Task.run("build")
    {:ok, assigns: %{__changed__: nil}}
  end

  test "icon" do
    assert render_component(&TablerIcons.user/1, %{}) ==
             ~s|<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"24\" height=\"24\" viewBox=\"0 0 24 24\" stroke-width=\"2\" stroke=\"currentColor\" fill=\"none\" stroke-linecap=\"round\" stroke-linejoin=\"round\">\n  <path stroke=\"none\" d=\"M0 0h24v24H0z\" fill=\"none\"></path>\n  <path d=\"M8 7a4 4 0 1 0 8 0a4 4 0 0 0 -8 0\"></path>\n  <path d=\"M6 21v-2a4 4 0 0 1 4 -4h4a4 4 0 0 1 4 4v2\"></path>\n</svg>|

    assert render_component(&TablerIcons.user/1, %{class: "w-2 h-2"}) ==
             ~s|<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"24\" class=\"w-2 h-2\" height=\"24\" viewBox=\"0 0 24 24\" stroke-width=\"2\" stroke=\"currentColor\" fill=\"none\" stroke-linecap=\"round\" stroke-linejoin=\"round\">\n  <path stroke=\"none\" d=\"M0 0h24v24H0z\" fill=\"none\"></path>\n  <path d=\"M8 7a4 4 0 1 0 8 0a4 4 0 0 0 -8 0\"></path>\n  <path d=\"M6 21v-2a4 4 0 0 1 4 -4h4a4 4 0 0 1 4 4v2\"></path>\n</svg>|

    assert render_component(&TablerIcons.user/1, %{"stroke-width": "1"}) ==
             ~s|<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"24\" height=\"24\" viewBox=\"0 0 24 24\" stroke-width=\"1\" stroke=\"currentColor\" fill=\"none\" stroke-linecap=\"round\" stroke-linejoin=\"round\">\n  <path stroke=\"none\" d=\"M0 0h24v24H0z\" fill=\"none\"></path>\n  <path d=\"M8 7a4 4 0 1 0 8 0a4 4 0 0 0 -8 0\"></path>\n  <path d=\"M6 21v-2a4 4 0 0 1 4 -4h4a4 4 0 0 1 4 4v2\"></path>\n</svg>|
  end

  test "dynamic icon" do
    assert render_component(&TablerIcons.icon/1, %{name: :user}) ==
             ~s|<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"24\" height=\"24\" viewBox=\"0 0 24 24\" stroke-width=\"2\" stroke=\"currentColor\" fill=\"none\" stroke-linecap=\"round\" stroke-linejoin=\"round\">\n  <path stroke=\"none\" d=\"M0 0h24v24H0z\" fill=\"none\"></path>\n  <path d=\"M8 7a4 4 0 1 0 8 0a4 4 0 0 0 -8 0\"></path>\n  <path d=\"M6 21v-2a4 4 0 0 1 4 -4h4a4 4 0 0 1 4 4v2\"></path>\n</svg>|

    assert render_component(&TablerIcons.icon/1, %{name: :user, class: "w-2 h-2"}) ==
             ~s|<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"24\" class=\"w-2 h-2\" height=\"24\" viewBox=\"0 0 24 24\" stroke-width=\"2\" stroke=\"currentColor\" fill=\"none\" stroke-linecap=\"round\" stroke-linejoin=\"round\">\n  <path stroke=\"none\" d=\"M0 0h24v24H0z\" fill=\"none\"></path>\n  <path d=\"M8 7a4 4 0 1 0 8 0a4 4 0 0 0 -8 0\"></path>\n  <path d=\"M6 21v-2a4 4 0 0 1 4 -4h4a4 4 0 0 1 4 4v2\"></path>\n</svg>|

    assert render_component(&TablerIcons.icon/1, %{name: :user, "stroke-width": "1"}) ==
             ~s|<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"24\" height=\"24\" viewBox=\"0 0 24 24\" stroke-width=\"1\" stroke=\"currentColor\" fill=\"none\" stroke-linecap=\"round\" stroke-linejoin=\"round\">\n  <path stroke=\"none\" d=\"M0 0h24v24H0z\" fill=\"none\"></path>\n  <path d=\"M8 7a4 4 0 1 0 8 0a4 4 0 0 0 -8 0\"></path>\n  <path d=\"M6 21v-2a4 4 0 0 1 4 -4h4a4 4 0 0 1 4 4v2\"></path>\n</svg>|
  end

  test "generated docs" do
    {:docs_v1, _annotation, _beam_language, _format, _module_doc, _metadata, docs} = Code.fetch_docs(TablerIcons)

    doc =
      Enum.find_value(docs, fn
        {{:function, :user, 1}, _annotation, _signature, doc, _metadata} -> doc
        _ -> nil
      end)

    assert doc["en"] ==
             """
             Renders the `user` icon.

             You may pass arbitrary HTML attributes to the component.

             ## Examples

                 <TablerIcons.user />
                 <TablerIcons.user class="w-4 h-4" />

             ## Attributes

             * Global attributes are accepted. arbitrary HTML attributes for the svg container.
             """
  end
end
