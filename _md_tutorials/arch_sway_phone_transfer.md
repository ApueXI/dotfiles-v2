# Arch Linux (Sway WM) Phone File Transfer Guide

Connecting your phone to an Arch Linux system running Sway requires a few specific packages depending on whether you want a wired USB connection, a wireless connection, or if you are using Android vs. iOS. Sway is a minimal Wayland compositor, meaning it doesn't come with the auto-mounting daemons found in full desktop environments like GNOME or KDE. 

Here is a comprehensive guide to the best methods for transferring files between your phone and your Sway setup.

---

## Method 1: USB Transfer (Android - MTP)

Modern Android devices use MTP (Media Transfer Protocol) for USB file transfers. You have two main approaches in Sway: using a GUI file manager or mounting via the command line.

### Option A: Using a GUI File Manager (e.g., Thunar, PCManFM)
If you prefer a visual interface, you need the GVFS (GNOME Virtual File System) MTP backend.

**1. Install required packages:**
```bash
sudo pacman -S gvfs-mtp thunar
```
*(Note: If you use a different file manager like `pcmanfm` or `nautilus`, `gvfs-mtp` is still the required backend).*

**2. Connect and Transfer:**
1. Plug your Android phone into your PC via USB.
2. Unlock your phone screen.
3. Tap the USB notification on your phone and select **"File Transfer" / "MTP"**.
4. Open your file manager (e.g., `thunar`). Your phone should appear in the sidebar under "Devices" or "Network". Click it to mount and access your files.

### Option B: Command Line (CLI) via `jmtpfs`
For a purely minimal, terminal-based approach without GVFS overhead.

**1. Install `jmtpfs`:**
```bash
sudo pacman -S jmtpfs
```

**2. Create a mount point:**
```bash
mkdir -p ~/phone
```

**3. Mount the device:**
1. Connect your phone via USB and select **"File Transfer"** on the device.
2. Run the mount command:
   ```bash
   jmtpfs ~/phone
   ```
3. You can now browse your phone's files in `~/phone` using `cd`, `ls`, `cp`, or a terminal file manager like `ranger` or `lf`.

**4. Unmount when finished:**
```bash
fusermount -u ~/phone
```

---

## Method 2: Wireless Transfer (Android & iOS)

For wireless transfers, the KDE Connect protocol is the gold standard. However, installing `kdeconnect` on Arch brings in a lot of KDE Plasma dependencies. For a minimal Wayland/Sway setup, **Valent** is highly recommended instead.

### Using Valent (KDE Connect client for GTK/Wayland)
Valent allows you to transfer files wirelessly, share clipboards, and receive phone notifications on Sway.

**1. Install Valent:**
Valent is available in the AUR (Arch User Repository). Use an AUR helper like `yay` or `paru`:
```bash
yay -S valent
```

**2. Install the Mobile App:**
* **Android:** Install **KDE Connect** from the Google Play Store or F-Droid.
* **iOS:** Install **KDE Connect** from the App Store.

**3. Pair the Devices:**
1. Ensure both your PC and phone are on the **same Wi-Fi network**.
2. Launch `valent` on your Sway setup (you can add it to your Sway config to auto-start: `exec valent --gapplication-service`).
3. Open the KDE Connect app on your phone.
4. You should see your Arch PC listed. Tap it and select **"Request Pairing"**.
5. Accept the pairing request on your PC.

**4. Transferring Files:**
* **From Phone to PC:** Open the KDE Connect app on your phone, select "Send Files", and choose your files. They will typically save to your `~/Downloads` directory.
* **From PC to Phone:** You can drag and drop files into the Valent GUI or use the terminal.

---

## Method 3: USB Transfer (iOS / iPhone / iPad)

Apple devices do not use standard MTP. They require specific libraries to communicate with Linux.

**1. Install the required packages:**
```bash
sudo pacman -S libimobiledevice ifuse
```

**2. Create a mount point:**
```bash
mkdir -p ~/iphone
```

**3. Connect and Mount:**
1. Plug in your iOS device via USB.
2. **Unlock your device** (this is crucial). If a prompt asks to "Trust This Computer", tap **Trust** and enter your passcode.
3. Mount the device's media folder:
   ```bash
   ifuse ~/iphone
   ```
   *(Note: This gives you access to the `/var/root/Media` directory, which contains your Photos and App data).*

**4. Unmount when finished:**
```bash
fusermount -u ~/iphone
```

---

## Method 4: Advanced Android Transfer (ADB)

If you are a power user or developer, the Android Debug Bridge (ADB) is incredibly fast and reliable for transferring large folders without worrying about MTP dropping the connection.

**1. Install Android Tools:**
```bash
sudo pacman -S android-tools
```

**2. Enable USB Debugging on your phone:**
1. Go to Settings -> About Phone.
2. Tap "Build Number" 7 times to enable Developer Options.
3. Go back, enter Developer Options, and enable **USB Debugging**.

**3. Connect and Authorize:**
Plug in your phone. Run the following command:
```bash
adb devices
```
Your phone will prompt you to authorize the connection. Check "Always allow from this computer" and tap OK.

**4. Transfer Files via CLI:**
* **Push (PC to Phone):**
  ```bash
  adb push /path/to/local/file.mkv /sdcard/Movies/
  ```
* **Pull (Phone to PC):**
  ```bash
  adb pull /sdcard/DCIM/Camera/ ~/Pictures/PhoneBackup/
  ```

---

## Troubleshooting Tips for Sway Users

* **No popup/prompt on the phone (MTP):** Try a different USB cable. Many cables are "charge-only" and do not have data pins connected.
* **Device busy or locked error:** Ensure your phone is physically unlocked and on the home screen *before* you run the mount command or click the device in Thunar.
* **Permission denied errors (ADB):** Ensure your user is part of the `adbusers` group if you run into permission issues: `sudo usermod -aG adbusers $USER`, then log out and log back in.
