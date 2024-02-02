#!/bin/bash
#  __ _  __  ____  ____  _  _       ___  __   __ _  ____  ____   __   __
# (  / )(  )(_  _)(_  _)( \/ )___  / __)/  \ (  ( \(_  _)(  _ \ /  \ (  )
#  )  (  )(   )(    )(   )  /(___)( (__(  O )/    /  )(   )   /(  O )/ (_/\
# (__\_)(__) (__)  (__) (__/       \___)\__/ \_)__) (__) (__\_) \__/ \____/
#
# kitty-control - control the Kitty terminal emulator from the command line
#
# Written Feb 1, 2024 by Ronald Joe Record <ronaldrecord@gmail.com>
#
VERSION=1.0.0
RELEASE=1
# The Kitty configuration directory
CONFDIR="${HOME}/.config/kitty"
# The default background opacity for transparency
OPACITY="0.8"
# The socket Kitty is listening on if configured
# Set here to avoid needing to pass -s /path/to/socket every time
# The format of this setting is:
# SOCKET="--to unix:/path/to/socket"
# Leave blank if no listen socket configured or to specify with -s /path/to/socket
SOCKET=
# Kitty remote control options are used to specify which windows/tabs to modify
OPTS=

brief_usage() {
  printf "\nUsage: kitty-control [-a] [-b /path/to/image] [-e] [-f] [-m <match>] [-t <match>]"
  printf "\n           [-s /path/to/socket] [-u|h|v] [back <color>] [dark] [fore <color>]"
  printf "\n           [font [num]] [list] [load [subdir]] [title <title>] [tran [opacity]]"
  [ "$1" == "noexit" ] || {
    printf "\n\nTo display several examples run 'kitty-control -e'"
    printf "\nFor a full usage message run 'kitty-control -u'"
    printf "\nFor a full usage message with examples run 'kitty-control -h'\n\n"
    exit 1
  }
}

show_examples() {
  brief_usage noexit
  printf "\nExample invocations of kitty-control\n"
  printf "\nTo set a transparent Kitty background with 0.9 opacity:"
  printf "\n\tkitty-control tran 0.9"
  printf "\nTo set the Kitty background to fully opaque (no transparency):"
  printf "\n\tkitty-control dark"
  printf "\nTo set the Kitty background color to black and foreground color to white:"
  printf "\n\tkitty-control back black fore white"
  printf "\nTo load the Kitty config in ~/.config/kitty/laptop/kitty.conf"
  printf "\n\tkitty-control load laptop"
  printf "\nTo increase the font size by 2 points:"
  printf "\n\tkitty-control font +2"
  printf "\nTo set the background image to ~/Pictures/groovy.png"
  printf "\n\tkitty-control -b ~/Pictures/groovy.png"
  printf "\nActions can be combined on the same command line:"
  printf "\n\tkitty-control -b ~/Pictures/groovy.png fore cyan font 24"
  printf "\nOrder is sometimes important, especially when switching configs:"
  printf "\n\tkitty-control font -4 load laptop # The 'font -4' is overridden by the new config"
  printf "\n\tInstead use 'kitty-control load laptop font -4'"
  printf "\nTo set the tab title of the tab currently titled '~/src/borg' to 'Borg Backup':"
  printf "\n\tkitty-control -m \"title:borg\" title \"Borg Backup\""
  printf "\nTo restore the original Kitty configuration:"
  printf "\n\tkitty-control load default\n"
  exit 1
}

