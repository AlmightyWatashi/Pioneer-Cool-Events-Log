import os
import time
import sys

FILENAME = "event_log.txt"
CHECK_INTERVAL = 0.5  # seconds


def clear_screen():
    os.system("cls" if os.name == "nt" else "clear")


def read_line():
    try:
        with open(FILENAME, "r", encoding="utf-8") as f:
            return f.readline().rstrip("\n")
    except FileNotFoundError:
        return "[file not found]"


def main():
    last_mtime = None

    while True:
        try:
            mtime = os.path.getmtime(FILENAME)
        except FileNotFoundError:
            mtime = None

        if mtime != last_mtime:
            last_mtime = mtime
            clear_screen()
            print(read_line())
            sys.stdout.flush()

        time.sleep(CHECK_INTERVAL)


if __name__ == "__main__":
    main()
