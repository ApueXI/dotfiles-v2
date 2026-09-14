import subprocess
import os
import sys


def main():
    print("=== 7-Zip ZIP Creator ===")

    print()
    target = input("Enter file/folder dir to zip: ").strip()
    if not target:
        print("Target cannot be empty.")
        sys.exit(1)

    if not os.path.exists(target):
        print(f"Error: '{target}' does not exist.")
        sys.exit(1)

    zip_name = input("Enter zipped file/folder name (without .zip): ").strip()
    if not zip_name:
        print("Zip name cannot be empty.")
        sys.exit(1)

    zip_file = f"/home/cred/stuff-zipped/{zip_name}.zip"

    command = ["7z", "a", zip_file, target]

    print("\nRunning command:")
    print(" ".join(command))

    try:
        subprocess.run(command, check=True)
        print(f"\n✅ Created archive: {zip_file}")
    except subprocess.CalledProcessError:
        print("\n❌ Compression failed.")


if __name__ == "__main__":
    main()