usage() {
  brief_usage noexit
  printf "\nWhere:"
  printf "\n    'back color' Sets the background color to 'color'"
  printf "\n           If 'color' is 'reset' restores foreground and background to startup value"
  printf "\n    'dark' Sets the Kitty background opacity to 1.0 (fully opaque)"
  printf "\n           Can use 'dark' or 'opaque'"
  printf "\n    'font num' Sets the font pointsize to 'num'"
  printf "\n           Can use 'font', 'fontsize', 'fontminus', or 'fontplus'"
  printf "\n           The second argument specifies the font size, either absolute, +, or -"
  printf "\n           e.g. 'kitty-control fontsize 24' would set the font size to 24 points"
  printf "\n                'kitty-control font +2' would increase the font size by 2 points"
  printf "\n                'kitty-control font' without argument resets the font size to default"
  printf "\n    'fore color' Sets the foreground color to 'color'"
  printf "\n           If 'color' is 'reset' restores foreground and background to startup value"
  printf "\n    'list' Displays information on Kitty windows"
  printf "\n    'load [subdir]' Reloads the Kitty configuration in ~/.config/kitty/kitty.conf"
  printf "\n           Can use 'load' or 'reload'"
  printf "\n           Specify a second argument to load ~/.config/kitty/<subdir>/kitty.conf"
  printf "\n           e.g. 'kitty-control load tv' would load ~/.config/kitty/tv/kitty.conf"
  printf "\n           'kitty-control load default' restores the kitty.conf used to start this instance"
  printf "\n           'kitty-control load --help' displays a help message for the load command"
  printf "\n    'title <tab title>' Sets the Kitty tab title to \"tab title\""
  printf "\n          Quote tab titles which contain spaces, e.g. \"This Is My Tab Title\""
  printf "\n          Use '-m <match>' to specify the tab to match"
  printf "\n    'tran [opacity]' Sets the Kitty background opacity to 0.8"
  printf "\n           Can use 'tran', 'opacity', 'trans' or 'transparent'"
  printf "\n           Specify a second argument to set a custom background opacity:"
  printf "\n           e.g. 'kitty-control transparent 0.9'"
  printf "\n    '-a' Indicates modify all windows rather than just the currently active OS window"
  printf "\n    '-b /path/to/image' sets the background image for the specified Kitty windows"
  printf "\n        If /path/to/image is 'none' then any existing image will be removed"
  printf "\n    '-e' Displays several example invocations and exits"
  printf "\n    '-f' Indicates toggle fullscreen"
  printf "\n    '-h' Displays the usage message with examples and exits"
  printf "\n    '-m <match>' Specifies the window to match"
  printf "\n    '-t <match>' Specifies the tab to match"
  printf "\n        Window/Tab matching can be used in conjunction with most kitty-control commands"
  printf "\n        If <match> is '--help' the Kitty documentation URL for matching will be displayed"
  printf "\n    '-s /path/to/socket' Specifies the socket Kitty is listening on if enabled"
  printf "\n        If /path/to/socket is '--help' some help on configuring a Kitty socket is provided"
  printf "\n    '-u' Displays the usage message and exits"
  printf "\n    '-v' Displays the kitty-control version and exits"
  printf "\nAdjusting the background opacity or font size requires the original kitty.conf"
  printf "\nthat was used for this instance of Kitty to have enabled the following:"
  printf "\n    'dynamic_background_opacity yes' and 'allow_remote_control yes'"
  printf "\nSee https://sw.kovidgoyal.net/kitty/remote-control/#control-kitty-from-scripts\n"
  [ "$1" == "examples" ] && show_examples
  exit 1
}

kitty-fontminus() {
  size="$1"
  first_size=${size::1}
  if [[ "${first_size}" == "-" ]]; then
    kitty @ ${SOCKET} set-font-size ${OPTS} -- $size
  else
    kitty @ ${SOCKET} set-font-size ${OPTS} -- -$size
  fi
}

kitty-fontplus() {
  size="$1"
  first_size=${size::1}
  if [[ "${first_size}" == "+" ]]; then
    kitty @ ${SOCKET} set-font-size ${OPTS} $size
  else
    kitty @ ${SOCKET} set-font-size ${OPTS} +$size
  fi
}

