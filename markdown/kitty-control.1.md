---
title: KITTY-CONTROL
section: 1
header: User Manual
footer: kitty-control 1.0.2
date: February 06, 2024
---
# NAME
**kitty-control** - Control the Kitty terminal emulator from the command line

# SYNOPSIS
**kitty-control** [**-a**] [**back** color] [**-c** command] [**dark**] [**diff** [opts] path1 path2] [**-e**] [**-f**] [**font** [num]] [**fore** color] [**-i** /path/to/image] [**load** [subdir]] [**-m|t** match] [**-s** /path/to/socket] [**-u|h|v**] [**term**] [**theme**] [**tools**] [**icat** [opts] image] [**list|ls**] [**man**] [**menu**] [**title** title] [**transparent** [opacity]] [**unicode**] [**upgrade**]

# DESCRIPTION
**kitty-control** acts as a wrapper for the `Kitty` terminal emulator remote
control facility and `kittens`. Scripting some `kitty` customization enables
support for automation and provides an additional layer of convenience.

In particular, scripted `kitty` actions enables quick and easy switching between
preconfigured `kitty` configuration files without losing state or having to quit
`kitty` and restart with another configuration. This is accomplished through the
use of the `read_config.py` custom `kitten` included with `kitty-control`.

# COMMAND LINE OPTIONS
**-u**
: display usage message

**back color**
: Sets the background color to `color`. If `color` is `reset` restores foreground and background to startup value

**dark**
: Sets the Kitty background opacity to 1.0 (fully opaque). Can use `dark` or `opaque`

**diff [opts] 'file1|dir1' 'file2|dir2'**
: Displays differences using the `diff` kitten. Enclose [opts] and `file1/dir1` in quotes if [opts] are provided. See https://sw.kovidgoyal.net/kitty/kittens/diff/#options

**font num**
: Sets the font pointsize to `num`.
           Can use `font`, `fontsize`, `fontminus`, or `fontplus`.
           The second argument specifies the font size, either absolute, +, or -
           e.g. `kitty-control fontsize 24` would set the font size to 24 points,
                `kitty-control font +2` would increase the font size by 2 points,
                `kitty-control font` without argument resets the font size to default.

**fore color**
: Sets the foreground color to `color`. If `color` is `reset` restores foreground and background to startup value

**icat [opts] 'image'**
: Displays `image` using the Kitty `icat` kitten.
           Enclose [opts] and `image` in quotes if [opts] are provided.
           To remove all images currently displayed on the screen:
               kitty-control icat --clear.
           See https://sw.kovidgoyal.net/kitty/kittens/icat/#options

**list**
: Displays full information on Kitty windows.

**ls**
: Displays abbreviated information on Kitty windows.

**load [subdir]**
: Reloads the Kitty configuration in `~/.config/kitty/kitty.conf`.
           Can use `load` or `reload`.
           Specify a second argument to load `~/.config/kitty/`subdir`/kitty.conf`,
           e.g. `kitty-control load tv` would load `~/.config/kitty/tv/kitty.conf`,
           `kitty-control load default` loads the `~/.config/kitty/kitty.conf config`,
           `kitty-control load --help` displays a help message for the load command.

**man**
: Displays the kitty-control manual

**menu**
: Displays the kitty-control interactive menu system

**term**
: Displays information about the terminal using the query_terminal kitten

**theme**
: Displays the interactive theme selection kitten

**title 'tab title'**
: Sets the Kitty tab title to "tab title".
          Quote tab titles which contain spaces, e.g. "This Is My Tab Title".
          Use `-m match` to specify the tab to match.

**tools**
: Installs `figlet` and `ranger` if not already present (administrative privilege required)

**tran [opacity]**
: Sets the Kitty background opacity to 0.8.
           Can use `tran`, `opacity`, `trans` or `transparent`.
           Specify a second argument to set a custom background opacity:
           e.g. `kitty-control transparent 0.9`.

**unicode**
: Displays the Unicode input kitten

**upgrade**
: Upgrades Kitty and kitty-control to the latest version

**-a**
: Indicates modify all windows rather than just the currently active OS window

**-c command**
: Specifies a Kitty command to run (enclose command and arguments in quotes).
        Can be used to run arbitrary commands, e.g. `kitty-control -c get-colors`.

**-e**
: Displays several example invocations and exits

**-E**
: Displays full usage message with examples and exits

**-f**
: Indicates toggle fullscreen

**-h**
: Displays a full usage message and exits

**-i /path/to/image**
: Sets the background image for the specified Kitty windows.
        If /path/to/image is `none` then any existing image will be removed.

**-m `match`**
: Specifies the window to match

**-t `match`**
: Specifies the tab to match.
        Window/Tab matching can be used in conjunction with most kitty-control commands.
        If `match` is `--help` the Kitty documentation URL for matching will be displayed.

**-s /path/to/socket**
: Specifies the socket Kitty is listening on if enabled.
        If /path/to/socket is `--help` some help on configuring a Kitty socket is provided.
        `-s /path/...` can be used to send commands to Kitty from another terminal.

**-u**
: Displays a brief usage message and exits

**-v**
: Displays the kitty-control and kitty versions then exits

Without any arguments `kitty-control` displays an interactive menu system

Adjusting the background opacity or font size requires the original kitty.conf
that was used for this instance of Kitty to have enabled the following:

    `dynamic_background_opacity yes` and `allow_remote_control yes`

See https://sw.kovidgoyal.net/kitty/remote-control/#control-kitty-from-scripts

# ENVIRONMENT
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

# EXAMPLES
**kitty-control**
: Without any arguments `kitty-control` displays an interactive menu system

**kitty-control transparent 0.9**
: Set a transparent Kitty background with 0.9 opacity

**kitty-control dark**
: Set the Kitty background to fully opaque (no transparency)

**kitty-control back black fore white**
: Set the Kitty background color to black and foreground color to white

**kitty-control load laptop**
: Load the Kitty config in ~/.config/kitty/laptop/kitty.conf

**kitty-control font +2**
: Increase the font size by 2 points

**kitty-control -i ~/Pictures/groovy.png**
: Set the background image to ~/Pictures/groovy.png

**kitty-control -i ~/Pictures/groovy.png fore cyan font 24**
: Actions can be combined on the same command line

**kitty-control icat ~/Pictures/cats.png**
: View the image ~/Pictures/cats.png

**kitty-control diff /path/to/file1 /path/to/file2**
: View differences between /path/to/file1 and /path/to/file2

**kitty-control -m "title:borg" title "Borg Backup"**
: Set the tab title of the tab currently titled `~/src/borg` to `Borg Backup`

**kitty-control load default**
: Restore the original Kitty configuration


# AUTHORS
Written by Ronald Record &lt;github@ronrecord.com&gt;

# LICENSE
KITTY-CONTROL is distributed under an Open Source license.
See the file LICENSE in the KITTY-CONTROL source distribution
for information on terms &amp; conditions for accessing and
otherwise using KITTY-CONTROL and for a DISCLAIMER OF ALL WARRANTIES.

# BUGS
Submit bug reports online at: &lt;https://gitlab.com/doctorfree/kitty-control/issues&gt;

Full documentation and sources at: &lt;https://gitlab.com/doctorfree/kitty-control&gt;

