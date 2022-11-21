# Tabler Icons

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

```eex
<TablerIcons.user />
```

You may pass arbitrary HTML attributes to the components:

```eex
<TablerIcons.user class="w-2 h-2" />
```

## Update TablerIcons version

Updating the TablerIcons version is usually done by the maintainers of this package so you may ignore this.

You can find the current TablerIcons version in `lib/tabler_icons.ex`.

1. Update TablerIcons version in `lib/mix/tasks/download.ex`.
2. Run `mix download` in order to download newest icons into `/assets`.
3. Run `mix build` in order to build new `lib/tabler_icons.ex` file based on the icons.
4. Update repository with the corresponding changes.
5. Release new version of the package.
