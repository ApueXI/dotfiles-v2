#!/usr/bin/env python
from pathlib import Path
from random import choice

parent_dir: Path = Path("/home/cred/Light_Novel")

folder: list[str] = [item.name for item in parent_dir.iterdir() if item.is_dir()]

if folder:
    print(choice(folder))
else:
    print("No folders found!")
