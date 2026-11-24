#!/usr/bin/env python3

from pathlib import Path
from colors_palette import Color

for battery in Path("/sys/class/power_supply").glob("BAT*"):
    if (battery / "type").read_text().strip() != "Battery":
        continue

    percent = int((battery / "capacity").read_text())
    status = (battery / "status").read_text().strip()

    icon = (
        "⚡" if status == "Charging" else
        "🔋" if percent > 30 else
        "🪫"
    )
    color = (
        Color.SUCCESS if percent > 30 else
        Color.WARNING if percent > 10 else
        Color.DANGER
    )

    print(f"{icon} {percent}%\n{icon} {percent}%\n{color}")
    break
