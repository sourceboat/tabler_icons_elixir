# Tabler Icons

[![CI](https://github.com/sourceboat/ex_tabler_icons/actions/workflows/ci.yml/badge.svg)](https://github.com/sourceboat/ex_tabler_icons/actions/workflows/ci.yml)
[![Hex](https://img.shields.io/hexpm/v/tabler_icons.svg)](https://hex.pm/packages/tabler_icons)
[![Hex Docs](https://img.shields.io/badge/hex-docs-green)](https://hexdocs.pm/tabler_icons/TablerIcons.html)

> [!CAUTION]
> We have stopped maintaining this package because there is a better way to integrate Tabler Icons into your project without using a package. 
> This package still supports the integration of Tabler Icons v2.47.0, but will not be updated to newer versions.
> It is recommended to integrate Tabler Icons via a Tailwind CSS plugin approach. See [Integrate Tabler Icons via Tailwind CSS Plugin](#integrate-tabler-icons-via-tailwind-css-plugin) for a detailed explanation.

[Tabler Icons](https://tabler-icons.io/) are free and open source icons. This package provides Elixir functions in order to use [Tabler Icons](https://tabler-icons.io/) in your HTML, styled with arbitrary classes.

This package is strongly inspired by [heroicons_elixir](https://github.com/mveytsman/heroicons_elixir).

> Note: As we are dealing with over 3.000 icons and an output file with more than 70.000 lines of code, the compile time may be longer than usual.

## Installation

The package can be installed by adding `tabler_icons` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:tabler_icons, "~> 0.5.0"}
  ]
end
```

## Usage

```eex
<TablerIcons.user />
<TablerIcons.icon name={:user} />
```

You may pass arbitrary HTML attributes to the components:

```eex
<TablerIcons.user class="w-2 h-2" />
<TablerIcons.icon name={:user} class="w-2 h-2" />
```

For additional information and list of all icons see [the docs](https://hexdocs.pm/tabler_icons/TablerIcons.html).

## Naming

We are interested in keeping the same icon names for our functions TablerIcons provides to us. Nevertheless, Elixir do not allow function names to begin with a number. Therefore we had to add some exceptions:

- `2fa` -> `two_fa`
- `3d-cube-sphere-off` -> `three_d_cube_sphere_off`
- `3d-cube-sphere` -> `three_d_cube_sphere`
- `3d-rotate` -> `three_d_rotate`
- `24-hours` -> `twenty_four_hours`
- `12-hours` -> `twelve_hours`
- `123` -> `one_two_three`
- `360-view` -> `three_sixty_view`
- `360` -> `three_sixty`

A hyphen is replaced by an underscore automatically.

## Update TablerIcons version

You can find the current TablerIcons version in `lib/tabler_icons.ex`.

Updating the TablerIcons version is usually done by the maintainers of this package so you may ignore this.

1. Check whether there are icon names that begin with a number and add exception to `lib/mix/tasks/build.ex` (add icon name to readme).
2. Update TablerIcons version in `lib/mix/tasks/download.ex`.
3. Run `mix download` in order to download newest icons into `/assets`.
4. Run `mix build` in order to build new `lib/tabler_icons.ex` file based on the icons.
5. Update version in `mix.exs`.
6. Update repository with the corresponding changes.
7. Release new version of the package.

## Integrate Tabler Icons via Tailwind CSS Plugin

The recommended way to integrate Tabler Icons into your project is to use a Tailwind CSS plugin. The following sections will give you a detailed explanation on how to update your project to integrate Tabler Icons without using a package. This approach is similar to how Phoenix includes Herocions in newly generated applications.

### Track the Tabler Icons source repository with Mix

The following code allows you to track the Tabler Icons source repository in your project dependencies.

```elixir
# mix.exs
defp deps do
  [
    ...
    {:tabler_icons,
      github: "tabler/tabler-icons", 
      sparse: "icons",
      app: false, 
      compile: false, 
      depth: 1}
  ]
end
```

### Add a Tailwind CSS plugin

Add the following code to your `tailwind.config.js` to create a Tailwind CSS plugin that extracts the icons from your dependencies and provides the necessary CSS to use them.

```js
// tailwind.config.js
const plugin = require('tailwindcss/plugin')
const fs = require('fs')
const path = require('path')

module.exports = {
  // ...
  plugins: [
    plugin(function ({ matchComponents, theme }) {
      const iconsDir = path.join(__dirname, "../deps/tabler_icons/icons")
      const values = {}
      const icons = [
        ["", "/outline"],
        ["-filled", "/filled"],
      ]
      icons.forEach(([suffix, dir]) => {
        fs.readdirSync(path.join(iconsDir, dir)).forEach(file => {
          const name = path.basename(file, ".svg") + suffix
          values[name] = { name, fullPath: path.join(iconsDir, dir, file) }
        })
      })
      matchComponents({
        "tabler": ({ name, fullPath }) => {
          const content = fs.readFileSync(fullPath).toString()
            .replace(/\r?\n|\r/g, "")
            .replace(/width="[^"]*"/, "")
            .replace(/height="[^"]*"/, "");

          return {
            [`--tabler-${name}`]: `url('data:image/svg+xml;utf8,${content}')`,
            "-webkit-mask": `var(--tabler-${name})`,
            "mask": `var(--tabler-${name})`,
            "mask-repeat": "no-repeat",
            "background-color": "currentColor",
            "vertical-align": "middle",
            "display": "inline-block",
            "width": theme("spacing.5"),
            "height": theme("spacing.5")
          }
        }
      }, { values })
    })
  ]
}
```

### Create an icon component

Add the following `icon` component to your `core_components.ex` to use Tabler Icons in your markup.

```elixir
defmodule MyAppWeb.CoreComponents do
  use Phoenix.Component

  attr :name, :string, required: true
  attr :class, :string, default: nil

  def icon(%{name: "tabler-" <> _} = assigns) do
    ~H"""
    <span class={[@name, @class]} />
    """
  end
end
```

You can use the component in your markup like this to use Tabler Icons:

```elixir
<.icon name="tabler-user" class="bg-red-600" />
```
