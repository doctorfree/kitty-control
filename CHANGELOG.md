# Changelog

## Unreleased

### ⚡️ Added

### 🐞 Fixed

## v1.1.5r1

### ⚡️ Added

- Link to the `kitty-control` repo in `About`
- Use the `rich-cli` link markup in the `About` screen

### 🐞 Fixed

- Use `~/.venv/` for Python virtual environment
- Activate Python virtual environment

## v1.1.4r5

### ⚡️ Added

- Add `pathadd` to `nfetch/ffetch`
- Add `fastfetch` to utilities upgraded

### 🐞 Fixed

## v1.1.4r4

### ⚡️ Added

### 🐞 Fixed

- Fix version check if no arguments or just `-k`

## v1.1.4r3

### ⚡️ Added

- Check if only `-k` given as argument and show menu
- Add `-k` option to skip version checks and speed startup
- Add auto upgrade of dependencies to readme features

### 🐞 Fixed

- Correct source entry in `fastfetch` hardware config
- Correct upgrade and `-v` usage messages

## v1.1.4r2

### ⚡️ Added

- Add camera, physical disk, and board to ffetch hardware config
- Add support for `neofetch/fastfetch` config name without leading `config-` prefix

### 🐞 Fixed

- Rework installation menu entries
- Install both `fastfetch` and `neofetch`

## v1.1.4r1

### ⚡️ Added

- Rework installation menu entries with `Install Tools` added if any tool missing
- Install both `fastfetch` and `neofetch`

### 🐞 Fixed

- Cleanup installation output

## v1.1.3r3

### ⚡️ Added

- Install `fastfetch` rather than `neofetch` as part of `tools` install
- Install `fastfetch` in user home to avoid need for `sudo`
- Add `fastfetch` install/upgrade/version info, prefer `fastfetch` if installed
- Add 256x256 logo images
- Add check for logo image file same name as `ID` or `ID_LIKE`

### 🐞 Fixed

- Fix `mkrelease` with new location of `kitty-control`
- Change `neo` argument to `fetch`

## v1.1.3r2

### ⚡️ Added

- If `neofetch` is not available then use `fastfetch` if it is available

### 🐞 Fixed

- Change `kitty-control neo` to `kitty-control fetch` and update doc

## v1.1.3r1

### ⚡️ Added

- Moved `kitty-control` and `nfetch` into `bin`
- Add man pages for `nfetch` and `ffetch`

### 🐞 Fixed

## v1.1.2r3

### ⚡️ Added

- Add logo image sizes
- Add check for logo image by same name as `ID` or `ID_LIKE` in `/etc/os-release`

### 🐞 Fixed

- Adjust default logo image sizes used by `ffetch` and `nfetch`

## v1.1.2r2

### ⚡️ Added

- Set `fastfetch` logo display type depending on OS

### 🐞 Fixed

## v1.1.2r1

### ⚡️ Added

- Multiple size logos for `macOS`

### 🐞 Fixed

- Set logo image size depending on operating system

## v1.1.1r4

### ⚡️ Added

- Use `install --force` to overwrite existing `neofetch/fastfetch` configs
- Always overwrite existing logo images in `install`

### 🐞 Fixed

- Fix `Rocky Linux` logo

## v1.1.1r3

### ⚡️ Added

- Add `neofetch` logo image support for `Rocky Linux`
- Add usage message for `nfetch/ffetch` to `README`

### 🐞 Fixed

- Change arch linux logo

## v1.1.1r2

### ⚡️ Added

- Add `neofetch` logo images for multiple Linux distributions

### 🐞 Fixed

## v1.1.1r1

### ⚡️ Added

- Add option to `nfetch` to specify `neofetch` logo image file
- Add support for `Fedora` in `nfetch/ffetch`

### 🐞 Fixed

- Update `neofetch` config file `config-03.conf`
- Set image filename for `fastfetch` configs in `install`

