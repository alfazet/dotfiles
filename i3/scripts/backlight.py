#!/usr/bin/env python

import sys
import subprocess

LOGO = "󰛩󱩏󱩐󱩑󱩒󱩓󱩔󱩕󱩖󰛨"

def main():
    p = round(int(subprocess.getoutput('brightnessctl g'))/int(subprocess.getoutput('brightnessctl m')) * 100)
    if p == 100:
        p -= 1
    sys.stdout.write(f"{LOGO[p // 10]} {p}%")

if __name__ == "__main__":
    main()
