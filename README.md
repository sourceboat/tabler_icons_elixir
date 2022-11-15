# TablerIcons

[Tabler Icons](https://tabler-icons.io/) are free and open source icons. This package provides Elixir functions in order to use [Tabler Icons](https://tabler-icons.io/) in your HTML, styled with arbitrary classes.

This package is strongly inspired by [herocicons_elixir](https://github.com/mveytsman/heroicons_elixir).

## Installation

The package can be installed by adding `tabler_icons` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:tabler_icons, "~> 0.1.0"}
  ]
end
```

## Usage

```
<TablerIcons.user />
```

You may pass arbitrary HTML attributes to the components:

```
<TablerIcons.user class="w-2 h-2" />
```
