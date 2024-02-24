# kc_read_config.py - load the specified Kitty configuration
#
# usage: kitty @ kitten kc_read_config.py /path/to/kitty.conf
#
# Author: Ronald Joe Record <ronaldrecord@gmail.com>
# Date: written February 2024
# License: MIT

def main():
    pass


def handle_result(args, result, target_window_id, boss):
    if args[1] is None:
        return
    return boss.load_config_file(args[1])

handle_result.no_ui = True
