---
title: FFETCH
section: 1
header: User Manual
footer: ffetch 1.0.2
date: May 13, 2024
---
# NAME
**ffetch** - front-end for *fastfetch* system info utility

# SYNOPSIS
**ffetch** [**-c** config] [**-r**] [**-u**]

# DESCRIPTION
**ffetch** acts as a wrapper for the *fastfetch* system info utility and provides an additional layer of convenience. Options exist to randomly select a prepared *fastfetch* configuration and specify an alternate configuration.

# REQUIREMENTS

**ffetch** can be installed on *Linux* and *macOS* platforms and requires *bash* and [fastfetch](https://github.com/fastfetch-cli/fastfetch).

# FEATURES
The **ffetch** command can be used to:

- Randomly select a **fastfetch** configuration from those in ***~/.config/fastfetch/*** named `config*`
- Specify an alternate **fastfetch** configuration

# COMMAND LINE OPTIONS

**-c config**
: specifies a configuration file to use, **config** can be the full path or name of a configuration

**-r**
: indicates select configuration file randomly

**-u**
: displays a usage messge and exits

# EXAMPLES
***ffetch***
: Without any arguments *ffetch* executes **fastfetch** using the default configuration

***ffetch -r***
: Execute **fastfetch** using a randomly selected configuration from those named `~/.config/fastfetch/config*`

***ffetch -c config-03***
: Execute **fastfetch** using the configuration `~/.config/fastfetch/config-03.conf`

# AUTHORS
Written by Ronald Record github@ronrecord.com

# LICENSE
**FFETCH** is distributed under an Open Source license.  See the file *LICENSE* in the **FFETCH** source distribution for information on terms &amp; conditions for accessing and otherwise using **FFETCH** and for a *DISCLAIMER OF ALL WARRANTIES*.

# BUGS
Submit bug reports online at: ***https://gitlab.com/doctorfree/kitty-control/issues***

Full documentation and sources at: ***https://gitlab.com/doctorfree/kitty-control***

