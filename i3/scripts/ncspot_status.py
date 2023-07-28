#!/usr/bin/env python

# TODO: add elapsed time

import re
import socket
import json
import sys
from os.path import expanduser

LOGO = "" # this should show Spotify's logo, if it doesn't then i3's bar's configuration isn't using a "nerd font".
OFFLINE_COLOR = "#f38ba8" 
PLAYING_COLOR = "#a6e3a1"
PAUSED_COLOR = "#f9e2af"
NOTIFY_WHEN_OFF = False

# thank you SO: https://stackoverflow.com/questions/65910282/jsondecodeerror-invalid-escape-when-parsing-from-python
class Decoder(json.JSONDecoder):
    def decode(self, s, **kwargs):
        regex_replacements = [
            (re.compile(r'([^\\])\\([^\\])'), r'\1\\\\\2'),
            (re.compile(r',(\s*])'), r'\1'),
        ]
        for regex, replacement in regex_replacements:
            s = regex.sub(replacement, s)
        return super().decode(s, **kwargs)

def print_to_stdout(msg):
    sys.stdout.write(f"{msg}\n")
    sys.stdout.flush()

def main():
    try:
        s = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
        s.connect(f"{expanduser('~')}/.cache/ncspot/ncspot.sock")
        recv_data = s.recv(1024)
        s.close()

        data = json.loads(str(recv_data)[2:-3], cls = Decoder)

        if "Playing" in data["mode"]:
            color = PLAYING_COLOR 
        else:
            color = PAUSED_COLOR 
        part_string = ""
        if data["playable"]["type"] == "Episode":
            title = data["playable"]["name"]
            part_string = f"{title}"
            if len(part_string) > 64:
                part_string = part_string[:64] + "..."
        else:
            artists, title = ", ".join(data["playable"]["artists"]), data["playable"]["title"]
            part_string = f"{artists} - {title}"
            if len(part_string) > 64:
                part_string = part_string[:64] + "..."

        part_string = part_string.replace("\\\'", "\'").replace('\\\"', '\"').replace("\\\\", "\\")
        full_string = f"{LOGO} {part_string}"
        print_to_stdout(full_string)
        print_to_stdout(color)

    except Exception:
        print_to_stdout("no music playing" if NOTIFY_WHEN_OFF else "")
        print(OFFLINE_COLOR)

if __name__ == "__main__":
    main()