kitty-fontsize() {
  size="$1"
  first_size=${size::1}
  if [[ "${first_size}" == "-" ]]; then
    kitty @ ${SOCKET} set-font-size ${OPTS} -- $size
  else
    kitty @ ${SOCKET} set-font-size ${OPTS} $size
  fi
}

toggle-fullscreen() {
  kitty @ ${SOCKET} resize-os-window --action toggle-fullscreen ${OPTS}
}

kitty-list() {
  kitty @ ${SOCKET} ls ${OPTS}
}

kitty-reload() {
  [ "$1" ] && {
    [ -f "${CONFDIR}/default/kitty.conf" ] || {
      [ -d "${CONFDIR}/default" ] || mkdir -p "${CONFDIR}/default"
      cp "${CONFDIR}/kitty.conf" "${CONFDIR}/default/kitty.conf"
    }
    cp "${CONFDIR}/$1/kitty.conf" "${CONFDIR}/kitty.conf"
  }
  kill -SIGUSR1 $(pidof kitty)
}

kitty-background() {
  kitty @ ${SOCKET} set-background-image ${OPTS} $1
}

kitty-opacity() {
  kitty @ ${SOCKET} set-background-opacity ${OPTS} $1
}

set-background() {
  if [ "$1" == "reset" ]; then
    kitty @ ${SOCKET} set-colors ${OPTS} --reset
  else
    kitty @ ${SOCKET} set-colors ${OPTS} background=$1
  fi
}

set-foreground() {
  if [ "$1" == "reset" ]; then
    kitty @ ${SOCKET} set-colors ${OPTS} --reset
  else
    kitty @ ${SOCKET} set-colors ${OPTS} foreground=$1
  fi
}

set-title() {
  kitty @ ${SOCKET} set-tab-title ${OPTS} "$1"
}

[ "$1" ] || brief_usage

# Some actions need to be delayed until after any configuration load
bg_image=
fullscrn=
while getopts ":ab:efm:s:t:huv" flag; do
  case $flag in
    a)
      OPTS="$OPTS -a"
      ;;
    b)
      bg_image="${OPTARG}"
      ;;
    f)
      fullscrn=1
      ;;
    m)
      if [ "${OPTARG}" == "--help" ]; then
        printf "\nSee https://sw.kovidgoyal.net/kitty/remote-control/#matching-windows-and-tabs\n\n"
        exit 0
      else
        OPTS="$OPTS -m ${OPTARG}"
      fi
      ;;
    s)
      if [ "${OPTARG}" == "--help" ]; then
        printf "\nStart kitty as:"
        printf "\n\tkitty -o allow_remote_control=yes --listen-on unix:/tmp/mykitty"
        printf "\nThe kitty '--listen-on' option tells kitty to listen for control messages"
        printf "\nat the specified UNIX-domain socket. See kitty --help for details.\n"
        printf "\nNow you can control this instance of kitty using the"
        printf "\n\tkitten @ --to command line argument to kitten @. For example:"
        printf "\n\tkitten @ --to unix:/tmp/mykitty ls"
        printf "\nRemote control via a socket can be enabled in kitty.conf by setting:"
        printf "\n\tallow_remote_control yes"
        printf "\n\tlisten_on unix:/tmp/mykitty\n"
        printf "\nTo use this with kitty-control set SOCKET=\"--to unix:/tmp/mykitty\""
        printf "\nin kitty-control or invoke kitty-control with '-s /tmp/mykitty'."
        printf "\nFor example: kitty-control -s /tmp/mykitty fontsize 24\n\n"
        exit 0
      else
        SOCKET="--to unix:$OPTARG"
      fi
      ;;
    t)
      if [ "${OPTARG}" == "--help" ]; then
        printf "\nSee https://sw.kovidgoyal.net/kitty/remote-control/#matching-windows-and-tabs\n\n"
        exit 0
      else
        OPTS="$OPTS -t ${OPTARG}"
      fi
      ;;
    e)
      show_examples
      ;;
    h)
      usage examples
      ;;
    u)
      usage
      ;;
    v)
      printf "\nkitty-control version ${VERSION} release ${RELEASE}\n\n"
      exit 0
      ;;
    \?)
      echo "Invalid option: $flag"
      brief_usage
      ;;
  esac
