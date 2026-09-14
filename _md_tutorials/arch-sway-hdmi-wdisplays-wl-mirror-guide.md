# HDMI Display Sharing on Arch Linux + Sway

This guide covers two common ways to use an HDMI monitor, TV, or
projector with **Arch Linux + Sway**:

1.  **wdisplays** --- configure an HDMI display as a second/extended
    monitor using a GUI.
2.  **wl-mirror** --- duplicate/mirror your laptop screen onto the HDMI
    display.

> **Note:** `wdisplays` configures Wayland outputs, but it does not
> provide true screen mirroring on Sway. Use `wl-mirror` when you want
> the HDMI display to show the same content as your laptop screen.

------------------------------------------------------------------------

## 1. Install the Required Applications

Install both packages:

``` bash
sudo pacman -S wdisplays wl-mirror
```

You can verify that they are installed with:

``` bash
wdisplays --help
wl-mirror --help
```

------------------------------------------------------------------------

# Part 1 --- Using wdisplays for an HDMI Monitor

Use `wdisplays` when you want your HDMI monitor to act as an
**additional display**.

For example:

``` text
Laptop screen                HDMI monitor
┌─────────────────┐          ┌─────────────────┐
│                 │          │                 │
│   Workspace 1   │          │   Workspace 2   │
│                 │          │                 │
└─────────────────┘          └─────────────────┘
        eDP-1                    HDMI-A-1
```

This is usually called **extending** your desktop.

## Step 1 --- Connect the HDMI Cable

Connect your laptop to the monitor, TV, or projector using HDMI.

Sway should detect the new output automatically.

You can check detected outputs with:

``` bash
swaymsg -t get_outputs
```

Typical output names are:

``` text
eDP-1
HDMI-A-1
```

Usually:

-   `eDP-1` = laptop screen
-   `HDMI-A-1` = HDMI display

Your actual names may be different.

------------------------------------------------------------------------

## Step 2 --- Open wdisplays

Run:

``` bash
wdisplays
```

A graphical display configuration window should appear.

You should see boxes representing your laptop display and HDMI display.

------------------------------------------------------------------------

## Step 3 --- Enable the HDMI Display

Select the HDMI display in `wdisplays`.

Make sure the display is enabled.

You can then configure settings such as:

-   Resolution
-   Refresh rate
-   Scale
-   Rotation
-   Position

For example, you can place the HDMI monitor to the right of your laptop
screen:

``` text
┌───────────────┐┌─────────────────────┐
│    Laptop     ││        HDMI         │
│     eDP-1     ││      HDMI-A-1       │
└───────────────┘└─────────────────────┘
```

Drag the monitor boxes in `wdisplays` so that they match the physical
arrangement of your monitors.

------------------------------------------------------------------------

## Step 4 --- Apply the Configuration

After arranging the displays, click **Apply**.

You should now be able to move your mouse and windows between the laptop
and HDMI displays.

For example, if HDMI is positioned to the right:

``` text
Laptop
   │
   │ move mouse →
   ▼
HDMI monitor
```

You can move a Sway window to another output using your normal Sway
shortcuts or commands.

For example:

``` bash
swaymsg move container to output HDMI-A-1
```

Replace `HDMI-A-1` with your actual HDMI output name.

------------------------------------------------------------------------

# Part 2 --- Duplicating the Laptop Screen with wl-mirror

If you want this:

``` text
Laptop screen
┌─────────────────────┐
│                     │
│    Same Content     │
│                     │
└─────────────────────┘
          │
          │ mirror
          ▼
HDMI monitor
┌─────────────────────┐
│                     │
│    Same Content     │
│                     │
└─────────────────────┘
```

use `wl-mirror`.

This is useful for:

-   Projectors
-   Classroom presentations
-   TVs
-   Demonstrations
-   Showing someone exactly what is on your laptop

------------------------------------------------------------------------

## Step 1 --- Connect HDMI

Connect your HDMI monitor/projector.

Check the available outputs:

``` bash
swaymsg -t get_outputs
```

Assume the result contains:

``` text
eDP-1
HDMI-A-1
```

where:

``` text
eDP-1       = laptop
HDMI-A-1    = HDMI monitor/projector
```

------------------------------------------------------------------------

## Step 2 --- Make Sure the HDMI Output Is Enabled

You can use `wdisplays` to enable the HDMI output.

Alternatively:

``` bash
swaymsg output HDMI-A-1 enable
```

------------------------------------------------------------------------

## Step 3 --- Mirror the Laptop Screen

Run:

``` bash
wl-mirror eDP-1 --fullscreen-output HDMI-A-1
```

This means:

``` text
Source:       eDP-1
                 │
                 │ wl-mirror
                 ▼
Destination:  HDMI-A-1
```