## v1.1.0r4

### ⚡️ Added

- Add several new `neofetch` configurations

### 🐞 Fixed

- Pass `neofetch` config argument before logo and other args

## v1.1.0r3

### ⚡️ Added

- Add `ubuntu-jammy.png` logo to icons
- Add `-a` option to `nfetch` to use ascii logo

### 🐞 Fixed

- Improved logo selection for `neofetch` system info display

## v1.1.0r2

### ⚡️ Added

- Add `fastfetch` configs
- Update `nfetch` to work with either `neofetch` or `fastfetch`

### 🐞 Fixed

- Set `open_url_with` to `default` in all `kitty.conf`

## v1.1.0r1

### ⚡️ Added

- Add `apple-logo.png` for use with `neofetch` on `macOS`
- Add `nfetch` convenience script to invoke `neofetch` with `kitty` image display

### 🐞 Fixed

- Add `-c` to `set-colors` options to set configured colors for new windows

## v1.0.9r5

### ⚡️ Added

- Add window size to terminal info output
- Format terminal info output with `rich` if available
- Add another example `config/paul/kitty.conf` along with its color theme and `vim` script

### 🐞 Fixed

- Add `Summary` and `Background` subsections to `Overview` in `README`

## v1.0.9r4

### ⚡️ Added

- Check exit status of all `kitty` remote commands and issue warning on failure
- In menu mode ignore subsequent exit failures after the first is reported
- Add requirements section to man page
- Add note about required `kitty` settings to man page and readme

### 🐞 Fixed

- Improve exit failure warning
- If trnsparency setting fails issue warning about `dynamic_background_opacity`

## v1.0.9r3

### ⚡️ Added

- Install `kitty-control` session files in `~/.config/kitty/sessions/`
- Fixup installed `kitty.conf` files with detected shell
- Fixup installed `kitty` session files with detected shell
- Install platform specific `kitty` icon
- Add documentation selection menu screenshot

### 🐞 Fixed

- Check if configuration load succeeded and if not issue warning
- Earlier versions of `macOS` have `realpath` in `coreutils`
- Check for dir before `find` in `uninstall`
- Restrict shell fixup to `kitty-control` installed `kitty.conf` files
- Fix menu selections not recognized by number
- Improve removal

## v1.0.9r2

### ⚡️ Added

- Add support for selecting and setting a tab or window title

### 🐞 Fixed

- Fixed argument processing in command line `ls` and `list`
- Fixed some menu selection entries not recognizing selection by number

## v1.0.9r1

### ⚡️ Added

- Use newly introduced `load-config` kitten in `kitty` version `0.32.2` if available
- Add `kitty` documentation menu and command line option `-o <doc>` to open doc in browser

### 🐞 Fixed

- Use `bash` rather than `sh` for `curl` install to support `bash` syntax in `install` script
- Update `kitty-control` usage and man page

## v1.0.8r1

### ⚡️ Added

- Move `kc_read_config.py` up to `$HOME/.config/kitty`, link to subdirs with `kitty.conf`

### 🐞 Fixed

- Rename `read_config.py` to `kc_read_config.py` to avoid conflicts

## v1.0.7r4

### ⚡️ Added

- Add option to install `jq` if not already present
- Add option to install `lolcat` if not already present
- Add option to install `neofetch` if not already present

### 🐞 Fixed

- Change `Neofetch` menu entry to `System Info`

## v1.0.7r3

### ⚡️ Added

- Add `size w h` argument to increase/decrease the `kitty` window width and height
- Add `neofetch` menu entry and command line argument
- Add `neofetc` configuration file if none present

### 🐞 Fixed

- Only display `neofetch` menu entry and usage if `neofetch` present

## v1.0.7r2

### ⚡️ Added

- Modify `kitty.app` attributes on `macOS` to permit launching
- Install `kitty` session files, session desktop file, and icon

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
