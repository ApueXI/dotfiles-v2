# Install Flutter on Arch Linux with Sway and run a desktop app

This guide takes you from an existing Arch Linux/Sway installation to a running Flutter Linux desktop app. It uses the official Flutter SDK archive and Arch packages for the build tools.

**Target:** Arch Linux, Sway, an x86_64 computer, and Bash or Zsh. Your Intel i5-8365U uses the x86_64 architecture.

**Result:** A native application window in your Sway session. Android Studio, the Android SDK, and an emulator are not needed for this Linux desktop workflow. Flutter documents desktop development separately from Android development. [Flutter desktop documentation](https://docs.flutter.dev/platform-integration/desktop)

**Documentation checked:** September 7, 2026. The commands below adapt Flutter's general Linux instructions to Arch. Flutter's published Linux deployment support matrix names Ubuntu and Debian; it does not specifically list Arch/Sway. [Supported deployment platforms](https://docs.flutter.dev/reference/supported-platforms)

## 1. Open a terminal inside Sway

Use a terminal window in your normal Sway session. Run the setup as your regular user, using `sudo` only for the package installation commands shown below.

Check your architecture and default shell:

```bash
uname -m
echo "$SHELL"
```

For your laptop, the architecture should be `x86_64`. The shell path commonly ends in `zsh` or `bash`; this determines which PATH instructions to follow in step 4. If you manually started a different shell, follow the instructions for the shell you are actually using.

Have an internet connection and free disk space for the SDK, downloaded packages, and project build files. You can check the filesystem containing your home directory with:

```bash
df -h "$HOME"
```

## 2. Update Arch and install the dependencies

Run:

```bash
sudo pacman -Syu --needed \
  git curl unzip xz zip glu \
  clang cmake ninja pkgconf gtk3 gcc
```

This command updates your system and installs missing packages. Read any package-manager prompts before accepting them. `--needed` skips reinstalling packages already at the required version. Arch supports full system upgrades; avoid substituting `pacman -Sy` followed by selective package installs. [ArchWiki: pacman](https://wiki.archlinux.org/title/Pacman)

If the update replaces your running kernel or graphics stack, save your work and reboot before continuing in Sway.

Flutter lists the general installation prerequisites in its [manual installation guide](https://docs.flutter.dev/install/manual), and the desktop build prerequisites under [Set up Linux development → Set up tooling](https://docs.flutter.dev/platform-integration/linux/setup#set-up-tooling). Select **Linux** if a documentation page initially displays another operating system.

The Arch names differ from some names used in Flutter's Debian/Ubuntu examples:

| Requirement | Arch package | Purpose |
| --- | --- | --- |
| Git and download/archive tools | `git curl unzip xz zip` | SDK operations, downloads, and extracting archives |
| `libglu1-mesa` | `glu` | OpenGL utility library included in Flutter's installation prerequisites |
| Clang | `clang` | Compiles the Linux application's native code |
| CMake | `cmake` | Configures the native build |
| `ninja-build` | `ninja` | Executes the native build |
| `pkg-config` | `pkgconf` | Finds installed libraries and their compiler/linker settings |
| `libgtk-3-dev` | `gtk3` | GTK 3 libraries and development files for the application window |
| C++ standard-library development support | `gcc` and its dependencies | Supplies the C++ toolchain and standard-library files used by the native build |

Arch package references: [GLU](https://archlinux.org/packages/extra/x86_64/glu/), [Clang](https://archlinux.org/packages/extra/x86_64/clang/), [Ninja](https://archlinux.org/packages/extra/x86_64/ninja/), [pkgconf](https://archlinux.org/packages/core/x86_64/pkgconf/), [GTK 3](https://archlinux.org/packages/extra/x86_64/gtk3/), and [GCC](https://archlinux.org/packages/core/x86_64/gcc/). These are the basis for the Arch package mapping above.

## 3. Download and extract the Flutter SDK

Create directories for the download, SDK, and your projects:

```bash
mkdir -p "$HOME/Downloads" "$HOME/develop" "$HOME/Projects"
```

Then:

1. Open the official [Flutter SDK archive](https://docs.flutter.dev/install/archive).
2. Select **Linux**, the **stable** channel, and the latest stable **x64** download. Choose x64 for your Intel laptop.
3. Wait for the `.tar.xz` download to finish.
4. Save it in your `Downloads` folder and rename the downloaded file to **`flutter-sdk.tar.xz`** using your file manager. This fixed filename makes the next command copyable.

Extract it:

```bash
tar -xf "$HOME/Downloads/flutter-sdk.tar.xz" -C "$HOME/develop"
```

The archive creates the SDK directory at `~/develop/flutter`. Verify the launcher exists:

```bash
ls "$HOME/develop/flutter/bin/flutter"
```

Keep your projects in `~/Projects`, outside the SDK directory. Extract as your regular user so Flutter can update its own cache. The SDK includes Dart; a separate Dart installation is unnecessary for this workflow. [Flutter manual installation](https://docs.flutter.dev/install/manual)

## 4. Add Flutter to your PATH

PATH tells your shell where to find executable commands. Add Flutter's `bin` directory so you can type `flutter` and `dart` from any project directory.

**Choose exactly one option below. Run the append command once.** If the same entry is already present, skip the append command.

### If you use Zsh

Flutter's Linux instructions use `~/.zshenv`:

```bash
echo 'export PATH="$HOME/develop/flutter/bin:$PATH"' >> "$HOME/.zshenv"
source "$HOME/.zshenv"
```

### If you use Bash

Use `~/.bashrc`:

```bash
echo 'export PATH="$HOME/develop/flutter/bin:$PATH"' >> "$HOME/.bashrc"
source "$HOME/.bashrc"
```

The single quotes in the append command preserve `$HOME` and `$PATH` in the configuration file so the shell expands them when it reads the file. [Flutter: Add to PATH](https://docs.flutter.dev/install/add-to-path)

### Verify the SDK commands

```bash
command -v flutter
flutter --version
dart --version
```

`command -v flutter` should resolve to your home directory's `develop/flutter/bin/flutter`. The first Flutter invocation may download or initialize additional tools; let it finish.

Restart editors that were open before this change. If an editor launched from Sway's application launcher cannot find Flutter, configure its SDK path as `~/develop/flutter`, or launch the editor from a terminal where the commands above work.

## 5. Enable and check Linux desktop support

Run:

```bash
flutter config --enable-linux-desktop
flutter precache --linux
flutter doctor -v
flutter devices
```

Linux desktop support is usually already enabled in current Flutter releases; the first command explicitly enables it. `precache --linux` downloads Linux development artifacts ahead of your first build. [Flutter command reference](https://docs.flutter.dev/reference/flutter-cli)

Check for both of these results:

- A working **Linux toolchain** in `flutter doctor -v`.
- An entry named **Linux**, with the device ID `linux`, in `flutter devices`.

These are the checks Flutter documents for validating Linux development. Fix Linux toolchain errors before continuing. [Flutter: Validate your Linux setup](https://docs.flutter.dev/platform-integration/linux/setup#validate-your-setup)

Warnings about the Android SDK, Android Studio, or Chrome do not block this desktop workflow. Flutter explicitly allows ignoring warnings for platforms you are not targeting. [Flutter desktop tooling](https://docs.flutter.dev/platform-integration/desktop#set-up-desktop-devtools)

## 6. Create and run your first Linux desktop project

Create a project with Linux support:

```bash
cd "$HOME/Projects"
flutter create --platforms=linux hello_linux
cd hello_linux
flutter run -d linux
```

The project directory `hello_linux` should be a new directory. `flutter create` normally downloads the starter project's dependencies automatically.

Flutter will compile the application and open its starter app as a window in Sway. The terminal remains attached to the running app; that is normal. The initial build takes longer because it prepares the build and may download more artifacts. [Flutter: Create and run a desktop app](https://docs.flutter.dev/platform-integration/desktop#from-the-command-line)

You have completed the installation when the app window opens and responds to clicks.

## 7. Edit the app and use hot reload

Leave the app running. Open a second terminal and edit the main Dart file with your preferred editor, for example, if Neovim is installed:

```bash
cd "$HOME/Projects/hello_linux"
nvim lib/main.dart
```

Change a visible text label inside a widget's `build` method and save the file. Return to the terminal running `flutter run` and press lowercase **`r`**.

| Key in the Flutter terminal | Action |
| --- | --- |
| `r` | Hot reload: apply supported code changes while preserving app state |
| `R` | Hot restart: restart the Dart app and reset its state |
| `h` | Show the available interactive commands |
| `q` | Stop the app and end the run session |

Typing these keys into the application window or editor will not trigger Flutter's terminal controls. Hot reload does not rerun `main()` or `initState()`; use hot restart for initialization changes. Native code or build-configuration changes can require stopping and running the app again. [Flutter hot reload documentation](https://docs.flutter.dev/tools/hot-reload)

## 8. Run the same project later

For your usual development session:

```bash
cd "$HOME/Projects/hello_linux"
flutter run -d linux
```

After adding dependencies, pulling dependency changes, or obtaining a fresh copy of a project, run:

```bash
flutter pub get
```

This resolves and downloads the packages declared in `pubspec.yaml`, using the lockfile where applicable. You do not need to reinstall Flutter each time you work on an app. [Flutter package management commands](https://docs.flutter.dev/reference/flutter-cli)

## Optional: Run a project you cloned

First prove the starter app works. This helps distinguish a machine setup problem from a problem specific to the cloned project.

Read the project's README for its required Flutter version, configuration files, backend services, and setup commands. If it requires a particular Flutter SDK version, use that version instead of automatically upgrading the project.

If you have not cloned it yet, replace `<repository-url>` with the actual Git URL:

```bash
cd "$HOME/Projects"
git clone "<repository-url>" cloned_app
cd cloned_app
```

If it is already cloned, open a terminal in the Flutter application's directory: the one containing its `pubspec.yaml`.

If a `linux/` directory already exists:

```bash
flutter pub get
flutter run -d linux
```

If `linux/` is missing, and you want to add Linux support:

```bash
flutter create --platforms=linux .
flutter pub get
flutter run -d linux
```

The final dot means the current directory. This generates platform files in the existing project; review the changes with `git diff`. The command does not automatically make Android-only plugins or native code work on Linux. Check package platform support and follow project-specific configuration. [Adding desktop support and using plugins](https://docs.flutter.dev/platform-integration/desktop#add-desktop-support-to-an-existing-flutter-app)

## Troubleshooting on Arch and Sway

### `flutter: command not found`

Check the SDK location and try it directly:

```bash
ls "$HOME/develop/flutter/bin/flutter"
"$HOME/develop/flutter/bin/flutter" --version
```

If the direct command works, fix the PATH entry in step 4 and open a new terminal. If the file does not exist, check where you extracted the archive. [Flutter PATH setup](https://docs.flutter.dev/install/add-to-path)

### Missing compiler, CMake, Ninja, or GTK development files

Confirm the tools and GTK package metadata are available:

```bash
clang++ --version
cmake --version
ninja --version
pkg-config --modversion gtk+-3.0
```

The GTK check uses `gtk+-3.0`, although the Arch package is called `gtk3`. If a tool or GTK metadata is missing, revisit step 2 and rerun `flutter doctor -v` after fixing the installation. [Flutter Linux requirements](https://docs.flutter.dev/platform-integration/linux/setup)

If CMake still reports cached errors from before you fixed the tools, run this from the project directory:

```bash
flutter clean
flutter pub get
flutter run -d linux
```

Use `flutter clean` for stale generated build files; it is not a required step before every run. [Flutter command reference](https://docs.flutter.dev/reference/flutter-cli)

### Doctor says it cannot find `glxinfo`

Install the graphics diagnostic utilities, then rerun doctor:

```bash
sudo pacman -Syu --needed mesa-utils
flutter doctor -v
```

`mesa-utils` supplies diagnostic programs; it is not a replacement graphics driver. Also, GLX checks rely on an X display, so they can fail in a Wayland session without XWayland even if a native Wayland app works. [Arch mesa-utils package files](https://archlinux.org/packages/extra/x86_64/mesa-utils/files/), [ArchWiki: XWayland](https://wiki.archlinux.org/title/Wayland#Xwayland)

### The build succeeds, but the window cannot open

Start the command in a terminal inside Sway. Check the Wayland display variable:

```bash
echo "$WAYLAND_DISPLAY"
```

A normal Sway terminal should inherit a display name, often `wayland-1`; the exact name can differ. An empty result can indicate that you are using a terminal session outside Sway or one with missing session environment variables.

As a targeted diagnostic, try explicitly selecting GTK's Wayland backend:

```bash
GDK_BACKEND=wayland flutter run -d linux
```

GTK documents this environment variable for selecting Wayland. This is an adaptation for Flutter's GTK-based Linux window, not a guaranteed fix for every Flutter engine or graphics-driver error. [GTK 3: Using Wayland](https://docs.gtk.org/gtk3/wayland.html)

If native Wayland fails, an XWayland launch is another diagnostic option. Install XWayland if necessary:

```bash
sudo pacman -Syu --needed xorg-xwayland
```

Ensure your Sway configuration does not disable XWayland. Save your work, log out, and log back into Sway if needed to make it available, then try:

```bash
GDK_BACKEND=x11 flutter run -d linux
```

These prefixes affect only the command you run. You do not need to add a global GTK backend override to your shell configuration. [GTK backend selection](https://docs.gtk.org/gdk3/func.set_allowed_backends.html), [Arch XWayland package](https://archlinux.org/packages/extra/x86_64/xorg-xwayland/)

### The starter app works, but a cloned project fails

Inspect the first specific error. Common causes include an incompatible Flutter version, a plugin without a Linux implementation, missing application configuration, or an unavailable backend. Generating a `linux/` directory solves only the missing platform files.

For a detailed run log:

```bash
flutter run -d linux -v
```

## Optional: Build a release application

Once the app runs correctly, build its release version from the project directory:

```bash
flutter build linux --release
```

Flutter prints the output location. This creates release build output; it does not automatically install the app into Arch or create an application-menu entry. [Flutter: Build a release desktop app](https://docs.flutter.dev/platform-integration/desktop#build-a-release-app)

## Optional: Update Flutter later

For this manually installed SDK:

```bash
flutter upgrade
flutter doctor -v
```

Run these as your regular user. `pacman` updates the Arch packages from step 2, while `flutter upgrade` updates this separate SDK installation. For a cloned project with a pinned SDK version, follow that project's version policy. [Flutter SDK updates](https://docs.flutter.dev/install/upgrade)
