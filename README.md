<div align="center">
  <img src="https://raw.githubusercontent.com/wiki/doctorfree/kitty-control/kitty-control.png" style="width:1032px;height:123px;">
  <br />
Control some aspects of the Kitty terminal emulator from the command line
</div>

## Table of Contents

- [Overview](#overview)
- [Requirements](#requirements)
- [Install](#install)
- [Features](#features)
  - [Tools](#tools)
  - [Aliases](#aliases)
- [Usage](#usage)
  - [Menus](#menus)
  - [Man pages](#man-pages)
- [Screenshots](#screenshots)
- [Environment](#environment)
- [Examples](#examples)
    - [Example Kitty Configuration](#example-kitty-configuration)
- [Update](#update)
- [Uninstall](#uninstall)

## Overview

### Summary

`Kitty Control` is a command line tool to control some aspects of the `kitty`
terminal emulator. For example, with the alias `kc` for `kitty-control`, switch
`kitty` configurations depending on which monitor is being used:

```bash
# A convenience alias can be set in a shell initialization file (e.g. ~/.aliases)
alias kc='kitty-control'
# Switch to a Kitty configuration tailored for use on a larger monitor/tv
kc load tv
# Switch to a Kitty configuration tailored for use on a smaller monitor/laptop
kc load laptop
```

Increase or decrease the font pointsize:

```bash
# Increase the font pointsize by 4 points
kc font +4
# Decrease the font pointsize by 2 points
kc font -2
```

Many other aspects of `kitty` can be controlled using `kitty-control`. Scripting
the `Kitty` remote control facility enables many possibilities. Detect the
environment and automatically configure `kitty` from the command line or in a script.

### Background

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
and restart with another configuration. This is accomplished through the
use of the `read_config.py` custom `kitten` included with `kitty-control`
or the internal `load-config` kitten introduced in `kitty 0.32.2`.

Thus we have `kitty-control`, a `bash` script that intends to
simplify and ease those `kitty` customizations used fairly frequently.

## Requirements

`kitty-control` can be installed on `Linux` and `macOS` platforms
and requires [git](https://github.com/git-guides/install-git),
`bash`, and [curl](https://curl.se).

Additional `kitty` window info listing features are enabled if the
[jq JSON parser](https://jqlang.github.io/jq) is installed.

The `kitty` instance that is being controlled must have been started with
`allow_remote_control` enabled. In order to set the opacity level,
`dynamic_background_opacity` must also be enabled. These can be set in
`~/.config/kitty/kitty.conf` or on the command line. For example:

```bash
# In ~/.config/kitty/kitt.conf
allow_remote_control yes
dynamic_background_opacity yes
# On the command line
kitty --override allow_remote_control=yes --override dynamic_background_opacity=yes ...
```

## Install

### With curl

```bash
curl -sL https://raw.githubusercontent.com/doctorfree/kitty-control/main/install | bash /dev/stdin
```

### With a clone

```bash
git clone https://github.com/doctorfree/kitty-control
cd kitty-control
./install
# Add ~/.local/bin to the execution PATH environment variable
# echo "export PATH="$HOME/.local/bin:$PATH" >> $HOME/.bashrc
# source $HOME/.bashrc
```

**[NOTE:]** To force copying of all `neofetch` and `fastfetch` configuration files
regardless of whether an existing file of the same name exists, use `./install --force`

### From a release download

For example, to install `kitty-control` version 1.0.2 release 3:

```bash
wget -q -O /tmp/ins$$ https://github.com/doctorfree/kitty-control/releases/download/v1.0.2r3/install
chmod 755 /tmp/ins$$
/tmp/ins$$
rm -f /tmp/ins$$
```

## Features

The `kitty-control` command can be used to:

- Easily switch a running `kitty` instance configuration without restart
- Set various `kitty` configuration options on the fly including font size, background, foreground, window size
- Diff files or folders, selections are performed using the `ranger` file manager and `fzf` fuzzy finder
- Quickly and easily toggle fullscreen display of the `kitty` terminal window
- Set the `kitty` theme on the fly using the `kitty` **themes** `kitten`
- List colors, tabs, and windows
- Open an interactive menu system to easily browse `kitty-control` features and capabilities
- Display system and terminal information
- Set the level of opacity/transparency on the fly
- Input Unicode characters using the `kitty` **Unicode input** `kitten`
- Select and view an image using the `kitty` **icat** `kitten`
- Select and set a background image using `ranger` and `fzf`
- Set the `kitty` window layout using the `kitty` **goto-layout** `kitten`
- Browse the `kitty` documentation using the `kitty` **action** `kitten`
- Automates installation, version checks, and upgrades of `fastfetch`, `fzf`, `kitty`, and itself

The `kitty-control` installation also installs the `nfetch` and `ffetch` commands. This is
a wrapper script for `neofetch` and `fastfetch` to invoke `neofetch` or `fastfetch`
with the `kitty` image display protocol and one of several preinstalled configurations.

Usage message for `nfetch`:

```
Usage: nfetch [-a] [-c config] [-i /path/to/logo] [-r] [-u]
Where:
	-a indicates use ascii logo with neofetch
	-c 'config' specifies a configuration file to use
	   'config' can be the full path or name of a configuration
	   the configuration name can omit the prefacing 'config-'
	-i '/path/to/logo' specifies an image for neofetch to use
	-r indicates select configuration file randomly
	-u displays this usage messge and exits
Example:
	Use the configuration file ~/.config/neofetch/config-boxes.conf
		nfetch -c boxes

```

When invoked as `ffetch` it serves as a front-end to `fastfetch` with usage:

```
Usage: ffetch [-c config] [-r] [-u]
Where:
	-a indicates use ascii logo with neofetch
	-c 'config' specifies a configuration file to use
	   'config' can be the full path or name of a configuration
	   the configuration name can omit the prefacing 'config-'
	-i '/path/to/logo' specifies an image for neofetch to use
	-r indicates select configuration file randomly
	-u displays this usage messge and exits
Example:
	Use the configuration file ~/.config/fastfetch/config-hardware.jsonc
		ffetch -c hardware

```

### Tools

The `kitty-control` menu system uses `fzf`, `jq`, `ranger`,
`fastfetch/neofetch`, `lolcat`, and `figlet` if installed.

The [Ranger](https://github.com/ranger/ranger) file manager,
[Fzf](https://github.com/junegunn/fzf) fuzzy finder,
[jq](https://jqlang.github.io/jq) JSON processor,
[Fastfetch](https://github.com/fastfetch-cli/fastfetch) system info,
[Neofetch](https://github.com/LorenDB/neofetch) system info,
[Lolcat](https://github.com/busyloop/lolcat) rainbow coloring tool,
and [FIGlet](http://www.figlet.org) font text display programs are *NOT*
required by `kitty-control`. However, some additional features are enabled
if they are present.

`Fzf` is installed by the `install` command, the others are not. `FIGlet`,
`jq`, `Lolcat`, `Fastfetch`, and `Ranger` can be installed with the command:

```bash
kitty-control tools
```

Individual tools can be installed via the `kitty-control` menu interface.

The installation of `jq`, `ranger` and `figlet` require administrative privilege.

### Aliases

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
alias kitv='kitty-control -i ~/Pictures/Space.png load tv title "SONY Bravia"'
```

You may wish to set an alias to restore the default Kitty configuration:

```bash
alias kdef='kitty-control load default'
```

Sit back in your recliner with your [Framework laptop](https://frame.work/about),
wireless mouse and keyboard, connected 4K Ultra HD TV, a refreshing beverage,
and `kitty-control` at your fingertips.

## Usage

Invoking `kitty-control` without arguments displays an interactive menu system.
To display a usage message use `kitty-control -u`. To see several examples,
`kitty-control -e`. To display the full usage message run `kitty-control -h`.

```
Usage: kitty-control [-adefhuv] [back <color>] [-c command] [dark]
                     [diff [opts] <path1> <path2>] [font [num]] [fore <color>]
                     [-i /path/to/image] [icat [opts] <image>] [-k] [layout <name>]
                     [load [subdir|file]] [ls|list [self|colors|tabs|windows]] [-m|t <match>]
                     [man] [menu] [fetch] [-o doc] [-s /path/to/socket] [term] [theme] [tools]
                     [title <title>] [transparent [opacity]] [unicode] [upgrade] [-v]
Where:
    'back color' Sets the background color to 'color'
           If 'color' is 'reset' restores foreground and background to startup value
    'dark' Sets the Kitty background opacity to 1.0 (fully opaque)
           Can use 'dark' or 'opaque'
    'diff [opts] <file1|dir1> <file2|dir2>' Displays differences using the 'diff' kitten
           Enclose [opts] and <file1/dir1> in quotes if [opts] are provided
           See https://sw.kovidgoyal.net/kitty/kittens/diff/#options
    'fetch' Displays system information with fastfetch/neofetch
    'font num' Sets the font pointsize to 'num'
           Can use 'font', 'fontsize', 'fontminus', or 'fontplus'
           The second argument specifies the font size, either absolute, +, or -
           e.g. 'kitty-control fontsize 24' would set the font size to 24 points
                'kitty-control font +2' would increase the font size by 2 points
                'kitty-control font' without argument resets the font size to default
    'fore color' Sets the foreground color to 'color'
           If 'color' is 'reset' restores foreground and background to startup value
    'icat [opts] <image>' Displays <image> using the Kitty 'icat' kitten
           Enclose [opts] and <image> in quotes if [opts] are provided
           To remove all images currently displayed on the screen:
               kitty-control icat --clear
           See https://sw.kovidgoyal.net/kitty/kittens/icat/#options
    'list|ls [self|colors|tabs|windows]' Displays info on Kitty tabs/windows/colors
        'list' displays full info, 'ls' abbreviated info
        'self' Indicates display info for this Kitty window
        'colors' Indicates display the names of the supported Kitty colors
        'tabs|windows' Indicates display info on Kitty tabs or windows
    'layout <name>'
        Sets the Kitty window layout to '<name>' where '<name>' can be one of:
          Previous Fat Grid Horizontal Splits Stack Tall Vertical
    'load [subdir|file]' Reloads the Kitty configuration in ~/.config/kitty/kitty.conf
           Can use 'load' or 'reload'
           Specify a second argument to load ~/.config/kitty/<subdir>/kitty.conf
           e.g. 'kitty-control load tv' would load ~/.config/kitty/tv/kitty.conf
           This argument can also be the path to a Kitty configuration file to load
           'kitty-control load default' loads the ~/.config/kitty/kitty.conf config
           'kitty-control load --help' displays a help message for the load command
    'man' Displays the kitty-control manual
    'menu' Displays the kitty-control interactive menu system
    'size w h' Increases/decreases the window size 'w' and 'h' cells
           The 'w' argument specifies the window width adjustment in cells
           The 'h' argument specifies the window height adjustment in cells
           'kitty-control size 4 3' increases the window width by 4 cells and height by 3 cells
    'term' Displays information about the terminal using the query_terminal kitten
    'theme' Displays the interactive theme selection kitten
    'title <tab title>' Sets the Kitty tab title to "tab title"
          Quote tab titles which contain spaces, e.g. "This Is My Tab Title"
          Use '-m <match>' to specify the tab to match
    'tools' Installs 'figlet' 'jq' 'lolcat' 'fastfetch' and 'ranger' if not already present
    'tran [opacity]' Sets the Kitty background opacity to 0.8
           Can use 'tran', 'opacity', 'trans' or 'transparent'
           Specify a second argument to set a custom background opacity:
           e.g. 'kitty-control transparent 0.9'
    'unicode' Displays the Unicode input kitten
    'upgrade' Upgrades Kitty, Fastfetch, Fzf, and kitty-control if needed
    '-a' Indicates modify all windows rather than just the currently active OS window
    '-c command' specifies a Kitty command to run (enclose command and arguments in quotes)
        Can be used to run arbitrary commands, e.g. 'kitty-control -c get-colors'
    '-d' Debug mode - display commands when executed
    '-e' Displays several example invocations and exits
    '-f' Indicates toggle fullscreen
    '-h' Displays a full usage message and exits
    '-i /path/to/image' sets the background image for the specified Kitty windows
        If /path/to/image is 'none' then any existing image will be removed
    '-k' Indicates skip version checks and upgrade menu options
    '-m <match>' Specifies the window to match
    '-t <match>' Specifies the tab to match
        Window/Tab matching can be used in conjunction with most kitty-control commands
        If <match> is '--help' the Kitty documentation URL for matching will be displayed
    '-o doc' Opens the specified Kitty documentation in a browser
        'doc' can be one of:
            'conf' 'faq' 'remote' 'diff' 'icat' 'layout' 'ssh' 'themes' 'unicode' or 'man'
    '-s /path/to/socket' Specifies the socket Kitty is listening on if enabled
        If /path/to/socket is '--help' some help on configuring a Kitty socket is provided
        '-s /path/...' can be used to send commands to Kitty from another terminal
    '-u' Displays a brief usage message and exits
    '-v' Displays the kitty-control, fastfetch, fzf, and kitty versions then exits

Without any arguments 'kitty-control' displays an interactive menu system
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

Each of the '**single dash**' options described above has a
'**double dash**' equivalent. For example, `kitty-control -f`
is equivalent to `kitty-control --fullscreen`.

Similarly, each of the positional arguments without a prefacing dash
has a '**double dash**' equivalent. Simply prepend `--` before any
of these arguments.

Either form can be used:

| **Single Dash** | **Double Dash** |    | **No Dash** | **Double Dash** |
| --------------- | --------------- | -- | ----------- | --------------- |
|  `-a`           |  `--all`        |    |  `back`     |  `--back`       |
|  `-c`           |  `--command`    |    |  `dark`     |  `--dark`       |
|  `-i`           |  `--image`      |    |  `diff`     |  `--diff`       |
|  `-f`           |  `--fullscreen` |    |  `font`     |  `--font`       |
|  `-m`           |  `--match`      |    |  `fore`     |  `--fore`       |
|  `-s`           |  `--socket`     |    |  `icat`     |  `--icat`       |
|  `-t`           |  `--tab`        |    |  `list`     |  `--list`       |
|  `-e`           |  `--examples`   |    |  `load`     |  `--load`       |
|  `-h`           |  `--help`       |    |  `term`     |  `--term`       |
|  `-u`           |  `--usage`      |    |  `title`    |  `--title`      |
|  `-v`           |  `--version`    |    |  `theme`    |  `--theme`      |
|                 |                 |    |  `tran`     |  `--tran`       |
|                 |                 |    |  `unicode`  |  `--unicode`    |

### Menus

The `kitty-control` interactive menu system can be displayed with the command
`kitty-control menu` or by invoking `kitty-control` without arguments. The
main `kitty-control` menu can be used to perform many tasks including:

Set the background color, display examples, display the manual page, set the
window opacity, set the background image, set the font size, set options,
open the unicode input kitten, clear the background image, set the foreground
color, show usage and version, select and view an image, list tabs or windows,
select a `kitty` theme, diff files or directories, list windows, show terminal
info, load an alternate `kitty` configuration, toggle fullscreen, and more.

Shortcuts exist to quickly select a menu option:

|**Shortcut** / *Action*|**Shortcut** / *Action*|**Shortcut** / *Action*|**Shortcut** / *Action*|
| --------------------- | --------------------- | --------------------- | --------------------- |
| **a** / *about* | **b** / *background color* | **B** / *opaque* | **c** / *clear background image* |
| **C** / *list colors* | **d** / *diff files* | **D** / *diff folders* | **e** / *examples* |
| **f** / *font size* | **F** / *fullscreen* | **g** / *foreground color* | **h** / *help* |
| **i** / *background image* | **I** / *terminal info* | **k** / *list tabs* | **l** / *load config* |
| **L** / *layouts* | **m** / *manual* | **o** / *options* | **q** / *quit* |
| **r** / *reset* | **t** / *transparent* | **T** / *theme* | **u** / *usage* |
| **U** / *unicode input* | **v** / *view image* | **w** / *list windows* | **z** / *fuzzy select* |

Enter a menu option number or shortcut to select an option.

In the fuzzy selection dialogs, enter a few letters to fuzzy select from the options
or use the *Up-Arrow* and *Down-Arrow* keys to move through the options.
Press *Enter* to select the highlighted option.

Some of the main menu options bring up a submenu from which to further select.
For example, to view detailed information on a `kitty` window, select `w` or
`List Windows` from the main menu. This brings up a submenu that lists the
`kitty` windows along with a fuzzy selection dialog using `fzf`. Select a
window and detailed information on that window will be displayed. A similar
menu option exists to select a `kitty` tab for information display.

Note that the `kitty` window and tab information display via the menu interface
requires the `jq` JSON parsing utility. Without `jq` all window and tab info
is displayed.

### Man pages

UNIX style manual pages are installed for `kitty-control`, `nfetch`, and
`ffetch`. To view these manual pages use the `man` command: `man kitty-control`,
`man nfetch`, and `man ffetch`.

## Screenshots

The main `kitty-control` interactive menu provides dynamically generated
menu entries. For example, if either `kitty` or `kitty-control` have an
available upgrade then menu entries to upgrade will be added.

The `kitty-control` main menu:

![Main Menu](https://raw.githubusercontent.com/wiki/doctorfree/kitty-control/control-menu.png)

The `kitty` configuration selection `fzf` dialog:

![Select Config](https://raw.githubusercontent.com/wiki/doctorfree/kitty-control/select-conf.png)

The `kitty` window information selection menu:

![Window Info](https://raw.githubusercontent.com/wiki/doctorfree/kitty-control/list-windows.png)

The `kitty` documentation selection menu:

![Documentation Selection](https://raw.githubusercontent.com/wiki/doctorfree/kitty-control/doc-menu.png)

## Environment

Environment variables can be used to influence `kitty` behavior. See
https://sw.kovidgoyal.net/kitty/glossary/#environment-variables for
details on environment variables `kitty` uses. The `kitty-control`
command behavior depends on the `KITTY_LISTEN_ON` and
`KITTY_CONFIG_DIRECTORY` environment variables.

`KITTY_LISTEN_ON` is set automatically by `kitty` and specifies the
path to the socket `kitty` is listening on if one is configured.

`KITTY_CONFIG_DIRECTORY` can be set by the user to specify the directory
`kitty` and `kitty-control` search for configuration files and kittens.
Setting `KITTY_CONFIG_DIRECTORY` instructs `kitty` and `kitty-control`
to ignore files in `~/.config/kitty`.

For example, if `kitty` was started with the command:

```bash
kitty --override allow_remote_control=yes --listen-on unix:/tmp/mykitty
```

then `KITTY_LISTEN_ON` would be set to `unix:/tmp/mykitty` and `kitty-control`
would use that socket to communicate with `kitty`. The socket that
`kitty-control` uses can be overridden with the `-s /path/to/socket` command
line arguments. This can be used to tell `kitty-control` to communicate with
another instance of `kitty` or used when running `kitty-control` from a
non-kitty terminal or console.

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
kitty-control -i ~/Pictures/groovy.png
```

#### Actions can be combined on the same command line

```bash
kitty-control -i ~/Pictures/groovy.png fore cyan font 24
```

#### To view the image ~/Pictures/cats.png

```bash
kitty-control icat ~/Pictures/cats.png
```

#### To view differences between /path/to/file1 and /path/to/file2

```bash
kitty-control diff /path/to/file1 /path/to/file2
```

#### To set the tab title of the tab currently titled '~/src/borg' to 'Borg Backup'

```bash
kitty-control -m "title:borg" title "Borg Backup"
```

#### To restore the original Kitty configuration

```bash
kitty-control load default  # Or just 'kitty-control load'
```

### Example Kitty Configuration

Included in this repository is a reference Kitty configuration
[./config/kitty.conf](config/README.md)

This includes alternate configuration subdirectories, `laptop`, `ttys3`,
and `tv` with a `kitty.conf` in each.  Also included are Python scripts,
example `kitty` sessions, and some advanced `kitty` configuration.

The reference configuration is installed in `~/.config/kitty/kitty-control`
and a Kitty session using this configuration can be started with:

```bash
kitty --config ~/.config/kitty/kitty-control/kitty.conf --session ~/.config/kitty/kitty-control/sessions/startup --title 'Reference Kitty Terminal Session'
```

This uses `zsh`. To use `bash` invoke with:

```bash
kitty --config ~/.config/kitty/kitty-control/kitty-bash.conf --session ~/.config/kitty/kitty-control/sessions/startup-bash --title 'Reference Kitty Terminal Session'
```

The reference `kitty` configuration provided here is not required for use with
`kitty-control`. It is provided as reference with the hope that it will be
helpful in tailoring your own configuration.

## Update

To update `kitty-control` execute the command `kitty-control upgrade`. This will
also upgrade `kitty`, `fastfetch`, and `fzf` if updates are available.

Alternately, an update can be performed with `curl`:

```bash
curl -sL https://raw.githubusercontent.com/doctorfree/kitty-control/main/install | bash /dev/stdin
```

Updates can also be performed with a `git pull` in the cloned `kitty-control`
directory:

```bash
cd /path/to/cloned/repository
git pull
./install
```

## Uninstall

```bash
cd /path/to/cloned/repository
./uninstall
```

Uninstalling `kittyy-control` removes the `kitty-control` script,
`read_config.py` kitten, the man page in
`~/.local/share/man/man1/kitty-control.1`, and the reference `kitty`
configuration in `~/.config/kitty/kitty-control/`.

The `uninstall` script does not remove the cloned repository.
To remove the cloned repository as well:

```bash
cd /path/to/cloned/kitty-control/..
rm -rf kitty-control
```

