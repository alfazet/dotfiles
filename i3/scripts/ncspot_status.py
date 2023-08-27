#!/usr/bin/env python

import socket
import json
from os.path import expanduser

PLAYING_COLOR = "#e0def4"
PAUSED_COLOR = "#f6c177"

def main():
    try:
        s = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
        s.connect(f"{expanduser('~')}/.cache/ncspot/ncspot.sock")
        recv_data = s.recv(1024)
        s.close()

        data = json.loads(recv_data.decode())
        if "Playing" in data["mode"]:
            color = PLAYING_COLOR 
        else:
            color = PAUSED_COLOR 

        res = ""
        if data["playable"]["type"] == "Episode":
            title = data["playable"]["name"]
            res = f"{title}"
            if len(res) > 64:
                res = res[:64] + "..."
        else:
            artists, title = ", ".join(data["playable"]["artists"]), data["playable"]["title"]
            res = f"{artists} - {title}"
            if len(res) > 64:
                res = res[:64] + "..."
        print(f" {res}")

    except Exception as e:
        print(e)

if __name__ == "__main__":
    main()