Your laptop remains your normal working display while `wl-mirror`
displays a copy of it fullscreen on the HDMI output.

------------------------------------------------------------------------

## Step 4 --- Stop Mirroring

To stop `wl-mirror`, return to the terminal where it is running and
press:

``` text
Ctrl + C
```

If it is running in the background, you can stop it with:

``` bash
pkill wl-mirror
```

------------------------------------------------------------------------

# Recommended Workflow

For normal extended-monitor usage:

``` text
Plug HDMI
   │
   ▼
Open wdisplays
   │
   ▼
Enable HDMI
   │
   ▼
Arrange displays
   │
   ▼
Apply
   │
   ▼
Use laptop + HDMI as separate displays
```

For presentations or duplicated-screen usage:

``` text
Plug HDMI
   │
   ▼
Make sure HDMI is enabled
   │
   ▼
Check output names
   │
   ▼
Run wl-mirror
   │
   ▼
Laptop screen is duplicated onto HDMI
```

------------------------------------------------------------------------

# Optional --- Create a One-Command Mirror Script

Instead of typing the full `wl-mirror` command every time, create a
script.

Create:

``` text
~/.local/bin/mirror-hdmi
```

Add:

``` bash
#!/usr/bin/env bash

LAPTOP="eDP-1"
HDMI="HDMI-A-1"

# Stop an existing mirror instance.
pkill wl-mirror 2>/dev/null

# Make sure the HDMI output is enabled.
swaymsg output "$HDMI" enable

# Mirror the laptop onto HDMI.
wl-mirror "$LAPTOP" --fullscreen-output "$HDMI"
```

Change `eDP-1` and `HDMI-A-1` if your output names are different.

Make the script executable:

``` bash
chmod +x ~/.local/bin/mirror-hdmi
```

Now you can start mirroring with:

``` bash
mirror-hdmi
```

------------------------------------------------------------------------

# Optional --- Add a Sway Shortcut

Open your Sway configuration:

``` text
~/.config/sway/config
```

Add:

``` text
bindsym $mod+m exec ~/.local/bin/mirror-hdmi
```

Reload Sway:

``` bash
swaymsg reload
```

Now your workflow can be:

``` text
Plug HDMI
    ↓
Super + M
    ↓
Laptop screen mirrored to HDMI
```

> `$mod` is commonly configured as the Super/Windows key in Sway.

------------------------------------------------------------------------

# Troubleshooting

## HDMI Does Not Appear

Check:

``` bash
swaymsg -t get_outputs
```

If the HDMI output exists but is disabled:

``` bash
swaymsg output HDMI-A-1 enable
```

Then open:

``` bash
wdisplays
```

------------------------------------------------------------------------

## `wl-mirror` Says the Output Does Not Exist

Your output probably has a different name.

Run:

``` bash
swaymsg -t get_outputs
```

Then replace:

``` text
eDP-1
HDMI-A-1
```

with the names reported by your system.

------------------------------------------------------------------------

## Mirroring the Wrong Display

The first output passed to `wl-mirror` is the display being captured.

For example:

``` bash
wl-mirror eDP-1 --fullscreen-output HDMI-A-1
```

means:

``` text
eDP-1 → HDMI-A-1
Laptop → HDMI
```

------------------------------------------------------------------------

## HDMI Has the Wrong Resolution

Open:

``` bash
wdisplays
```

Select the HDMI display and choose a resolution supported by the
monitor/projector.

You can also inspect available modes using:

``` bash
swaymsg -t get_outputs
```

------------------------------------------------------------------------

# Quick Reference

  ------------------------------------------------------------------------------------------------
  Goal                    Tool                    Command
  ----------------------- ----------------------- ------------------------------------------------
  Graphically configure   wdisplays               `wdisplays`
  displays                                        

  List detected displays  Sway                    `swaymsg -t get_outputs`

  Enable HDMI             Sway                    `swaymsg output HDMI-A-1 enable`

  Extended desktop        wdisplays               Arrange displays and click Apply

  Duplicate laptop to     wl-mirror               `wl-mirror eDP-1 --fullscreen-output HDMI-A-1`
  HDMI                                            

  Stop mirroring          wl-mirror               `pkill wl-mirror`

  Reload Sway config      Sway                    `swaymsg reload`
  ------------------------------------------------------------------------------------------------

------------------------------------------------------------------------

# Suggested Setup

For an **Arch + Sway laptop**, a practical setup is:

-   Use **wdisplays** whenever you want to configure, position, or
    extend displays.
-   Use **wl-mirror** whenever you want to duplicate the laptop screen
    for a TV, monitor, or projector.
-   Create `~/.local/bin/mirror-hdmi` if you mirror frequently.
-   Bind the script to `$mod+m` for quick presentation mode.

This gives you both a GUI for normal monitor management and a simple
command/shortcut for true screen duplication.
