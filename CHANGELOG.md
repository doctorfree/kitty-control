# Changelog

## Unreleased

### ⚡️ Added

### 🐞 Fixed

- Check for `figlet` font dir before removing in `uninstall`

## v1.0.7r1

### ⚡️ Added

- Install `JetBrains Mono Nerd Font`

### 🐞 Fixed

- Fix `install` script symlink for `kitten`
- Fix `macOS` user font directory location
- Leave internal `kitty` config load command disabled for now until in release

## v1.0.6r3

### ⚡️ Added

- Install `rich-cli` in a Python virtual environment if not already present

### 🐞 Fixed

- Exec `kitty-control` after upgrading so we are running the upgrade
- Format `About` and `Usage` if `rich` not available
- Remove dupliate screen clear when displaying heading

## v1.0.6r2

### ⚡️ Added

- Add `Window Layout` selection support
- Add `layout name` command line arguments to specify a window layout
- Add help for `Window Layout`

### 🐞 Fixed

- Move some `fzf` selection dialogs inside `while` loop

## v1.0.6r1

### ⚡️ Added

- Add `About` entry to `Usage` menu
- Add shortcuts to `Usage` menu and `u` shortcut to main menu
- Add shortcuts to all main menu entries
- Add `Fuzzy Select` option to main menu
- Align main menu shortcuts

### 🐞 Fixed

- Fix background image match in `Fuzzy Select` dialog
- Remove image background before setting it
- Remove `Fuzzy Select` menu entry when entering `Fuzzy Select` dialog
- Add `List Tabs` to `List Windows` menu
- Add `List Windows` to `List Tabs` menu
- All single character shortcuts in main menu

## v1.0.5r4

### ⚡️ Added

- Add header to color names list

### 🐞 Fixed

- Moved `read_config.py` kitten from `~/.config/kitty/` to `~/.config/kitty/kitty-control/`
- Link `~/.config/kitty/read_config.py` to new kitten location
- Support for `man` menu keyword and `m` shortcut for manual page display

## v1.0.5r3

### ⚡️ Added

- Add support for listing the supported `kitty` color names with `kitty-control ls colors`
- Map `kitty` color names to `rich-cli` color names when listing colors
- Add `C` to shortcuts for colors list

### 🐞 Fixed

- Format color names list

## v1.0.5r2

### ⚡️ Added

- Add support for specifying an arbitrary `kitty` config to load on the command line
- Add menu support for selecting an arbitrary `kitty` config to load
- Add `Reset` main menu option to reset colors and configuration to defaults

### 🐞 Fixed

- Add all `kitty` supported color names to `colors` array for color selections

## v1.0.5r1

### ⚡️ Added

- Add menu option to list `kitty` tabs as well as windows
- Colorize man page display with `tput` and `LESS_TERMCAP_*` settings
- Add section on menu system to `README` and man page

### 🐞 Fixed

- Scale background image
- Improve `fzf` prompts
- Do not enter usage menu after display of examples

## v1.0.4r3

### ⚡️ Added

- If `jq` available present menu of `kitty` windows, select window for info
- Add `All Windows` to window info menu
- Use color output for window info list if `jq` available

### 🐞 Fixed

- Fix selection of window for info if `fzf` not available
- Adjust some `fzf` window heights

## v1.0.4r2

### ⚡️ Added

- Add debug mode switch `-d` and Options menu entry to toggle
- Add `pathadd` function to add to `PATH`
- Install custom Kitty icons on `macOS` as well
- Install custom `ranger` configuration when `ranger` is installed

### 🐞 Fixed

- Use `file -L ...` to follow symlinks in file type check
- Make sure `~/.local/bin` and `~/.fzf/bin` are in `PATH`
- Improve `fzf` upgrade on `macOS`
- Adjust `Options` menu size and prompt
- Shorten some main menu option entries
- Cleanup cloned `kitty-control` repository if download fails
- Redirect `git` and `make` output to `/dev/null` in builds

## v1.0.4r1

### ⚡️ Added

- Simplify test for load-config-file
- Install nicer `Kitty` icons
- Add `Requirements` section to `README`
- Install `kitty` if not installed
- Add windows listing with `jq` if installed
- Link to `read_config.py` in reference config
- Support 2 levels deep `Kitty` configs in `~/.config/kitty/.../.../kitty.conf`
- Add 'ls' to man page

### 🐞 Fixed

