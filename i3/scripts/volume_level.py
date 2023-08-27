#!/usr/bin/env python

import re
import subprocess

def main():
    is_bt = int(subprocess.getoutput("pactl list sinks short | wc | awk '{print $1}'")) > 4
    sink = subprocess.getoutput("pactl list sinks short | grep 'blue' | awk '{print $1}'") if is_bt else "3"
    mute = "yes" in subprocess.getoutput(f"pactl get-sink-mute {sink}")
    if mute:
        print("󰝟")
    else:
        match = re.search(r"\d+%", subprocess.getoutput(f"pactl get-sink-volume {sink}"))
        if match:
            print(f"{'' if is_bt else '󰖀'} {match.group(0)}")
        else:
            print("Error")

if __name__ == "__main__":
    main()
