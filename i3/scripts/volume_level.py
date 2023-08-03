#!/usr/bin/env python

import re
import subprocess

LOGO = "󰖀"

def main():
    match = re.search(r"\d+%", subprocess.getoutput("pactl get-sink-volume 3"))
    if match:
        print(f"{LOGO} {match.group(0)}")

if __name__ == "__main__":
    main()
