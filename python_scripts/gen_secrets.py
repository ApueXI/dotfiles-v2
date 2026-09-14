import secrets
import subprocess

while True:
    n = input("How long? ")
    try:
        n = int(n)
        text = secrets.token_hex(n)
        print(text)
        subprocess.run(["wl-copy"], input=text, text=True, check=True)
        break
    except Exception as e:
        print(e)
