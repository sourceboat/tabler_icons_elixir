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

For additional information and list of all icons see [the docs](https://hexdocs.pm/tabler_icons/api-reference.html).

## Naming

We are interested in keeping the same icon names for our functions TablerIcons provides to us. Nevertheless, Elixir do not allow function names to begin with a number. Therefore we had to add some exceptions:

- `2fa` -> `two_fa`
- `3d-cube-sphere-off` -> `three_d_cube_sphere_off`
- `3d-cube-sphere` -> `three_d_cube_sphere`
- `3d-rotate` -> `three_d_rotate`
- `123` -> `one_two_three`
- `360-view` -> `three_sixty_view`

A hyphen is replaced by an underscore automatically.

## Update TablerIcons version

Updating the TablerIcons version is usually done by the maintainers of this package so you may ignore this.

You can find the current TablerIcons version in `lib/tabler_icons.ex`.

1. Check whether there are icon names that begin with a number and add exception to `lib/mix/tasks/build.ex` (add icon name to readme).
2. Update TablerIcons version in `lib/mix/tasks/download.ex`.
3. Run `mix download` in order to download newest icons into `/assets`.
4. Run `mix build` in order to build new `lib/tabler_icons.ex` file based on the icons.
5. Update repository with the corresponding changes.
6. Release new version of the package.
