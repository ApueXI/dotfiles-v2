from pathlib import Path
from random import choice

parent_dir: Path = Path("/home/cred/Light_Novel")

folder: list[str] = [item.name for item in parent_dir.iterdir() if item.is_dir()]

random_ln: str = choice(folder)
print(random_ln)
