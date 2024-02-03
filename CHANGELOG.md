# Changelog

## Unreleased

### ⚡️ Added

### 🐞 Fixed

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
