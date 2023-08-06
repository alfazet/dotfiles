#!/usr/bin/env python

import re
import subprocess

LOGO = "󰖀"
LOGO_MUTE = "󰝟" 

def main():
    mute = "yes" in subprocess.getoutput("pactl get-sink-mute 3")
    if mute:
        print(f"{LOGO_MUTE}")
    else:
        match = re.search(r"\d+%", subprocess.getoutput("pactl get-sink-volume 3"))
        if match and not mute:
            print(f"{LOGO} {match.group(0)}")

if __name__ == "__main__":
    main()
