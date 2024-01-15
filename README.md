# Tabler Icons

[![CI](https://github.com/sourceboat/ex_tabler_icons/actions/workflows/ci.yml/badge.svg)](https://github.com/sourceboat/ex_tabler_icons/actions/workflows/ci.yml)
[![Hex](https://img.shields.io/hexpm/v/tabler_icons.svg)](https://hex.pm/packages/tabler_icons)
[![Hex Docs](https://img.shields.io/badge/hex-docs-green)](https://hexdocs.pm/tabler_icons/TablerIcons.html)

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
