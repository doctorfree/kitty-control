## Kitty-Control Release Notes

The `kitty-control` command is a wrapper to simplify customizing the `kitty` terminal emulator without requiring a restart. Command line management of `kitty` enables easily switching configurations, adjusting font sizes, background/foreground, transparency, and more while preserving state.

## Requirements

The `kitty-control` command can be installed on `Linux` or `macOS`. It is a command line utility requiring a terminal or console and the `Bash` shell. It is intended to be run in a `kitty` terminal window or via `ssh`.

The `kitty-control` installation requires [git](https://github.com/git-guides/install-git).

Some functionality requires [curl](https://curl.se).

Additional `kitty` window info listing features are enabled if the [jq JSON parser](https://jqlang.github.io/jq) is installed.

## Installation

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

### From a release download

Alternately, download the `install` release asset from
https://github.com/doctorfree/kitty-control/releases/latest
and execute it with `bash /path/to/install`. For example,
if the `install` release asset was downloaded to the `~/Downloads`
folder, run `bash ~/Downloads/install`.

## Information

See the [kitty-control project README](https://github.com/doctorfree/kitty-control#readme) for an overview, usage, and examples.

See the [kitty-control CHANGELOG](https://github.com/doctorfree/kitty-control/blob/main/CHANGELOG.md) for a complete history of changes.