- `Info/Help` and man page formatting
- Remain in `fzf` selection menu until `Main Menu` is selected or `Esc`
- Deleted unused `Kitty` themes
- Cleanup versions message

## v1.0.3r2

### ⚡️ Added

- Install reference config as `~/.config/kitty/kitty-control/`
- Check for `fzf` updates and add `fzf` upgrade options
- Set `fzf` colors and theme in `FZF_DEFAULT_OPTS`
- Add `custom` to `colors` array to allow entry of custom foreground/background colors
- Add `Options` menu to set some remote control options and toggle tools use

### 🐞 Fixed

- Remove `example2` config
- Rename reference config dir to `config`
- Use Folke `tokyonight` themes in reference configs
- Preserve any previously set options and use as defaults in Options menu
- Fix argument processing so options can be set and interactive menu still comes up
- Catch all `fzf` escape keystrokes

## v1.0.3r1

### ⚡️ Added

- Add shortcut to enable `fzf` fuzzy selection of main menu entries
- Add toggle for `figlet`, `fzf`, `ranger` use in main menu
- Add `ENVIRONMENT` section to man page
- Use `show_help` in fzf selection help

### 🐞 Fixed

- Adjust shortcuts
- Fix `fzf` escape
- Shorten height of `fzf` selection window

## v1.0.2r4

### ⚡️ Added

- Add installation methods with `curl` and `wget` to readme
- Add screenshot of main menu to readme

### 🐞 Fixed

- Use `select` menu if no `fzf` available
- Increase number of font sizes selectable in menu
- Increase number of opacity choices selectable in menu

## v1.0.2r3

### ⚡️ Added

- Add support for upgrades to both `kitty` and `kitty-control`
- Add `kitty-control` man page
- Add `kitty-control man` option to display man page

### 🐞 Fixed

- Fix version/release retrieval

## v1.0.2r2

### ⚡️ Added

- Get available `kitty` and `kitty-control` versions and add them to output of `-v`
- Add install tools option and menu support for installing `figlet` and `ranger`
- Add menu help and menu shortcut keywords

### 🐞 Fixed

- Check `Kitty` version and upgrade only if not current

## v1.0.2r1

### ⚡️ Added

- Add interactive menu system
- Install `fzf`
- Add usage menu
- Add support for both Linux and macOS
- Add figlet fonts
- Add kitty config from github user `ttys3`

### 🐞 Fixed

- Rename example subdirs, describe briefly in readme

## v1.0.1r5

### ⚡️ Added

- Add bold text to usage and examples
- Use `dracula` theme for `config-example1/diff.conf` diff kitten config

### 🐞 Fixed

## v1.0.1r4

### ⚡️ Added

- Add support for the `diff` kitten with `kitty-control diff <file1|dir1> <file2|dir2>`
- Add support for the `icat` kitten with `kitty-control icat /path/to/image`
- Add support for the `unicode_input` kitten with `kitty-control unicode`
- Add support for the `query_terminal` kitten with `kitty-control term`
- Add support for `--` prefix to all arguments

### 🐞 Fixed

## v1.0.1r3

### ⚡️ Added

- Added support for arbitrary Kitty command with `-c command`

### 🐞 Fixed

- Delay font/background/foreground/opacity actions until after configuration load

## v1.0.1r2

### ⚡️ Added

- Add `read_config.py` and `CHANGELOG.md` to release assets
- Add `install` to release assets
- Support for installing using the `install` release asset

### 🐞 Fixed

- Use the `kitty` environment variable `KITTY_LISTEN_ON` rather than `KITTY_SOCKET`

## v1.0.1r1

### ⚡️ Added

- Add support for `KITTY_CONFIG_DIRECTORY` environment variable
- Add support for `KITTY_SOCKET` environment variable
- Add `read_config.py` kitten to load `kitty` configurations
- Add `install` and `uninstall` scripts

### 🐞 Fixed

- Replace `getopts` with while loop through all arguments
- Change image option from `-b /path/to/image` to `-i /path/to/image`
- Fix `read_config.py` kitten invocation

## v1.0.0r1

### ⚡️ Added

- Add support for setting the tab title
- Add `-v` to display version
- Add `--help` argument for `load` command
- Add examples to usage with `-e` and `-h`
- Add `foreground/background` color setting
- Add support for multiple command loop
- Add switch to toggle fullscreen
- Add font size and list
- Add arguments to match and specify socket
- Initial version 2024-02-01

### 🐞 Fixed

- Delay background image and fullscreen toggle until after any `load` command
