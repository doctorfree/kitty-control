def main():
    pass


def handle_result(args, result, target_window_id, boss):
    if args[1] is None:
        return
    return boss.load_config_file(args[1])

handle_result.no_ui = True