done
shift $(( OPTIND - 1 ))

while [ "$1" ]
do
  case $1 in
    back*)
      if [ "$2" ]; then
        set-background "$2"
        shift 2
      else
        printf "\nERROR: background keyword requires an argument"
        brief_usage
      fi
      ;;
    fore*)
      if [ "$2" ]; then
        set-foreground "$2"
        shift 2
      else
        printf "\nERROR: foreground keyword requires an argument"
        brief_usage
      fi
      ;;
    list|ls)
      kitty-list
      shift
      ;;
    load|reload)
      if [ "$2" ]; then
        if [ "$2" == "--help" ]; then
          printf "\nThe 'kitty-control load <subdir>' command loads the Kitty configuration"
          printf "\nfile in '~/.config/kitty/<subdir>/kitty.conf'. The current instance of"
          printf "\nkitty continues to run and the specified configuration file is loaded."
          printf "\nAll tabs and state are preserved while the new configuration is loaded."
          printf "\n\nThe new Kitty configuration file must be prepared beforehand and located"
          printf "\nin the specified subdirectory in the Kitty configuration folder."
          printf "\n\nFor example, if you have one Kitty configuration used for a large screen"
          printf "\nTV and another used for a laptop then placing the TV Kitty configuration"
          printf "\nin ~/.config/kitty/tv/kitty.conf and the laptop Kitty configuration in"
          printf "\n~/.config/kitty/laptop/kitty.conf would allow you to switch between these"
          printf "\ntwo Kitty configurations with kitty-control as follows:"
          printf "\n\tkitty-control load tv # When your display is the TV as monitor"
          printf "\n\tkitty-control load laptop # When you're using the laptop built-in display"
          printf "\n\nTo restore the Kitty configuration to its original setting:"
          printf "\n\tkitty-control load default\n\n"
          exit 0
        else
          if [ -f "${CONFDIR}/$2/kitty.conf" ]; then
            kitty-reload "$2"
            shift 2
          else
            if [ "$2" == "default" ]; then
              kitty-reload
              shift 2
            else
              printf "\n ${CONFDIR}/$2/kitty.conf does not exist\n"
              shift 2
            fi
          fi
        fi
      else
        kitty-reload
        shift
      fi
      ;;
    dark|opaque)
      kitty-opacity "1.0"
      shift
      ;;
    fontmin*|fontdec*)
      if [ "$2" ]; then
        kitty-fontminus "$2"
        shift 2
      else
        kitty-fontminus 1
        shift
      fi
      ;;
    fontplus|fontinc*)
      if [ "$2" ]; then
        kitty-fontplus "$2"
        shift 2
      else
        kitty-fontplus 1
        shift
      fi
      ;;
    font*)
      if [ "$2" ]; then
        kitty-fontsize "$2"
        shift 2
      else
        kitty-fontsize 0
        shift
      fi
      ;;
    title)
      if [ "$2" ]; then
        set-title "$2"
        shift 2
      else
        printf "\nERROR: title keyword requires an argument"
        brief_usage
      fi
      ;;
    opacity|tran*)
      if [ "$2" ]; then
        OPACITY="$2"
        shift 2
      else
        shift
      fi
      kitty-opacity "${OPACITY}"
      ;;
    *)
      printf "\nUnsupported Kitty control command: $1"
      usage
      ;;
  esac
done

[ "${fullscrn}" ] && toggle-fullscreen
[ "${bg_image}" ] && {
  if [ "${bg_image}" == "none" ]; then
    kitty-background "${bg_image}"
  else
    if [ -f "${bg_image}" ]; then
      kitty-background "${bg_image}"
    else
      printf "\nSpecified Kitty background image ${bg_image} not found\n"
    fi
  fi
}
