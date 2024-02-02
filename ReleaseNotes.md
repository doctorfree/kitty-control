## Kitty-Control Release Notes

The `kitty-control` command is a wrapper to simplify customizing the `kitty` terminal emulator without requiring a restart. Command line management of `kitty` enables easily switching configurations, adjusting font sizes, background/foreground, transparency, and more while preserving state.

## Requirements

The `kitty-control` command can be installed on `Linux` or `macOS`. It is a command line utility requiring a terminal or console and the `Bash` shell. It is intended to be run in a `kitty` terminal window or via `ssh`.

## Installation

```bash
git clone https://github.com/doctorfree/kitty-control
mkdir -p ~/.local/bin
cp kitty-control/kitty-control ~/.local/bin/kitty-control
chmod 755 ~/.local/bin/kitty-control
# Add ~/.local/bin to the execution PATH environment variable
# echo "export PATH="$HOME/.local/bin:$PATH" >> $HOME/.bashrc
# source $HOME/.bashrc
```

See the [kitty-control project README](https://github.com/doctorfree/kitty-control#readme) for an overview, usage, and examples.

See the [kitty-control CHANGELOG](https://github.com/doctorfree/kitty-control/blob/main/CHANGELOG.md) for a complete history of changes.
