#!/usr/bin/env python3

import json
import subprocess
import time

from colors_palette import Color

try:
    requests = [
        {
            "id": 1,
            "method": "initialize",
            "params": {
                "clientInfo": {
                    "name": "i3blocks",
                    "version": "1.0.0"
                }
            }
        },
        {"method": "initialized"},
        {"id": 2, "method": "account/rateLimits/read"}
    ]

    with subprocess.Popen(
        ["codex", "app-server"],
        stdin=subprocess.PIPE,
        stdout=subprocess.PIPE,
        stderr=subprocess.DEVNULL,
        text=True
    ) as proc:
        try:
            for request in requests:
                proc.stdin.write(json.dumps(request) + "\n")
                proc.stdin.flush()

            result = next(
                response["result"]
                for line in proc.stdout
                if (response := json.loads(line)).get("id") == 2
            )
        finally:
            proc.kill()

    limits = (
        (result.get("rateLimitsByLimitId") or {}).get("codex")
        or result["rateLimits"]
    )

    quota = next(
        w for w in (limits.get("primary"), limits.get("secondary"))
        if w and w.get("windowDurationMins") == 300
    )

    remaining = int(100 - quota["usedPercent"])
    filled = remaining // 10
    bar = "▰" * filled + "▱" * (10 - filled)

    minutes = max(0, int((quota["resetsAt"] - time.time()) / 60))
    hours, minutes = divmod(minutes, 60)

    color = (
        Color.SUCCESS if remaining > 50 else
        Color.WARNING if remaining > 20 else
        Color.DANGER
    )

    print(f"Codex {bar} {remaining}% ↻ {hours}h{minutes:02d}")
    print(f"Codex {remaining}%")
    print(color)

except FileNotFoundError:
    print('')

except Exception:
    print("Codex: N/A")
