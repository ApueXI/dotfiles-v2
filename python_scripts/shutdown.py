import time
import subprocess


def ask_time() -> int:
    while True:
        t = input("How many minutes to shutdown?: ")
        try:
            t = int(t)
            t = t * 60
            if t <= 0:
                print("Please put a positive number")
                continue
            return t
        except Exception as e:
            print(e)


def main():
    try:
        t = ask_time()
        print("Shutting down in")
        for i in range(t):
            print(f"{t - i} seconds")
            time.sleep(1)
        subprocess.run(["systemctl", "poweroff"], check=True)
    except Exception as e:
        print(f"Please put a number : {e}")


if __name__ == "__main__":
    main()
