# kitty-control

Control some aspects of the `Kitty` terminal emulator from the command line

## Table of Contents

- [Overview](#overview)
- [Install](#install)
- [Usage](#usage)
- [Examples](#examples)
    - [Example Kitty Configuration](#example-kitty-configuration)
- [Update](#update)

## Overview

The [Kitty terminal emulator](https://sw.kovidgoyal.net/kitty) has a very
powerful system that allows remote control from the shell prompt, even
over SSH. You can change colors, fonts, open new windows, tabs, set their
titles, change window layout, get text from one window and send text to
another, and much more.

In addition, `kitty` is [highly configurable](https://sw.kovidgoyal.net/kitty/conf)
and can be [controlled from scripts](https://sw.kovidgoyal.net/kitty/remote-control).

Kitty users frequently adjust many of these customizable settings to better
suit the environment in which `kitty` runs. For example, it is often necessary
to adjust the font size or opacity, use alternate configations, toggle
fullscreen display, set tab titles, change foreground and background color,
adjust background transparency or set a background image. Many `kitty`
configuration settings can be modified with defined keymaps and set on the fly
with a couple of keystrokes. Others require a little more effort, knowledge,
and memory (human memory).

Scripting some `kitty` customization enables support for automation and
provides an additional layer of convenience. In particular, scripted
`kitty` actions enables quick and easy switching between preconfigured
`kitty` configuration files without losing state or having to quit `kitty`
and restart with another configuration.

Thus we have `kitty-control`, a `bash` script that intends to
simplify and ease those `kitty` customizations used fairly frequently.

## Install

```bash
git clone https://github.com/doctorfree/kitty-control
mkdir -p ~/.local/bin
cp kitty-control/kitty-control ~/.local/bin/kitty-control
chmod 755 ~/.local/bin/kitty-control
# Add ~/.local/bin to the execution PATH environment variable
# echo "export PATH="$HOME/.local/bin:$PATH" >> $HOME/.bashrc
# source $HOME/.bashrc
```

For convenience, alias `kitty-control` to `kc` by adding
`alias kc='kitty-control'` to your shell initialization (e.g. `~/.aliases`).

After installing and aliasing as described above, `kc dark` sets the opacity
to 1.0, `kc font +4` increases the font pointsize by 4, `kc tran 0.8` sets a
transparent background with opacity 0.8.

See the [Examples](#examples) section below for more example invocations.

Additional aliases can be used to provide further convenience. For example,
`alias big='kitty-control font 32'` and `alias normal='kitty-control font 22'`
enables quick and easy switching between font pointsizes 32 and 22 with
the commands `big` and `normal`. You can go nuts with this:

```bash
alias kitv='kitty-control -b ~/Pictures/Space.png load tv title "SONY Bravia"'
```

You may wish to set an alias to restore the default Kitty configuration:

```bash
alias kdef='kitty-control load default'
```

Sit back in your recliner with your [Framework laptop](https://frame.work/about),
wireless mouse and keyboard, connected 4K Ultra HD TV, a refreshing beverage,
and `kitty-control` at your fingertips.

## Usage

Invoking `kitty-control` without arguments displays a brief usage message
and exits. To display a full usage message use `kitty-control -u`. To see
several examples, `kitty-control -e`. To display the full usage message and
examples run `kitty-control -h`.

```
Usage: kitty-control [-a] [-b /path/to/image] [-e] [-f] [-m <match>] [-t <match>]
           [-s /path/to/socket] [-u | -h] [back <color>] [dark] [fore <color>]
           [font [num]] [list] [load [subdir]] [title <title>] [tran [opacity]]
Where:
    'back color' Sets the background color to 'color'
           If 'color' is 'reset' restores foreground and background to startup value
    'dark' Sets the Kitty background opacity to 1.0 (fully opaque)
           Can use 'dark' or 'opaque'
    'font num' Sets the font pointsize to 'num'
           Can use 'font', 'fontsize', 'fontminus', or 'fontplus'
           The second argument specifies the font size, either absolute, +, or -
           e.g. 'kitty-control fontsize 24' would set the font size to 24 points
                'kitty-control font +2' would increase the font size by 2 points
                'kitty-control font' without argument resets the font size to default
    'fore color' Sets the foreground color to 'color'
           If 'color' is 'reset' restores foreground and background to startup value
    'list' Displays information on Kitty windows
    'load [subdir]' Reloads the Kitty configuration in ~/.config/kitty/kitty.conf
           Can use 'load' or 'reload'
           Specify a second argument to load ~/.config/kitty/<subdir>/kitty.conf
           e.g. 'kitty-control load tv' would load ~/.config/kitty/tv/kitty.conf
           'kitty-control load default' restores the kitty.conf used to start this instance
           'kitty-control load --help' displays a help message for the load command
    'title <tab title>' Sets the Kitty tab title to "tab title"
          Quote tab titles which contain spaces, e.g. "This Is My Tab Title"
          Use '-m <match>' to specify the tab to match
    'tran [opacity]' Sets the Kitty background opacity to 0.8
           Can use 'tran', 'opacity', 'trans' or 'transparent'
           Specify a second argument to set a custom background opacity:
           e.g. 'kitty-control transparent 0.9'
    '-a' Indicates modify all windows rather than just the currently active OS window
    '-b /path/to/image' sets the background image for the specified Kitty windows
        If /path/to/image is 'none' then any existing image will be removed
    '-e' Displays several example invocations and exits
    '-f' Indicates toggle fullscreen
    '-m <match>' Specifies the window to match
    '-t <match>' Specifies the tab to match
        Window/Tab matching can be used in conjunction with most kitty-control commands
        If <match> is '--help' the Kitty documentation URL for matching will be displayed
    '-s /path/to/socket' Specifies the socket Kitty is listening on if enabled
        If /path/to/socket is '--help' some help on configuring a Kitty socket is provided
    '-u' Displays the usage message and exits
    '-h' Displays the usage message with examples and exits
Adjusting the background opacity or font size requires the original kitty.conf
that was used for this instance of Kitty to have enabled the following:
    'dynamic_background_opacity yes' and 'allow_remote_control yes'
See https://sw.kovidgoyal.net/kitty/remote-control/#control-kitty-from-scripts
```

Several of the `kitty-control` commands have a help option, `--help`. To view
a brief help message for the `load` command run `kitty-control load --help`.

To view a brief help message for the socket configuration run
`kitty-control -s --help`.

To display the `kitty` documentation URL for window/tab matching syntax run
`kitty-control -m --help` or `kitty-control -t --help`.

## Examples

### Example invocations of kitty-control

#### To set a transparent Kitty background with 0.9 opacity

```bash
kitty-control tran 0.9
```

#### To set the Kitty background to fully opaque (no transparency)

```bash
kitty-control dark
```

#### To set the Kitty background color to black and foreground color to white

```bash
kitty-control back black fore white
```

#### To load the Kitty config in ~/.config/kitty/laptop/kitty.conf

```bash
kitty-control load laptop
```

#### To increase the font size by 2 points

```bash
kitty-control font +2
```

#### To set the background image to ~/Pictures/groovy.png

```bash
kitty-control -b ~/Pictures/groovy.png
```

#### Actions can be combined on the same command line

```bash
kitty-control -b ~/Pictures/groovy.png fore cyan font 24
```

#### Order is sometimes important, especially when switching configs

Most arguments are not order sensitive. For example, to change configs
and set a background image while toggling fullscreen mode:

```bash
kitty-control -b ~/Pictures/Earth.png -f load tv  # Any order here will be ok
```

However, when using multiple commands with the `load` command, order becomes
important. For example:

```bash
kitty-control font -4 load laptop # The 'font -4' is overridden by the new config
```

Instead, load the specified config first then apply the fontsize change:

```bash
kitty-control load laptop font -4
```

#### To set the tab title of the tab currently titled '~/src/borg' to 'Borg Backup'

```bash
`kitty-control -m "title:borg" title "Borg Backup"
```

#### To restore the original Kitty configuration

```bash
`kitty-control load default
```

### Example Kitty Configuration

Included in this repository is a full
[example Kitty configuration](config/README.md) in the `./config/` subdirectory.
This example configuration is provided for reference. It includes two
configuration subdirectories, `laptop` and `tv` with a `kitty.conf` in each.
Also included are `kitty` themes, Python scripts, example `kitty` sessions,
and some advanced `kitty` configuration. The example sessions rely on some
external facilities that may not be present like `btop` but the configuration
should be close to usable out of the box. To install this example configuration
copy the `config` directory to somewhere like `~/.config/kitty-example/`:

```bash
cp -a config ~/.config/kitty-example
kitty --config ~/.config/kitty-example/kitty.conf --session ~/.config/kitty-example/sessions/startup --title 'Example Kitty Terminal Session'
```

This uses `zsh`. To use `bash` invoke with:

```bash
kitty --config ~/.config/kitty-example/kitty-bash.conf --session ~/.config/kitty-example/sessions/startup-bash --title 'Example Kitty Terminal Session'
```

The example `kitty` configuration provided here is not required for use with
`kitty-control`. It is provided as reference with the hope that it will be
helpful in tailoring your own configuration.

## Update

To update `kitty-control` perform a `git pull` in the cloned `kitty-control`
directory:

```bash
cd /path/to/cloned/repository
git pull
cp kitty-control ~/.local/bin/kitty-control
```
