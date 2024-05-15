---
title: NFETCH
section: 1
header: User Manual
footer: nfetch 1.0.2
date: May 13, 2024
---
# NAME
**nfetch** - front-end for *neofetch* system info utility

# SYNOPSIS
**nfetch** [**-a**] [**-c** config] [**-i** /path/to/logo] [**-r**] [**-u**]

# DESCRIPTION
**nfetch** acts as a wrapper for the *Neofetch* system info utility and provides an additional layer of convenience. Options exist to randomly select a prepared *Neofetch* configuration, specify an alternate configuration, specify the path to a logo image file, and indicate use of an ascii logo.

# REQUIREMENTS

**nfetch** can be installed on *Linux* and *macOS* platforms and requires *bash* and [neofetch](https://github.com/LorenDB/neofetch).

# FEATURES
The **nfetch** command can be used to:

- Randomly select a **neofetch** configuration from those in ***~/.config/neofetch/*** named `config*`
- Specify an alternate **neofetch** configuration
- Specify the logo image to display

# COMMAND LINE OPTIONS

**-a**
: indicates use ascii logo with neofetch

**-c config**
: specifies a configuration file to use, **config** can be the full path or name of a configuration (the configuration name prefix *config-* can be omitted)

**-i /path/to/logo**
: specifies an image for neofetch to use

**-r**
: indicates select configuration file randomly

**-u**
: displays a usage messge and exits

# EXAMPLES
***nfetch***
: Without any arguments *nfetch* executes **neofetch** using the default configuration

***nfetch -r***
: Execute **neofetch** using a randomly selected configuration from those named `~/.config/neofetch/config*`

***nfetch -c boxes***
: Execute **neofetch** using the configuration `~/.config/neofetch/config-boxes.conf`

***nfetch -i ~/.local/share/icons/hicolor/256x256/apps/arch.png***
: Execute **neofetch** using the default configuration and the *Arch Linux* logo

# AUTHORS
Written by Ronald Record github@ronrecord.com

# LICENSE
**NFETCH** is distributed under an Open Source license.  See the file *LICENSE* in the **NFETCH** source distribution for information on terms &amp; conditions for accessing and otherwise using **NFETCH** and for a *DISCLAIMER OF ALL WARRANTIES*.

# BUGS
Submit bug reports online at: ***https://gitlab.com/doctorfree/kitty-control/issues***

Full documentation and sources at: ***https://gitlab.com/doctorfree/kitty-control***

