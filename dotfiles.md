# Meu Backup de Dotfiles (Noctalia + Niri)

Este arquivo contém as configurações para o Niri, Noctalia e outros programas relacionados (Ghostty, Quickshell).

## `~/.config/niri/config.kdl`

```kdl
// Set the overview wallpaper on the backdrop.
layer-rule {
  match namespace="^noctalia-overview*"
  place-within-backdrop true

  }

/* Noctalia: blur everywhere without xray for a better look */
layer-rule {
  match namespace="^noctalia-(background|launcher-overlay|dock)-.*$"
  background-effect {
    xray false
  }
}

// This config is in the KDL format: https://kdl.dev
// "/-" comments out the following node.
// Check the wiki for a full description of the configuration:
// https://yalter.github.io/niri/Configuration:-Introduction

// Input device configuration.
// Find the full list of options on the wiki:
// https://yalter.github.io/niri/Configuration:-Input
input {
    keyboard {
        xkb {
            // You can set rules, model, layout, variant and options.
            // For more information, see xkeyboard-config(7).

            // For example:
            // layout "us,ru"
            // options "grp:win_space_toggle,compose:ralt,ctrl:nocaps"

            // If this section is empty, niri will fetch xkb settings
            // from org.freedesktop.locale1. You can control these using
            // localectl set-x11-keymap.
        }

        // Enable numlock on startup, omitting this setting disables it.
        numlock
    }

    // Next sections include libinput settings.
    // Omitting settings disables them, or leaves them at their default values.
    // All commented-out settings here are examples, not defaults.
    touchpad {
        // off
        tap
        // dwt
        // dwtp
        // drag false
        // drag-lock
        natural-scroll
        // accel-speed 0.2
        // accel-profile "flat"
        // scroll-method "two-finger"
        // disabled-on-external-mouse
    }

    mouse {
        // off
        // natural-scroll
        // accel-speed 0.2
        // accel-profile "flat"
        // scroll-method "no-scroll"
    }

    trackpoint {
        // off
        // natural-scroll
        // accel-speed 0.2
        // accel-profile "flat"
        // scroll-method "on-button-down"
        // scroll-button 273
        // scroll-button-lock
        // middle-emulation
    }

    // Uncomment this to make the mouse warp to the center of newly focused windows.
    // warp-mouse-to-focus

    // Focus windows and outputs automatically when moving the mouse into them.
    // Setting max-scroll-amount="0%" makes it work only on windows already fully on screen.
   focus-follows-mouse
}

output "eDP-1" {

    mode "1920x1080@59.997"
    scale 1.00
    transform "normal"
    position x=0 y=0
}

// Enable on-demand VRR when mpv displays on the output.
window-rule {
    match app-id="^mpv$"

    variable-refresh-rate true
}

// Settings that influence how windows are positioned and sized.
// Find more information on the wiki:
// https://yalter.github.io/niri/Configuration:-Layout
layout {
    // Set gaps around windows in logical pixels.
    gaps 20

    // When to center a column when changing focus, options are:
    // - "never", default behavior, focusing an off-screen column will keep at the left
    //   or right edge of the screen.
    // - "always", the focused column will always be centered.
    // - "on-overflow", focusing a column will center it if it doesn't fit
    //   together with the previously focused column.
    center-focused-column "never"

    // You can customize the widths that "switch-preset-column-width" (Mod+R) toggles between.
    preset-column-widths {
        // Proportion sets the width as a fraction of the output width, taking gaps into account.
        // For example, you can perfectly fit four windows sized "proportion 0.25" on an output.
        // The default preset widths are 1/3, 1/2 and 2/3 of the output.
        proportion 0.33333
        proportion 0.5
        proportion 0.66667

        // Fixed sets the width in logical pixels exactly.
        // fixed 1920
    }

    // You can also customize the heights that "switch-preset-window-height" (Mod+Shift+R) toggles between.
    // preset-window-heights { }

    // You can change the default width of the new windows.
    default-column-width { proportion 1.0; }
    // If you leave the brackets empty, the windows themselves will decide their initial width.
    // default-column-width {}

    // By default focus ring and border are rendered as a solid background rectangle
    // behind windows. That is, they will show up through semitransparent windows.
    // This is because windows using client-side decorations can have an arbitrary shape.
    //
    // If you don't like that, you should uncomment `prefer-no-csd` below.
    // Niri will draw focus ring and border *around* windows that agree to omit their
    // client-side decorations.
    //
    // Alternatively, you can override it with a window rule called
    // `draw-border-with-background`.

    // You can change how the focus ring looks.
    focus-ring {
        // Uncomment this line to disable the focus ring.
     // off

        // How many logical pixels the ring extends out from the windows.
        width 4

        // Colors can be set in a variety of ways:
        // - CSS named colors: "red"
        // - RGB hex: "#rgb", "#rgba", "#rrggbb", "#rrggbbaa"
        // - CSS-like notation: "rgb(255, 127, 0)", rgba(), hsl() and a few others.

        // Color of the ring on the active monitor.
        active-color "#7fc8ff"

        // Color of the ring on inactive monitors.
        //
        // The focus ring only draws around the active window, so the only place
        // where you can see its inactive-color is on other monitors.
         inactive-color "#505050"

        // You can also use gradients. They take precedence over solid colors.
        // Gradients are rendered the same as CSS linear-gradient(angle, from, to).
        // The angle is the same as in linear-gradient, and is optional,
        // defaulting to 180 (top-to-bottom gradient).
        // You can use any CSS linear-gradient tool on the web to set these up.
        // Changing the color space is also supported, check the wiki for more info.
        //
        // active-gradient from="#80c8ff" to="#c7ff7f" angle=45

        // You can also color the gradient relative to the entire view
        // of the workspace, rather than relative to just the window itself.
        // To do that, set relative-to="workspace-view".
        //
        // inactive-gradient from="#505050" to="#808080" angle=45 relative-to="workspace-view"
    }

    // You can also add a border. It's similar to the focus ring, but always visible.
    border {
        // The settings are the same as for the focus ring.
        // If you enable the border, you probably want to disable the focus ring.
        off

       // width 4
        active-color "#ffc87f"
        inactive-color "#505050"

        // Color of the border around windows that request your attention.
        urgent-color "#9b0000"

        // Gradients can use a few different interpolation color spaces.
        // For example, this is a pastel rainbow gradient via in="oklch longer hue".
        //
        // active-gradient from="#e5989b" to="#ffb4a2" angle=45 relative-to="workspace-view" in="oklch longer hue"

        // inactive-gradient from="#505050" to="#808080" angle=45 relative-to="workspace-view"
    }

    // You can enable drop shadows for windows.
    shadow {
        // Enable shadows.
         on

        // By default, the shadow draws only around its window, and not behind it.
        // Uncomment this setting to make the shadow draw behind its window.
        //
        // Note that niri has no way of knowing about the CSD window corner
        // radius. It has to assume that windows have square corners, leading to
        // shadow artifacts inside the CSD rounded corners. This setting fixes
        // those artifacts.
        //
        // However, instead you may want to set prefer-no-csd and/or
        // geometry-corner-radius. Then, niri will know the corner radius and
        // draw the shadow correctly, without having to draw it behind the
        // window. These will also remove client-side shadows if the window
        // draws any.
        //
        // draw-behind-window true

        // You can change how shadows look. The values below are in logical
        // pixels and match the CSS box-shadow properties.

        // Softness controls the shadow blur radius.
        softness 30

        // Spread expands the shadow.
        spread 5

        // Offset moves the shadow relative to the window.
        offset x=0 y=5

        // You can also change the shadow color and opacity.
        color "#0007"
    }

    // Struts shrink the area occupied by windows, similarly to layer-shell panels.
    // You can think of them as a kind of outer gaps. They are set in logical pixels.
    // Left and right struts will cause the next window to the side to always be visible.
    // Top and bottom struts will simply add outer gaps in addition to the area occupied by
    // layer-shell panels and regular gaps.
    struts {
        // left 64
        // right 64
        // top 64
        // bottom 64
    }
}

// Add lines like this to spawn processes at startup.
// Note that running niri as a session supports xdg-desktop-autostart,
// which may be more convenient to use.
// See the binds section below for more spawn examples.

// Noctalia shell (via quickshell) — replaces waybar
spawn-sh-at-startup "QT_QPA_PLATFORMTHEME=gtk3 qs -c noctalia-shell"

// Lock the screen at startup to act as a login manager
spawn-sh-at-startup "for i in $(seq 1 100); do if qs -c noctalia-shell ipc call lockScreen lock 2>/dev/null; then break; fi; sleep 0.1; done"

// Polkit authentication agent
spawn-sh-at-startup "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &"

environment {
    XCURSOR_THEME "Adwaita"
    XCURSOR_SIZE "24"
}

cursor {
    xcursor-theme "Adwaita"
    xcursor-size 24
}

hotkey-overlay {
    // Disable the "Important Hotkeys" pop-up at startup.
     skip-at-startup
}

// Ask the clients to omit their client-side decorations if possible.
// Additionally, clients will be informed that they are tiled, removing some client-side rounded corners.
// This option will also fix border/focus ring drawing behind some semitransparent windows.
prefer-no-csd

// You can change the path where screenshots are saved.
// A ~ at the front will be expanded to the home directory.
// The path is formatted with strftime(3) to give you the screenshot date and time.
screenshot-path "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png"

// You can also set this to null to disable saving screenshots to disk.
// screenshot-path null

// Animation settings.
// The wiki explains how to configure individual animations:
// https://yalter.github.io/niri/Configuration:-Animations
animations {
    // Uncomment to turn off all animations.
    // off

    // Slow down all animations by this factor. Values below 1 speed them up instead.
    // slowdown 3.0
}

// Window rules let you adjust behavior for individual windows.
// Find more information on the wiki:
// https://yalter.github.io/niri/Configuration:-Window-Rules

// Work around WezTerm's initial configure bug
// by setting an empty default-column-width.
window-rule {
    // This regular expression is intentionally made as specific as possible,
    // since this is the default config, and we want no false positives.
    // You can get away with just app-id="wezterm" if you want.
    match app-id=r#"^org\.wezfurlong\.wezterm$"#
    default-column-width {}
}

// Open the Firefox picture-in-picture player as floating by default.
window-rule {
    // This app-id regular expression will work for both:
    // - host Firefox (app-id is "firefox")
    // - Flatpak Firefox (app-id is "org.mozilla.firefox")
    match app-id=r#"firefox$"# title="^Picture-in-Picture$"
    open-floating true
 }

// Example: block out two password managers from screen capture.
// (This example rule is commented out with a "/-" in front.)
/-window-rule {
    match app-id=r#"^org\.keepassxc\.KeePassXC$"#
    match app-id=r#"^org\.gnome\.World\.Secrets$"#

    block-out-from "screen-capture"

    // Use this instead if you want them visible on third-party screenshot tools.
    // block-out-from "screencast"
}

// Enable rounded corners, transparency and blur for all windows.
window-rule {
    geometry-corner-radius 12
    clip-to-geometry true
    opacity 0.90

  }

window-rule {
  background-effect {
    blur false
    xray false
  }
}

window-rule {
    draw-border-with-background false
}

binds {

 Mod+D {
        spawn-sh "qs -c noctalia-shell ipc call launcher toggle"
    }

    // Custom App Shortcuts
    Mod+B { spawn "zen-browser" ; }
    Mod+E { spawn "nautilus" ; }

    // Keys consist of modifiers separated by + signs, followed by an XKB key name
    // in the end. To find an XKB name for a particular key, you may use a program
    // like wev.
    //
    // "Mod" is a special modifier equal to Super when running on a TTY, and to Alt
    // when running as a winit window.
    //
    // Most actions that you can bind here can also be invoked programmatically with
    // `niri msg action do-something`.

    // Mod-Shift-/, which is usually the same as Mod-?,
    // shows a list of important hotkeys.
    Mod+Shift+Slash { show-hotkey-overlay; }

    // Suggested binds for running programs: terminal, app launcher, screen locker.
    Mod+T hotkey-overlay-title="Open a Terminal: ghostty" { spawn "ghostty"; }
    // Mod+D hotkey-overlay-title="Run an Application: fuzzel" { spawn "fuzzel"; }
    // Super+Alt+L hotkey-overlay-title="Lock the Screen: swaylock" { spawn "swaylock"; }

    // Use spawn-sh to run a shell command. Do this if you need pipes, multiple commands, etc.
    // Note: the entire command goes as a single argument. It's passed verbatim to `sh -c`.
    // For example, this is a standard bind to toggle the screen reader (orca).
    Super+Alt+S allow-when-locked=true hotkey-overlay-title=null { spawn-sh "pkill orca || exec orca"; }

    // Example volume keys mappings for PipeWire & WirePlumber.
    // The allow-when-locked=true property makes them work even when the session is locked.
    // Using spawn-sh allows to pass multiple arguments together with the command.
    // "-l 1.0" limits the volume to 100%.
    XF86AudioRaiseVolume allow-when-locked=true { spawn-sh "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1+ -l 1.0"; }
    XF86AudioLowerVolume allow-when-locked=true { spawn-sh "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1-"; }
    XF86AudioMute        allow-when-locked=true { spawn-sh "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"; }
    XF86AudioMicMute     allow-when-locked=true { spawn-sh "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"; }

    // Media keys (requires playerctl — install with: sudo pacman -S playerctl)
    // XF86AudioPlay        allow-when-locked=true { spawn-sh "playerctl play-pause"; }
    // XF86AudioStop        allow-when-locked=true { spawn-sh "playerctl stop"; }
    // XF86AudioPrev        allow-when-locked=true { spawn-sh "playerctl previous"; }
    // XF86AudioNext        allow-when-locked=true { spawn-sh "playerctl next"; }

    // Example brightness key mappings for brightnessctl.
    // You can use regular spawn with multiple arguments too (to avoid going through "sh"),
    // but you need to manually put each argument in separate "" quotes.
    XF86MonBrightnessUp allow-when-locked=true { spawn "brightnessctl" "--class=backlight" "set" "+10%"; }
    XF86MonBrightnessDown allow-when-locked=true { spawn "brightnessctl" "--class=backlight" "set" "10%-"; }

    // Open/close the Overview: a zoomed-out view of workspaces and windows.
    // You can also move the mouse into the top-left hot corner,
    // or do a four-finger swipe up on a touchpad.
    Mod+Space repeat=false { toggle-overview; }

    Mod+Q repeat=false { close-window; }

    Mod+Left  { focus-column-left; }
    Mod+Down  { focus-window-down; }
    Mod+Up    { focus-window-up; }
    Mod+Right { focus-column-right; }
    Mod+H     { focus-column-left; }
    Mod+J     { focus-window-down; }
    Mod+K     { focus-window-up; }
    Mod+L     { spawn-sh "qs -c noctalia-shell ipc call sessionMenu toggle"; }
    Mod+P     { spawn-sh "qs -c noctalia-shell ipc call settings toggle"; }

    Mod+Ctrl+Left  { move-column-left; }
    Mod+Ctrl+Down  { move-window-down; }
    Mod+Ctrl+Up    { move-window-up; }
    Mod+Ctrl+Right { move-column-right; }
    Mod+Ctrl+H     { move-column-left; }
    Mod+Ctrl+J     { move-window-down; }
    Mod+Ctrl+K     { move-window-up; }
    Mod+Ctrl+L     { move-column-right; }

    // Alternative commands that move across workspaces when reaching
    // the first or last window in a column.
    // Mod+J     { focus-window-or-workspace-down; }
    // Mod+K     { focus-window-or-workspace-up; }
    // Mod+Ctrl+J     { move-window-down-or-to-workspace-down; }
    // Mod+Ctrl+K     { move-window-up-or-to-workspace-up; }

    Mod+Home { focus-column-first; }
    Mod+End  { focus-column-last; }
    Mod+Ctrl+Home { move-column-to-first; }
    Mod+Ctrl+End  { move-column-to-last; }

    Mod+Shift+Left  { focus-monitor-left; }
    Mod+Shift+Down  { focus-monitor-down; }
    Mod+Shift+Up    { focus-monitor-up; }
    Mod+Shift+Right { focus-monitor-right; }
    Mod+Shift+H     { focus-monitor-left; }
    Mod+Shift+J     { focus-monitor-down; }
    Mod+Shift+K     { focus-monitor-up; }
    Mod+Shift+L     { focus-monitor-right; }

    Mod+Shift+Ctrl+Left  { move-column-to-monitor-left; }
    Mod+Shift+Ctrl+Down  { move-column-to-monitor-down; }
    Mod+Shift+Ctrl+Up    { move-column-to-monitor-up; }
    Mod+Shift+Ctrl+Right { move-column-to-monitor-right; }
    Mod+Shift+Ctrl+H     { move-column-to-monitor-left; }
    Mod+Shift+Ctrl+J     { move-column-to-monitor-down; }
    Mod+Shift+Ctrl+K     { move-column-to-monitor-up; }
    Mod+Shift+Ctrl+L     { move-column-to-monitor-right; }

    // Alternatively, there are commands to move just a single window:
    // Mod+Shift+Ctrl+Left  { move-window-to-monitor-left; }
    // ...

    // And you can also move a whole workspace to another monitor:
    // Mod+Shift+Ctrl+Left  { move-workspace-to-monitor-left; }
    // ...

    Mod+Page_Down      { focus-workspace-down; }
    Mod+Page_Up        { focus-workspace-up; }
    Mod+U              { focus-workspace-down; }
    Mod+I              { focus-workspace-up; }
    Mod+Ctrl+Page_Down { move-column-to-workspace-down; }
    Mod+Ctrl+Page_Up   { move-column-to-workspace-up; }
    Mod+Ctrl+U         { move-column-to-workspace-down; }
    Mod+Ctrl+I         { move-column-to-workspace-up; }

    // Alternatively, there are commands to move just a single window:
    // Mod+Ctrl+Page_Down { move-window-to-workspace-down; }
    // ...

    Mod+Shift+Page_Down { move-workspace-down; }
    Mod+Shift+Page_Up   { move-workspace-up; }
    Mod+Shift+U         { move-workspace-down; }
    Mod+Shift+I         { move-workspace-up; }

    // You can bind mouse wheel scroll ticks using the following syntax.
    // These binds will change direction based on the natural-scroll setting.
    //
    // To avoid scrolling through workspaces really fast, you can use
    // the cooldown-ms property. The bind will be rate-limited to this value.
    // You can set a cooldown on any bind, but it's most useful for the wheel.
    Mod+WheelScrollDown      cooldown-ms=150 { focus-workspace-down; }
    Mod+WheelScrollUp        cooldown-ms=150 { focus-workspace-up; }
    Mod+Ctrl+WheelScrollDown cooldown-ms=150 { move-column-to-workspace-down; }
    Mod+Ctrl+WheelScrollUp   cooldown-ms=150 { move-column-to-workspace-up; }

    Mod+WheelScrollRight      { focus-column-right; }
    Mod+WheelScrollLeft       { focus-column-left; }
    Mod+Ctrl+WheelScrollRight { move-column-right; }
    Mod+Ctrl+WheelScrollLeft  { move-column-left; }

    // Usually scrolling up and down with Shift in applications results in
    // horizontal scrolling; these binds replicate that.
    Mod+Shift+WheelScrollDown      { focus-column-right; }
    Mod+Shift+WheelScrollUp        { focus-column-left; }
    Mod+Ctrl+Shift+WheelScrollDown { move-column-right; }
    Mod+Ctrl+Shift+WheelScrollUp   { move-column-left; }

    // Similarly, you can bind touchpad scroll "ticks".
    // Touchpad scrolling is continuous, so for these binds it is split into
    // discrete intervals.
    // These binds are also affected by touchpad's natural-scroll, so these
    // example binds are "inverted", since we have natural-scroll enabled for
    // touchpads by default.
    // Mod+TouchpadScrollDown { spawn-sh "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.02+"; }
    // Mod+TouchpadScrollUp   { spawn-sh "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.02-"; }

    // You can refer to workspaces by index. However, keep in mind that
    // niri is a dynamic workspace system, so these commands are kind of
    // "best effort". Trying to refer to a workspace index bigger than
    // the current workspace count will instead refer to the bottommost
    // (empty) workspace.
    //
    // For example, with 2 workspaces + 1 empty, indices 3, 4, 5 and so on
    // will all refer to the 3rd workspace.
    Mod+1 { focus-workspace 1; }
    Mod+2 { focus-workspace 2; }
    Mod+3 { focus-workspace 3; }
    Mod+4 { focus-workspace 4; }
    Mod+5 { focus-workspace 5; }
    Mod+6 { focus-workspace 6; }
    Mod+7 { focus-workspace 7; }
    Mod+8 { focus-workspace 8; }
    Mod+9 { focus-workspace 9; }
    Mod+Ctrl+1 { move-column-to-workspace 1; }
    Mod+Ctrl+2 { move-column-to-workspace 2; }
    Mod+Ctrl+3 { move-column-to-workspace 3; }
    Mod+Ctrl+4 { move-column-to-workspace 4; }
    Mod+Ctrl+5 { move-column-to-workspace 5; }
    Mod+Ctrl+6 { move-column-to-workspace 6; }
    Mod+Ctrl+7 { move-column-to-workspace 7; }
    Mod+Ctrl+8 { move-column-to-workspace 8; }
    Mod+Ctrl+9 { move-column-to-workspace 9; }

    // Alternatively, there are commands to move just a single window:
    // Mod+Ctrl+1 { move-window-to-workspace 1; }

    // Switches focus between the current and the previous workspace.
    // Mod+Tab { focus-workspace-previous; }

    // The following binds move the focused window in and out of a column.
    // If the window is alone, they will consume it into the nearby column to the side.
    // If the window is already in a column, they will expel it out.
    Mod+BracketLeft  { consume-or-expel-window-left; }
    Mod+BracketRight { consume-or-expel-window-right; }

    // Consume one window from the right to the bottom of the focused column.
    Mod+Comma  { consume-window-into-column; }
    // Expel the bottom window from the focused column to the right.
    Mod+Period { expel-window-from-column; }

    Mod+R { switch-preset-column-width; }
    // Cycling through the presets in reverse order is also possible.
    // Mod+R { switch-preset-column-width-back; }
    Mod+Shift+R { switch-preset-window-height; }
    Mod+Ctrl+R { reset-window-height; }
    Mod+F { maximize-column; }
    Mod+Shift+F { fullscreen-window; }

    // Expand the focused column to space not taken up by other fully visible columns.
    // Makes the column "fill the rest of the space".
    Mod+Ctrl+F { expand-column-to-available-width; }

    Mod+C { center-column; }

    // Center all fully visible columns on screen.
    Mod+Ctrl+C { center-visible-columns; }

    // Finer width adjustments.
    // This command can also:
    // * set width in pixels: "1000"
    // * adjust width in pixels: "-5" or "+5"
    // * set width as a percentage of screen width: "25%"
    // * adjust width as a percentage of screen width: "-10%" or "+10%"
    // Pixel sizes use logical, or scaled, pixels. I.e. on an output with scale 2.0,
    // set-column-width "100" will make the column occupy 200 physical screen pixels.
    Mod+Minus { set-column-width "-10%"; }
    Mod+Equal { set-column-width "+10%"; }

    // Finer height adjustments when in column with other windows.
    Mod+Shift+Minus { set-window-height "-10%"; }
    Mod+Shift+Equal { set-window-height "+10%"; }

    // Move the focused window between the floating and the tiling layout.
    Mod+V       { toggle-window-floating; }
    Mod+Shift+V { switch-focus-between-floating-and-tiling; }

    // Toggle tabbed column display mode.
    // Windows in this column will appear as vertical tabs,
    // rather than stacked on top of each other.
    Mod+W { toggle-column-tabbed-display; }

    // Actions to switch layouts.
    // Note: if you uncomment these, make sure you do NOT have
    // a matching layout switch hotkey configured in xkb options above.
    // Having both at once on the same hotkey will break the switching,
    // since it will switch twice upon pressing the hotkey (once by xkb, once by niri).
    // Mod+Space       { switch-layout "next"; }
    // Mod+Shift+Space { switch-layout "prev"; }

    Print { screenshot; }
    Ctrl+Print { screenshot-screen; }
    Alt+Print { screenshot-window; }

    // Applications such as remote-desktop clients and software KVM switches may
    // request that niri stops processing the keyboard shortcuts defined here
    // so they may, for example, forward the key presses as-is to a remote machine.
    // It's a good idea to bind an escape hatch to toggle the inhibitor,
    // so a buggy application can't hold your session hostage.
    //
    // The allow-inhibiting=false property can be applied to other binds as well,
    // which ensures niri always processes them, even when an inhibitor is active.
    Mod+Escape allow-inhibiting=false { toggle-keyboard-shortcuts-inhibit; }

    // The quit action will show a confirmation dialog to avoid accidental exits.
    Mod+Shift+E { quit; }
    Ctrl+Alt+Delete { quit; }

    // Powers off the monitors. To turn them back on, do any input like
    // moving the mouse or pressing any other key.
    Mod+Shift+P { power-off-monitors; }
}

// Reduced blur for increased visibility
blur {
    passes 1
    offset 1.0
}

include "./noctalia.kdl"
```

## `~/.config/niri/noctalia.kdl`

```kdl
layout {

    focus-ring {
        active-color   "#aaaaaa"
        inactive-color "#3c3c3c"
        urgent-color   "#dddddd"
    }

    border {
        active-color   "#aaaaaa"
        inactive-color "#3c3c3c"
        urgent-color   "#dddddd"
    }

    shadow {
        color "#00000070"
    }

    tab-indicator {
        active-color   "#aaaaaa"
        inactive-color "#3c3c3c"
        urgent-color   "#dddddd"
    }

    insert-hint {
        color "#aaaaaa80"
    }
}

recent-windows {
    highlight {
        active-color "#aaaaaa"
        urgent-color "#dddddd"
    }
}
```

## `~/.config/noctalia/plugins.json`

```json
{
    "sources": [
        {
            "enabled": true,
            "name": "Noctalia Plugins",
            "url": "https://github.com/noctalia-dev/noctalia-plugins"
        }
    ],
    "states": {
        "catwalk": {
            "enabled": true,
            "sourceUrl": "https://github.com/noctalia-dev/noctalia-plugins"
        },
        "pomodoro": {
            "enabled": true,
            "sourceUrl": "https://github.com/noctalia-dev/noctalia-plugins"
        }
    },
    "version": 2
}
```

## `~/.config/noctalia/settings.json`

```json
{
    "appLauncher": {
        "autoPasteClipboard": false,
        "clipboardWatchImageCommand": "wl-paste --type image --watch cliphist store",
        "clipboardWatchTextCommand": "wl-paste --type text --watch cliphist store",
        "clipboardWrapText": true,
        "customLaunchPrefix": "",
        "customLaunchPrefixEnabled": false,
        "density": "default",
        "enableClipPreview": true,
        "enableClipboardChips": true,
        "enableClipboardHistory": false,
        "enableClipboardSmartIcons": true,
        "enableSessionSearch": true,
        "enableSettingsSearch": true,
        "enableWindowsSearch": true,
        "iconMode": "native",
        "ignoreMouseInput": false,
        "overviewLayer": false,
        "pinnedApps": [
            "code",
            "sqldeveloper",
            "obsidian",
            "com.mitchellh.ghostty",
            "eclipse",
            "org.gnome.Nautilus",
            "zen",
            "com.valvesoftware.SteamLink"
        ],
        "position": "center",
        "screenshotAnnotationTool": "",
        "showCategories": false,
        "showIconBackground": false,
        "sortByMostUsed": false,
        "terminalCommand": "alacritty -e",
        "viewMode": "list"
    },
    "audio": {
        "mprisBlacklist": [
        ],
        "preferredPlayer": "",
        "spectrumFrameRate": 30,
        "spectrumMirrored": true,
        "visualizerType": "linear",
        "volumeFeedback": false,
        "volumeFeedbackSoundFile": "",
        "volumeOverdrive": false,
        "volumeStep": 5
    },
    "bar": {
        "autoHideDelay": 500,
        "autoShowDelay": 150,
        "backgroundOpacity": 0.9,
        "barType": "floating",
        "capsuleColorKey": "none",
        "capsuleOpacity": 1,
        "contentPadding": 2,
        "density": "default",
        "displayMode": "always_visible",
        "enableExclusionZoneInset": false,
        "fontScale": 1.2000000000000002,
        "frameRadius": 12,
        "frameThickness": 8,
        "hideOnOverview": false,
        "marginHorizontal": 216,
        "marginVertical": 5,
        "middleClickAction": "none",
        "middleClickCommand": "",
        "middleClickFollowMouse": false,
        "monitors": [
        ],
        "mouseWheelAction": "none",
        "mouseWheelWrap": true,
        "outerCorners": true,
        "position": "top",
        "reverseScroll": false,
        "rightClickAction": "controlCenter",
        "rightClickCommand": "",
        "rightClickFollowMouse": true,
        "screenOverrides": [
        ],
        "showCapsule": false,
        "showOnWorkspaceSwitch": true,
        "showOutline": false,
        "useSeparateOpacity": true,
        "widgetSpacing": 7,
        "widgets": {
            "center": [
                {
                    "defaultSettings": {
                        "hideBackground": false,
                        "minimumThreshold": 10
                    },
                    "id": "plugin:catwalk"
                },
                {
                    "clockColor": "none",
                    "customFont": "JetBrainsMono Nerd Font",
                    "formatHorizontal": "HH:mm ddd d",
                    "formatVertical": "HH mm - dd MM",
                    "id": "Clock",
                    "tooltipFormat": "HH:mm ddd, MMM dd",
                    "useCustomFont": true
                }
            ],
            "left": [
                {
                    "colorizeSystemIcon": "none",
                    "colorizeSystemText": "none",
                    "customIconPath": "",
                    "enableColorization": true,
                    "icon": "rocket",
                    "iconColor": "none",
                    "id": "Launcher",
                    "useDistroLogo": true
                },
                {
                    "characterCount": 2,
                    "colorizeIcons": false,
                    "emptyColor": "secondary",
                    "enableScrollWheel": true,
                    "focusedColor": "primary",
                    "followFocusedScreen": false,
                    "fontWeight": "bold",
                    "groupedBorderOpacity": 1,
                    "hideUnoccupied": false,
                    "iconScale": 0.8,
                    "id": "Workspace",
                    "labelMode": "index",
                    "occupiedColor": "secondary",
                    "pillSize": 0.6,
                    "showApplications": false,
                    "showApplicationsHover": false,
                    "showBadge": true,
                    "showLabelsOnlyWhenOccupied": true,
                    "unfocusedIconsOpacity": 1
                },
                {
                    "colorizeIcons": false,
                    "hideMode": "hidden",
                    "id": "ActiveWindow",
                    "maxWidth": 145,
                    "scrollingMode": "hover",
                    "showIcon": true,
                    "showText": false,
                    "textColor": "none",
                    "useFixedWidth": false
                },
                {
                    "compactMode": false,
                    "hideMode": "hidden",
                    "hideWhenIdle": false,
                    "id": "MediaMini",
                    "maxWidth": 145,
                    "panelShowAlbumArt": true,
                    "scrollingMode": "hover",
                    "showAlbumArt": true,
                    "showArtistFirst": true,
                    "showProgressRing": true,
                    "showVisualizer": false,
                    "textColor": "none",
                    "useFixedWidth": false,
                    "visualizerType": "linear"
                }
            ],
            "right": [
                {
                    "blacklist": [
                    ],
                    "chevronColor": "none",
                    "colorizeIcons": false,
                    "drawerEnabled": true,
                    "hidePassive": false,
                    "id": "Tray",
                    "pinned": [
                    ]
                },
                {
                    "colorizeDistroLogo": false,
                    "colorizeSystemIcon": "none",
                    "colorizeSystemText": "none",
                    "customIconPath": "",
                    "enableColorization": true,
                    "icon": "noctalia",
                    "id": "ControlCenter",
                    "useDistroLogo": false
                },
                {
                    "hideWhenZero": false,
                    "hideWhenZeroUnread": false,
                    "iconColor": "none",
                    "id": "NotificationHistory",
                    "showUnreadBadge": true,
                    "unreadBadgeColor": "primary"
                },
                {
                    "defaultSettings": {
                        "autoStartBreaks": false,
                        "autoStartWork": false,
                        "longBreakDuration": 15,
                        "sessionsBeforeLongBreak": 4,
                        "shortBreakDuration": 5,
                        "workDuration": 25
                    },
                    "id": "plugin:pomodoro"
                },
                {
                    "displayMode": "onhover",
                    "iconColor": "none",
                    "id": "Network",
                    "textColor": "none"
                },
                {
                    "displayMode": "onhover",
                    "iconColor": "none",
                    "id": "Volume",
                    "middleClickCommand": "pwvucontrol || pavucontrol",
                    "textColor": "none"
                },
                {
                    "applyToAllMonitors": false,
                    "displayMode": "onhover",
                    "iconColor": "none",
                    "id": "Brightness",
                    "textColor": "none"
                },
                {
                    "deviceNativePath": "__default__",
                    "displayMode": "graphic",
                    "hideIfIdle": false,
                    "hideIfNotDetected": true,
                    "id": "Battery",
                    "showNoctaliaPerformance": false,
                    "showPowerProfiles": false
                }
            ]
        }
    },
    "brightness": {
        "backlightDeviceMappings": [
        ],
        "brightnessStep": 1,
        "enableDdcSupport": false,
        "enforceMinimum": true
    },
    "calendar": {
        "cards": [
            {
                "enabled": true,
                "id": "calendar-header-card"
            },
            {
                "enabled": true,
                "id": "calendar-month-card"
            },
            {
                "enabled": true,
                "id": "weather-card"
            }
        ]
    },
    "colorSchemes": {
        "darkMode": true,
        "generationMethod": "tonal-spot",
        "manualSunrise": "06:30",
        "manualSunset": "18:30",
        "monitorForColors": "",
        "predefinedScheme": "Monochrome",
        "schedulingMode": "off",
        "syncGsettings": true,
        "useWallpaperColors": false
    },
    "controlCenter": {
        "cards": [
            {
                "enabled": true,
                "id": "profile-card"
            },
            {
                "enabled": true,
                "id": "shortcuts-card"
            },
            {
                "enabled": true,
                "id": "audio-card"
            },
            {
                "enabled": true,
                "id": "brightness-card"
            },
            {
                "enabled": true,
                "id": "weather-card"
            },
            {
                "enabled": true,
                "id": "media-sysmon-card"
            }
        ],
        "diskPath": "/",
        "position": "close_to_bar_button",
        "shortcuts": {
            "left": [
                {
                    "id": "Network"
                },
                {
                    "id": "Bluetooth"
                },
                {
                    "id": "NoctaliaPerformance"
                }
            ],
            "right": [
                {
                    "id": "Notifications"
                },
                {
                    "id": "PowerProfile"
                },
                {
                    "id": "KeepAwake"
                }
            ]
        }
    },
    "desktopWidgets": {
        "enabled": false,
        "gridSnap": false,
        "gridSnapScale": false,
        "monitorWidgets": [
        ],
        "overviewEnabled": true
    },
    "dock": {
        "animationSpeed": 0.6,
        "backgroundOpacity": 1,
        "colorizeIcons": false,
        "deadOpacity": 0.6,
        "displayMode": "auto_hide",
        "dockType": "floating",
        "enabled": false,
        "floatingRatio": 1.4000000000000001,
        "groupApps": false,
        "groupClickAction": "cycle",
        "groupContextMenuMode": "extended",
        "groupIndicatorStyle": "dots",
        "inactiveIndicators": false,
        "indicatorColor": "primary",
        "indicatorOpacity": 0.6,
        "indicatorThickness": 3,
        "launcherIcon": "",
        "launcherIconColor": "none",
        "launcherPosition": "end",
        "launcherUseDistroLogo": false,
        "monitors": [
        ],
        "onlySameOutput": true,
        "pinnedApps": [
        ],
        "pinnedStatic": false,
        "position": "bottom",
        "showDockIndicator": false,
        "showLauncherIcon": false,
        "sitOnFrame": false,
        "size": 1.5
    },
    "general": {
        "allowPanelsOnScreenWithoutBar": true,
        "allowPasswordWithFprintd": false,
        "animationDisabled": false,
        "animationSpeed": 1,
        "autoStartAuth": false,
        "avatarImage": "/home/freitas/.face",
        "boxRadiusRatio": 1,
        "clockFormat": "hh\\nmm",
        "clockStyle": "digital",
        "compactLockScreen": true,
        "dimmerOpacity": 0.15,
        "enableBlurBehind": true,
        "enableLockScreenCountdown": true,
        "enableLockScreenMediaControls": false,
        "enableShadows": true,
        "forceBlackScreenCorners": false,
        "iRadiusRatio": 1,
        "keybinds": {
            "keyDown": [
                "Down"
            ],
            "keyEnter": [
                "Return",
                "Enter"
            ],
            "keyEscape": [
                "Esc"
            ],
            "keyLeft": [
                "Left"
            ],
            "keyRemove": [
                "Del"
            ],
            "keyRight": [
                "Right"
            ],
            "keyUp": [
                "Up"
            ]
        },
        "language": "",
        "lockOnSuspend": true,
        "lockScreenAnimations": true,
        "lockScreenBlur": 0.5,
        "lockScreenCountdownDuration": 10000,
        "lockScreenMonitors": [
        ],
        "lockScreenTint": 0,
        "passwordChars": true,
        "radiusRatio": 1,
        "reverseScroll": false,
        "scaleRatio": 1,
        "screenRadiusRatio": 1,
        "shadowDirection": "center",
        "shadowOffsetX": 0,
        "shadowOffsetY": 0,
        "showChangelogOnStartup": true,
        "showHibernateOnLockScreen": false,
        "showScreenCorners": false,
        "showSessionButtonsOnLockScreen": true,
        "smoothScrollEnabled": true,
        "telemetryEnabled": false
    },
    "hooks": {
        "colorGeneration": "",
        "darkModeChange": "",
        "enabled": false,
        "performanceModeDisabled": "",
        "performanceModeEnabled": "",
        "screenLock": "",
        "screenUnlock": "",
        "session": "",
        "startup": "",
        "wallpaperChange": ""
    },
    "idle": {
        "customCommands": "[]",
        "enabled": true,
        "fadeDuration": 5,
        "lockCommand": "",
        "lockTimeout": 3000,
        "resumeLockCommand": "",
        "resumeScreenOffCommand": "",
        "resumeSuspendCommand": "",
        "screenOffCommand": "",
        "screenOffTimeout": 2700,
        "suspendCommand": "",
        "suspendTimeout": 3100
    },
    "location": {
        "analogClockInCalendar": false,
        "autoLocate": false,
        "firstDayOfWeek": -1,
        "hideWeatherCityName": false,
        "hideWeatherTimezone": true,
        "name": "Embu-Guaçu",
        "showCalendarEvents": true,
        "showCalendarWeather": true,
        "showWeekNumberInCalendar": false,
        "use12hourFormat": false,
        "useFahrenheit": false,
        "weatherEnabled": true,
        "weatherShowEffects": true,
        "weatherTaliaMascotAlways": false
    },
    "network": {
        "bluetoothAutoConnect": false,
        "bluetoothDetailsViewMode": "grid",
        "bluetoothHideUnnamedDevices": false,
        "bluetoothRssiPollIntervalMs": 60000,
        "bluetoothRssiPollingEnabled": false,
        "disableDiscoverability": false,
        "networkPanelView": "wifi",
        "wifiDetailsViewMode": "grid"
    },
    "nightLight": {
        "autoSchedule": true,
        "dayTemp": "6500",
        "enabled": false,
        "forced": false,
        "manualSunrise": "06:30",
        "manualSunset": "18:30",
        "nightTemp": "4000"
    },
    "noctaliaPerformance": {
        "disableDesktopWidgets": true,
        "disableWallpaper": false
    },
    "notifications": {
        "backgroundOpacity": 1,
        "clearDismissed": true,
        "criticalUrgencyDuration": 15,
        "density": "default",
        "enableBatteryToast": true,
        "enableKeyboardLayoutToast": true,
        "enableMarkdown": false,
        "enableMediaToast": false,
        "enabled": true,
        "location": "top_right",
        "lowUrgencyDuration": 3,
        "monitors": [
        ],
        "normalUrgencyDuration": 8,
        "overlayLayer": true,
        "respectExpireTimeout": false,
        "saveToHistory": {
            "critical": true,
            "low": true,
            "normal": true
        },
        "sounds": {
            "criticalSoundFile": "",
            "enabled": false,
            "excludedApps": "discord,firefox,chrome,chromium,edge",
            "lowSoundFile": "",
            "normalSoundFile": "",
            "separateSounds": false,
            "volume": 0.5
        }
    },
    "osd": {
        "autoHideMs": 2000,
        "backgroundOpacity": 1,
        "enabled": true,
        "enabledTypes": [
            0,
            1,
            2
        ],
        "location": "top_right",
        "monitors": [
        ],
        "overlayLayer": true
    },
    "plugins": {
        "autoUpdate": false,
        "notifyUpdates": true
    },
    "sessionMenu": {
        "countdownDuration": 10000,
        "enableCountdown": true,
        "largeButtonsLayout": "single-row",
        "largeButtonsStyle": true,
        "position": "center",
        "powerOptions": [
            {
                "action": "lock",
                "command": "",
                "countdownEnabled": true,
                "enabled": true,
                "keybind": "1"
            },
            {
                "action": "suspend",
                "command": "",
                "countdownEnabled": true,
                "enabled": true,
                "keybind": "2"
            },
            {
                "action": "hibernate",
                "command": "",
                "countdownEnabled": true,
                "enabled": true,
                "keybind": "3"
            },
            {
                "action": "reboot",
                "command": "",
                "countdownEnabled": true,
                "enabled": true,
                "keybind": "4"
            },
            {
                "action": "logout",
                "command": "",
                "countdownEnabled": true,
                "enabled": true,
                "keybind": "5"
            },
            {
                "action": "shutdown",
                "command": "",
                "countdownEnabled": true,
                "enabled": true,
                "keybind": "6"
            },
            {
                "action": "rebootToUefi",
                "command": "",
                "countdownEnabled": true,
                "enabled": true,
                "keybind": "7"
            },
            {
                "action": "userspaceReboot",
                "command": "",
                "countdownEnabled": true,
                "enabled": false,
                "keybind": ""
            }
        ],
        "showHeader": true,
        "showKeybinds": true
    },
    "settingsVersion": 59,
    "systemMonitor": {
        "batteryCriticalThreshold": 5,
        "batteryWarningThreshold": 20,
        "cpuCriticalThreshold": 90,
        "cpuWarningThreshold": 80,
        "criticalColor": "",
        "diskAvailCriticalThreshold": 10,
        "diskAvailWarningThreshold": 20,
        "diskCriticalThreshold": 90,
        "diskWarningThreshold": 80,
        "enableDgpuMonitoring": false,
        "externalMonitor": "resources || missioncenter || jdsystemmonitor || corestats || system-monitoring-center || gnome-system-monitor || plasma-systemmonitor || mate-system-monitor || ukui-system-monitor || deepin-system-monitor || pantheon-system-monitor",
        "gpuCriticalThreshold": 90,
        "gpuWarningThreshold": 80,
        "memCriticalThreshold": 90,
        "memWarningThreshold": 80,
        "swapCriticalThreshold": 90,
        "swapWarningThreshold": 80,
        "tempCriticalThreshold": 90,
        "tempWarningThreshold": 80,
        "useCustomColors": false,
        "warningColor": ""
    },
    "templates": {
        "activeTemplates": [
        ],
        "enableUserTheming": false
    },
    "ui": {
        "boxBorderEnabled": true,
        "fontDefault": "JetBrainsMono Nerd Font",
        "fontDefaultScale": 1,
        "fontFixed": "JetBrainsMono Nerd Font Mono",
        "fontFixedScale": 1,
        "panelBackgroundOpacity": 0.93,
        "panelsAttachedToBar": true,
        "scrollbarAlwaysVisible": true,
        "settingsPanelMode": "attached",
        "settingsPanelSideBarCardStyle": false,
        "tooltipsEnabled": true,
        "translucentWidgets": true
    },
    "wallpaper": {
        "automationEnabled": false,
        "directory": "/home/freitas/Pictures/Wallpapers",
        "enableMultiMonitorDirectories": false,
        "enabled": true,
        "favorites": [
        ],
        "fillColor": "#000000",
        "fillMode": "crop",
        "hideWallpaperFilenames": false,
        "linkLightAndDarkWallpapers": true,
        "monitorDirectories": [
        ],
        "overviewBlur": 0,
        "overviewEnabled": false,
        "overviewTint": 0.6,
        "panelPosition": "follow_bar",
        "randomIntervalSec": 300,
        "setWallpaperOnAllMonitors": true,
        "showHiddenFiles": false,
        "skipStartupTransition": false,
        "solidColor": "#1a1a2e",
        "sortOrder": "name",
        "transitionDuration": 1500,
        "transitionEdgeSmoothness": 0.05,
        "transitionType": [
            "fade",
            "disc",
            "stripes",
            "wipe",
            "pixelate",
            "honeycomb"
        ],
        "useOriginalImages": false,
        "useSolidColor": false,
        "useWallhaven": false,
        "viewMode": "single",
        "wallhavenApiKey": "",
        "wallhavenCategories": "111",
        "wallhavenOrder": "desc",
        "wallhavenPurity": "100",
        "wallhavenQuery": "",
        "wallhavenRatios": "",
        "wallhavenResolutionHeight": "",
        "wallhavenResolutionMode": "atleast",
        "wallhavenResolutionWidth": "",
        "wallhavenSorting": "relevance",
        "wallpaperChangeMode": "random"
    }
}
```

## `~/.config/noctalia/colors.json`

```json
{
    "mError": "#dddddd",
    "mHover": "#cccccc",
    "mOnError": "#111111",
    "mOnHover": "#111111",
    "mOnPrimary": "#111111",
    "mOnSecondary": "#111111",
    "mOnSurface": "#828282",
    "mOnSurfaceVariant": "#5d5d5d",
    "mOnTertiary": "#111111",
    "mOutline": "#3c3c3c",
    "mPrimary": "#aaaaaa",
    "mSecondary": "#a7a7a7",
    "mShadow": "#000000",
    "mSurface": "#111111",
    "mSurfaceVariant": "#191919",
    "mTertiary": "#cccccc"
}
```

## `~/.config/noctalia/plugins/catwalk/BarWidget.qml`

```qml
import QtQuick
import QtQuick.Effects
import Quickshell
import Quickshell.Io
import qs.Commons
import qs.Modules.Bar.Extras
import qs.Services.UI
import qs.Widgets
import qs.Services.System

Item {
    id: root

    property var pluginApi: null
    property ShellScreen screen
    property string widgetId: ""
    property string section: ""
    property int sectionWidgetIndex: -1
    property int sectionWidgetsCount: 0

    // Per-screen bar properties
    readonly property string screenName: screen?.name ?? ""
    readonly property string barPosition: Settings.getBarPositionForScreen(screenName)
    readonly property bool barIsVertical: barPosition === "left" || barPosition === "right"
    readonly property real capsuleHeight: Style.getCapsuleHeightForScreen(screenName)

    property url currentIconSource

    property string tooltipText: {
        if (!pluginApi) return "";
        return root.isRunning ? (pluginApi.tr("tooltip.running") || "Running") : (pluginApi.tr("tooltip.sleeping") || "Sleeping");
    }

    property string tooltipDirection: BarService.getTooltipDirection()
    property bool enabled: true
    property bool allowClickWhenDisabled: false
    property bool hovering: false

    property color colorBg: Color.mSurfaceVariant
    property color colorFg: Color.mPrimary
    property color colorBgHover: Color.mHover
    property color colorFgHover: Color.mOnHover
    property color colorBorder: Color.mOutline
    property color colorBorderHover: Color.mOutline
    property real customRadius: Style.radiusL

    signal entered
    signal exited
    signal clicked
    signal rightClicked
    signal middleClicked
    signal wheel(int angleDelta)

    readonly property real contentWidth: barIsVertical ? capsuleHeight : Math.round(capsuleHeight + Style.marginXS * 2)
    readonly property real contentHeight: capsuleHeight

    implicitWidth: contentWidth
    implicitHeight: contentHeight

    // --- Catwalk Specific Logic ---
    property int frameIndex: 0
    property int idleFrameIndex: 0
    readonly property bool isRunning: root.pluginApi?.mainInstance?.isRunning ?? false
    readonly property var icons: root.pluginApi?.mainInstance?.icons || []
    readonly property var idleIcons: root.pluginApi?.mainInstance?.idleIcons || []
    readonly property real cpuUsage: root.pluginApi?.mainInstance?.cpuUsage ?? 0

    function openPanel() {
        if (pluginApi) {
            var result = pluginApi.openPanel(root.screen);
            Logger.i("Catwalk", "OpenPanel result:", result);
        } else {
            Logger.e("Catwalk", "PluginAPI is null");
        }
    }

    function openExternalMonitor() {
        Quickshell.execDetached(["sh", "-c", Settings.data.systemMonitor.externalMonitor]);
    }

    Timer {
        interval: Math.max(30, 200 - root.cpuUsage * 1.7)
        running: root.isRunning
        repeat: true
        onTriggered: {
            root.frameIndex = (root.frameIndex + 1) % root.icons.length
        }
    }

    Timer {
        interval: 400
        running: !root.isRunning
        repeat: true
        onTriggered: {
            root.idleFrameIndex = (root.idleFrameIndex + 1) % root.idleIcons.length
        }
    }

    currentIconSource: (root.icons && root.icons.length > 0 && root.idleIcons && root.idleIcons.length > 0)
                       ? (root.isRunning
                           ? Qt.resolvedUrl(root.icons[root.frameIndex % root.icons.length])
                           : Qt.resolvedUrl(root.idleIcons[root.idleFrameIndex % root.idleIcons.length]))
                       : ""

    Rectangle {
        id: visualCapsule
        x: Style.pixelAlignCenter(parent.width, width)
        y: Style.pixelAlignCenter(parent.height, height)
        width: root.contentWidth
        height: root.contentHeight
        opacity: root.enabled ? Style.opacityFull : Style.opacityMedium
        color: mouseArea.containsMouse ? Color.mHover : Style.capsuleColor
        radius: Math.min((customRadius >= 0 ? customRadius : Style.iRadiusL), width / 2)
        border.color: Style.capsuleBorderColor
        border.width: Style.capsuleBorderWidth

        Behavior on color {
            ColorAnimation {
                duration: Style.animationNormal
                easing.type: Easing.InOutQuad
            }
        }

        Image {
            id: iconImage
            source: root.currentIconSource
            x: Style.pixelAlignCenter(parent.width, width)
            y: Style.pixelAlignCenter(parent.height, height)

            width: Style.toOdd(visualCapsule.width - Style.marginXS * 2)
            height: width

            // Render SVG at exact target size for crisp output
            sourceSize: Qt.size(width, height)
            fillMode: Image.PreserveAspectFit
            smooth: true
            mipmap: false

            // This enables the "mask" behavior to recolor the icon
            layer.enabled: true
            layer.effect: MultiEffect {
                colorization: 1.0
                colorizationColor: Settings.data.colorSchemes.darkMode ? "white" : "black"
            }
        }
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        cursorShape: root.enabled ? Qt.PointingHandCursor : Qt.ArrowCursor
        acceptedButtons: Qt.LeftButton | Qt.RightButton | Qt.MiddleButton
        hoverEnabled: true
        onEntered: {
            root.hovering = true;
            if (root.tooltipText) {
                TooltipService.show(root, root.tooltipText, root.tooltipDirection);
            }
            root.entered();
        }
        onExited: {
            root.hovering = false;
            if (root.tooltipText) {
                TooltipService.hide();
            }
            root.exited();
        }
        onClicked: function (mouse) {
            if (root.tooltipText) {
                TooltipService.hide();
            }

            Logger.i("Catwalk", "Clicked! API:", !!pluginApi, "Screen:", root.screen ? root.screen.name : "null");

            if (!root.enabled && !root.allowClickWhenDisabled) {
                return;
            }
            // Open Panel on left/right click
            // Open external monitor on middle click
            if (mouse.button === Qt.LeftButton) {
                root.openPanel();
                root.clicked();
            } else if (mouse.button === Qt.RightButton) {
                root.openPanel();
                root.rightClicked();
            } else if (mouse.button === Qt.MiddleButton) {
                root.openExternalMonitor();
                root.middleClicked();
            }
        }
        onWheel: wheel => root.wheel(wheel.angleDelta.y)
    }
}
```

## `~/.config/noctalia/plugins/catwalk/DesktopWidget.qml`

```qml
import QtQuick
import QtQuick.Layouts
import QtQuick.Effects
import Quickshell
import qs.Commons
import qs.Modules.DesktopWidgets
import qs.Widgets
import qs.Services.System

DraggableDesktopWidget {
    id: root
    property var pluginApi: null

    implicitWidth: 200
    implicitHeight: 80

    showBackground: !(root.pluginApi?.mainInstance?.hideBackground ?? false)

    property int frameIndex: 0
    
    readonly property var icons: root.pluginApi?.mainInstance?.icons || []
    
    property int idleFrameIndex: 0
    readonly property var idleIcons: root.pluginApi?.mainInstance?.idleIcons || []

    readonly property bool isRunning: root.pluginApi?.mainInstance?.isRunning ?? false
    readonly property real cpuUsage: root.pluginApi?.mainInstance?.cpuUsage ?? 0

    Timer {
        interval: Math.max(30, 200 - root.cpuUsage * 1.7)
        running: root.isRunning
        repeat: true
        onTriggered: {
            root.frameIndex = (root.frameIndex + 1) % root.icons.length
        }
    }
    
    Timer {
        interval: 400
        running: !root.isRunning
        repeat: true
        onTriggered: {
            root.idleFrameIndex = (root.idleFrameIndex + 1) % root.idleIcons.length
        }
    }

    property url currentIconSource: (root.icons && root.icons.length > 0 && root.idleIcons && root.idleIcons.length > 0)
                       ? (root.isRunning
                           ? Qt.resolvedUrl(root.icons[root.frameIndex % root.icons.length])
                           : Qt.resolvedUrl(root.idleIcons[root.idleFrameIndex % root.idleIcons.length]))
                       : ""

    RowLayout {
        anchors.fill: parent
        spacing: 5
        
        Image {
            id: iconImage
            source: root.currentIconSource
            Layout.fillHeight: true
            Layout.preferredWidth: height
            
            sourceSize.height: height
            sourceSize.width: width
            
            fillMode: Image.PreserveAspectFit
            smooth: true
            mipmap: false 

            layer.enabled: true
            layer.effect: MultiEffect {
                colorization: 1.0
                colorizationColor: Settings.data.colorSchemes.darkMode ? "white" : "black"
            }
        }

        Text {
            text: Math.round(root.cpuUsage) + "%"
            color: Settings.data.colorSchemes.darkMode ? "white" : "black"
            font.bold: true
            font.pixelSize: 40
            Layout.alignment: Qt.AlignVCenter
        }
    }
}
```

## `~/.config/noctalia/plugins/catwalk/Main.qml`

```qml
import QtQuick
import Quickshell
import qs.Services.System

Item {
    id: root

    property var pluginApi: null

    readonly property real minimumThreshold: pluginApi?.pluginSettings?.minimumThreshold || 10
    readonly property bool hideBackground: pluginApi?.pluginSettings?.hideBackground ?? false
    
    property real cpuUsage: SystemStatService.cpuUsage
    readonly property bool isRunning: cpuUsage >= minimumThreshold

    readonly property var icons: ["icons/my-active-0-symbolic.svg", "icons/my-active-1-symbolic.svg", "icons/my-active-2-symbolic.svg", "icons/my-active-3-symbolic.svg", "icons/my-active-4-symbolic.svg"]
    readonly property var idleIcons: ["icons/my-idle-0-symbolic.svg", "icons/my-idle-1-symbolic.svg", "icons/my-idle-2-symbolic.svg", "icons/my-idle-3-symbolic.svg"]
}
```

## `~/.config/noctalia/plugins/catwalk/Panel.qml`

```qml
import QtQuick
import QtQuick.Effects
import QtQuick.Layouts
import qs.Commons
import qs.Services.System
import qs.Widgets

Item {
    id: root
    property var pluginApi: null

    // SmartPanel properties
    readonly property var geometryPlaceholder: panelContainer
    readonly property bool allowAttach: true
    property real contentPreferredWidth: 300 * Style.uiScaleRatio
    property real contentPreferredHeight: 300 * Style.uiScaleRatio

    anchors.fill: parent

    Rectangle {
        id: panelContainer
        anchors.fill: parent
        color: "transparent"

        Rectangle {
            anchors.fill: parent
            anchors.margins: Style.marginL
            color: Color.mSurface
            radius: Style.radiusL
            border.color: Color.mOutline
            border.width: Style.borderS

            ColumnLayout {
                anchors.centerIn: parent
                spacing: Style.marginL

                // Big Cat
                Item {
                    id: bigCatItem
                    Layout.preferredWidth: 128 * Style.uiScaleRatio
                    Layout.preferredHeight: 128 * Style.uiScaleRatio
                    Layout.alignment: Qt.AlignHCenter

                    property int frameIndex: 0
                    
                    readonly property bool isRunning: root.pluginApi?.mainInstance?.isRunning ?? false
                    readonly property var icons: root.pluginApi?.mainInstance?.icons || []
                    
                    property int idleFrameIndex: 0
                    readonly property var idleIcons: root.pluginApi?.mainInstance?.idleIcons || []
                    
                    readonly property real cpuUsage: root.pluginApi?.mainInstance?.cpuUsage ?? 0

                    Timer {
                        interval: Math.max(30, 200 - bigCatItem.cpuUsage * 1.7)
                        running: bigCatItem.isRunning
                        repeat: true
                        onTriggered: bigCatItem.frameIndex = (bigCatItem.frameIndex + 1) % bigCatItem.icons.length
                    }
                    
                    Timer {
                        interval: 400
                        running: !bigCatItem.isRunning
                        repeat: true
                        onTriggered: bigCatItem.idleFrameIndex = (bigCatItem.idleFrameIndex + 1) % bigCatItem.idleIcons.length
                    }

                    Image {
                        id: bigCatImage
                        anchors.fill: parent
                        
                        source: (bigCatItem.icons && bigCatItem.icons.length > 0 && bigCatItem.idleIcons && bigCatItem.idleIcons.length > 0)
                                ? (bigCatItem.isRunning
                                    ? Qt.resolvedUrl(bigCatItem.icons[bigCatItem.frameIndex % bigCatItem.icons.length])
                                    : Qt.resolvedUrl(bigCatItem.idleIcons[bigCatItem.idleFrameIndex % bigCatItem.idleIcons.length]))
                                : ""
                        
                        fillMode: Image.PreserveAspectFit
                        smooth: true
                        mipmap: true

                        // This handles the programmatic coloring
                        layer.enabled: true
                        layer.effect: MultiEffect {
                            colorization: 1.0
                            colorizationColor: Settings.data.colorSchemes.darkMode ? "white" : "black"
                        }
                    }
                }

                // CPU Stats
                Text {
                    Layout.alignment: Qt.AlignHCenter
                    text: (pluginApi?.tr("panel.cpuLabel") || "CPU: {usage}%").replace("{usage}", Math.round(root.pluginApi?.mainInstance?.cpuUsage ?? 0))
                    font.pointSize: Style.fontSizeXL
                    font.weight: Font.Bold
                    color: Settings.data.colorSchemes.darkMode ? "white" : "black"
                }
            }
        }
    }
}
```

## `~/.config/noctalia/plugins/catwalk/README.md`

```md
# Catwalk Plugin for Noctalia

A cute animated cat for your Noctalia bar that reacts to your system's CPU usage.

## Features

- **Animated Cat**: The cat walks/runs on your bar based on CPU usage
- **CPU-Based Animation**:
  - Below minimum threshold: Shows idle animation with "Zz" bubbles
  - Above minimum threshold: Walks faster as CPU usage increases
  - Speed scales continuously with CPU load
- **Popup Panel**: Click the cat to open a larger animated version with CPU stats
- **Theme Support**: Automatically switches between light/dark mode icons
- **Configurable Settings**: Adjust the minimum CPU threshold for running animation

## Installation

This plugin is part of the `noctalia-plugins` repository.

## Configuration

Access the plugin settings in Noctalia to configure:

- **Minimum CPU Threshold**: Set the CPU usage percentage (5-25%) above which the cat starts running. Below this, it stays idle with "Zz" animation.

## Usage

- The cat icon appears on your bar
- It automatically animates based on your CPU usage
- Click to open the CPU stats panel

## Requirements

- Noctalia 3.6.0 or later
```

## `~/.config/noctalia/plugins/catwalk/Settings.qml`

```qml
import QtQuick
import QtQuick.Layouts
import qs.Widgets
import qs.Commons

ColumnLayout {
    id: root

    // Plugin API (injected by the settings dialog system)
    property var pluginApi: null

    // Local state - track changes before saving
    property real valueMinimumThreshold: pluginApi?.mainInstance?.minimumThreshold ?? (pluginApi?.pluginSettings?.minimumThreshold || 10)
    property bool valueHideBackground: pluginApi?.mainInstance?.hideBackground ?? (pluginApi?.pluginSettings?.hideBackground ?? false)

    spacing: Style.marginM

    Component.onCompleted: {
        Logger.i("Catwalk", "Settings UI loaded");
    }

    ColumnLayout {
        Layout.fillWidth: true
        spacing: Style.marginS

        NLabel {
            label: pluginApi?.tr("settings.minimumThreshold.label") || "Minimum CPU Threshold"
            description: pluginApi?.tr("settings.minimumThreshold.description") || "CPU usage must be above this percentage for the cat to start running"
        }

        NSlider {
            id: thresholdSlider
            from: 5
            to: 25
            value: root.valueMinimumThreshold
            stepSize: 1
            onValueChanged: {
                root.valueMinimumThreshold = value
            }
        }

        Text {
            text: (pluginApi?.tr("settings.currentThreshold") || "Current threshold: {value}%").replace("{value}", thresholdSlider.value)
            color: Color.mOnSurfaceVariant
            font.pointSize: Style.fontSizeS
        }
    }

    NToggle {
        label: pluginApi?.tr("settings.hideBackground.label") || "Hide Background"
        description: pluginApi?.tr("settings.hideBackground.description") || "Hide the background of the desktop widget"

        checked: root.valueHideBackground
        onToggled: function(checked) {
            root.valueHideBackground = checked
        }
    }

    // This function is called by the dialog to save settings
    function saveSettings() {
        if (!pluginApi) {
            Logger.e("Catwalk", "Cannot save settings: pluginApi is null");
            return;
        }

        // Update the plugin settings object
        pluginApi.pluginSettings.minimumThreshold = root.valueMinimumThreshold;
        pluginApi.pluginSettings.hideBackground = root.valueHideBackground;

        // Save to disk
        pluginApi.saveSettings();

        Logger.i("Catwalk", "Settings saved successfully");
    }
}
```

## `~/.config/noctalia/plugins/catwalk/manifest.json`

```json
{
  "id": "catwalk",
  "name": "Catwalk",
  "version": "1.1.7",
  "minNoctaliaVersion": "3.6.0",
  "author": "MannuVilasara",
  "license": "MIT",
  "repository": "https://github.com/noctalia-dev/noctalia-plugins",
  "description": "A cute animated cat for your bar.",
  "tags": [
    "Bar",
    "Desktop",
    "Panel",
    "Fun"
  ],
  "entryPoints": {
    "main": "Main.qml",
    "barWidget": "BarWidget.qml",
    "desktopWidget": "DesktopWidget.qml",
    "panel": "Panel.qml",
    "settings": "Settings.qml"
  },
  "dependencies": {
    "plugins": []
  },
  "metadata": {
    "defaultSettings": {
      "minimumThreshold": 10,
      "hideBackground": false
    }
  }
}
```

<!-- Não foi possível ler /home/freitas/.config/noctalia/plugins/catwalk/preview.png: 'utf-8' codec can't decode byte 0x89 in position 0: invalid start byte -->

## `~/.config/noctalia/plugins/catwalk/i18n/de.json`

```json
{
  "panel": {
    "cpuLabel": "CPU: {usage}%",
    "title": "Catwalk"
  },
  "settings": {
    "currentThreshold": "Aktuelle Schwelle: {value}%",
    "hideBackground": {
      "description": "Verstecke den Hintergrund des Desktop-Widgets",
      "label": "Hintergrund ausblenden"
    },
    "minimumThreshold": {
      "description": "Die CPU-Auslastung muss über diesem Prozentsatz liegen, damit die Katze zu laufen beginnt",
      "label": "Minimale CPU-Schwelle"
    },
    "title": "Catwalk-Einstellungen"
  },
  "tooltip": {
    "running": "Katze läuft",
    "sleeping": "Katze schläft"
  }
}
```

## `~/.config/noctalia/plugins/catwalk/i18n/en.json`

```json
{
  "panel": {
    "cpuLabel": "CPU: {usage}%",
    "title": "Catwalk"
  },
  "settings": {
    "currentThreshold": "Current threshold: {value}%",
    "hideBackground": {
      "description": "Hide the background of the desktop widget",
      "label": "Hide Background"
    },
    "minimumThreshold": {
      "description": "CPU usage must be above this percentage for the cat to start running",
      "label": "Minimum CPU Threshold"
    },
    "title": "Catwalk Settings"
  },
  "tooltip": {
    "running": "Cat is running",
    "sleeping": "Cat is sleeping"
  }
}
```

## `~/.config/noctalia/plugins/catwalk/i18n/es.json`

```json
{
  "panel": {
    "cpuLabel": "CPU: {usage}%",
    "title": "Catwalk"
  },
  "settings": {
    "currentThreshold": "Umbral actual: {value}%",
    "hideBackground": {
      "description": "Ocultar el fondo del widget de escritorio",
      "label": "Ocultar fondo"
    },
    "minimumThreshold": {
      "description": "El uso de CPU debe estar por encima de este porcentaje para que el gato empiece a correr",
      "label": "Umbral mínimo de CPU"
    },
    "title": "Configuración de Catwalk"
  },
  "tooltip": {
    "running": "El gato está corriendo",
    "sleeping": "El gato está durmiendo"
  }
}
```

## `~/.config/noctalia/plugins/catwalk/i18n/fr.json`

```json
{
  "panel": {
    "cpuLabel": "CPU : {usage}%",
    "title": "Catwalk"
  },
  "settings": {
    "currentThreshold": "Seuil actuel : {value}%",
    "hideBackground": {
      "description": "Masquer l'arrière-plan du widget de bureau",
      "label": "Masquer l'arrière-plan"
    },
    "minimumThreshold": {
      "description": "L'utilisation du CPU doit être supérieure à ce pourcentage pour que le chat commence à courir",
      "label": "Seuil minimum CPU"
    },
    "title": "Paramètres Catwalk"
  },
  "tooltip": {
    "running": "Le chat court",
    "sleeping": "Le chat dort"
  }
}
```

## `~/.config/noctalia/plugins/catwalk/i18n/hu.json`

```json
{
  "panel": {
    "cpuLabel": "CPU: {usage}%",
    "title": "Sétasáv"
  },
  "settings": {
    "currentThreshold": "Aktuális küszöbérték: {value}%",
    "hideBackground": {
      "description": "Asztali widget hátterének elrejtése",
      "label": "Háttér elrejtése"
    },
    "minimumThreshold": {
      "description": "A processzorhasználatnak e fölött a százalék felett kell lennie, hogy a macska futni kezdjen",
      "label": "Minimum CPU Küszöbérték"
    },
    "title": "Catwalk beállítások"
  },
  "tooltip": {
    "running": "A Noctalia fut.",
    "sleeping": "A macska alszik"
  }
}
```

## `~/.config/noctalia/plugins/catwalk/i18n/it.json`

```json
{
  "panel": {
    "cpuLabel": "CPU: {usage}%",
    "title": "Catwalk"
  },
  "settings": {
    "currentThreshold": "Soglia attuale: {value}%",
    "hideBackground": {
      "description": "Nascondi lo sfondo del widget desktop",
      "label": "Nascondi sfondo"
    },
    "minimumThreshold": {
      "description": "L'utilizzo della CPU deve essere superiore a questa percentuale affinché il gatto inizi a correre",
      "label": "Soglia minima CPU"
    },
    "title": "Impostazioni Catwalk"
  },
  "tooltip": {
    "running": "Il gatto sta correndo",
    "sleeping": "Il gatto sta dormendo"
  }
}
```

## `~/.config/noctalia/plugins/catwalk/i18n/ja.json`

```json
{
  "panel": {
    "cpuLabel": "CPU: {usage}%",
    "title": "Catwalk"
  },
  "settings": {
    "currentThreshold": "現在のしきい値: {value}%",
    "hideBackground": {
      "description": "デスクトップウィジェットの背景を隠す",
      "label": "背景を隠す"
    },
    "minimumThreshold": {
      "description": "猫が走り始めるにはCPU使用率がこの割合を超えている必要があります",
      "label": "最小CPUしきい値"
    },
    "title": "Catwalk設定"
  },
  "tooltip": {
    "running": "猫が走っています",
    "sleeping": "猫が寝ています"
  }
}
```

## `~/.config/noctalia/plugins/catwalk/i18n/ku.json`

```json
{
  "panel": {
    "cpuLabel": "CPU: {usage}%",
    "title": "Rêwînga pisîkan"
  },
  "settings": {
    "currentThreshold": "Astana niha: {value}%",
    "hideBackground": {
      "description": "Paşxana wîceta sermaseyê veşêre",
      "label": "Veşartina Paşxanê"
    },
    "minimumThreshold": {
      "description": "Divê bikaranîna CPU ji vê rêjeyê bilindtir be da ku pisîk dest bi bezê bike",
      "label": "Sînorê herî kêm ê CPU"
    },
    "title": "Mîhenên Catwalkê"
  },
  "tooltip": {
    "running": "Pisîk direve",
    "sleeping": "Pisîk radizê."
  }
}
```

## `~/.config/noctalia/plugins/catwalk/i18n/nl.json`

```json
{
  "panel": {
    "cpuLabel": "CPU: {usage}%",
    "title": "Catwalk"
  },
  "settings": {
    "currentThreshold": "Huidige drempelwaarde: {value}%",
    "hideBackground": {
      "description": "Verberg de achtergrond van de bureaubladwidget",
      "label": "Achtergrond verbergen"
    },
    "minimumThreshold": {
      "description": "CPU-gebruik moet boven dit percentage liggen voordat de kat begint te rennen.",
      "label": "Minimale CPU-drempel"
    },
    "title": "Catwalk Instellingen"
  },
  "tooltip": {
    "running": "Kat rent",
    "sleeping": "Kat slaapt"
  }
}
```

## `~/.config/noctalia/plugins/catwalk/i18n/pl.json`

```json
{
  "panel": {
    "cpuLabel": "CPU: {usage}%",
    "title": "Wybieg"
  },
  "settings": {
    "currentThreshold": "Aktualny próg: {value}%",
    "hideBackground": {
      "description": "Ukryj tło widżetu pulpitu",
      "label": "Ukryj tło"
    },
    "minimumThreshold": {
      "description": "Użycie CPU musi przekraczać ten procent, aby kot zaczął biegać",
      "label": "Minimalny próg użycia CPU"
    },
    "title": "Ustawienia Catwalk"
  },
  "tooltip": {
    "running": "Kot jest uruchomiony",
    "sleeping": "Kot śpi"
  }
}
```

## `~/.config/noctalia/plugins/catwalk/i18n/pt.json`

```json
{
  "panel": {
    "cpuLabel": "CPU: {usage}%",
    "title": "Catwalk"
  },
  "settings": {
    "currentThreshold": "Limite atual: {value}%",
    "hideBackground": {
      "description": "Ocultar o fundo do widget da área de trabalho",
      "label": "Ocultar fundo"
    },
    "minimumThreshold": {
      "description": "O uso da CPU deve estar acima desta porcentagem para o gato começar a correr",
      "label": "Limite mínimo de CPU"
    },
    "title": "Configurações do Catwalk"
  },
  "tooltip": {
    "running": "O gato está correndo",
    "sleeping": "O gato está dormindo"
  }
}
```

## `~/.config/noctalia/plugins/catwalk/i18n/ru.json`

```json
{
  "panel": {
    "cpuLabel": "CPU: {usage}%",
    "title": "Catwalk"
  },
  "settings": {
    "currentThreshold": "Текущий порог: {value}%",
    "hideBackground": {
      "description": "Скрыть фон виджета рабочего стола",
      "label": "Скрыть фон"
    },
    "minimumThreshold": {
      "description": "Использование CPU должно быть выше этого процента, чтобы кот начал бежать",
      "label": "Минимальный порог CPU"
    },
    "title": "Настройки Catwalk"
  },
  "tooltip": {
    "running": "Кот бежит",
    "sleeping": "Кот спит"
  }
}
```

## `~/.config/noctalia/plugins/catwalk/i18n/tr.json`

```json
{
  "panel": {
    "cpuLabel": "CPU: {usage}%",
    "title": "Podyum"
  },
  "settings": {
    "currentThreshold": "Mevcut eşik: {value}%",
    "hideBackground": {
      "description": "Masaüstü bileşeninin arka planını gizle",
      "label": "Arka planı gizle"
    },
    "minimumThreshold": {
      "description": "CPU kullanımı, kedinin koşmaya başlaması için bu yüzdeden yüksek olmalıdır.",
      "label": "Minimum CPU Eşiği"
    },
    "title": "Podyum Ayarları"
  },
  "tooltip": {
    "running": "Kedi koşuyor.",
    "sleeping": "Kedi uyuyor."
  }
}
```

## `~/.config/noctalia/plugins/catwalk/i18n/uk-UA.json`

```json
{
  "panel": {
    "cpuLabel": "ЦП: {usage}%",
    "title": "Подіум"
  },
  "settings": {
    "currentThreshold": "Поточний поріг: {value}%",
    "hideBackground": {
      "description": "Приховати фон віджета робочого столу",
      "label": "Приховати фон"
    },
    "minimumThreshold": {
      "description": "Використання ЦП має бути вище цього відсотка, щоб кіт почав бігати.",
      "label": "Мінімальний поріг ЦП"
    },
    "title": "Налаштування подіуму"
  },
  "tooltip": {
    "running": "Кіт біжить",
    "sleeping": "Кіт спить"
  }
}
```

## `~/.config/noctalia/plugins/catwalk/i18n/zh-CN.json`

```json
{
  "panel": {
    "cpuLabel": "CPU：{usage}%",
    "title": "猫步"
  },
  "settings": {
    "currentThreshold": "当前阈值：{value}%",
    "hideBackground": {
      "description": "隐藏桌面小部件的背景",
      "label": "隐藏背景"
    },
    "minimumThreshold": {
      "description": "CPU 使用率必须高于此百分比，猫才能开始跑动。",
      "label": "最低CPU阈值"
    },
    "title": "时装秀场布置"
  },
  "tooltip": {
    "running": "猫在跑",
    "sleeping": "猫在睡觉"
  }
}
```

## `~/.config/noctalia/plugins/catwalk/icons/my-active-0-symbolic.svg`

```svg
<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<svg
        xmlns:dc="http://purl.org/dc/elements/1.1/"
        xmlns:cc="http://creativecommons.org/ns#"
        xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
        xmlns:svg="http://www.w3.org/2000/svg"
        xmlns="http://www.w3.org/2000/svg"
        version="1.1"
        height="388"
        width="388"
>
    <defs id="defs3051">
    <style type="text/css" id="current-color-scheme">
      .ColorScheme-Text {
        color:#ffffff
      }
      </style>
  </defs>
    <metadata>
        <rdf:RDF>
            <cc:Work rdf:about="">
                <dc:format>image/svg+xml</dc:format>
                <dc:type rdf:resource="http://purl.org/dc/dcmitype/StillImage"/>
                <dc:title>RunCat: Frame 0</dc:title>
            </cc:Work>
        </rdf:RDF>
    </metadata>
    <title>RunCat: Frame 0</title>
    <path style="fill:currentColor"
            d="m 321.24,116.28019 c -0.01,-13.464 1.661,-33.778997 -8.15,-35.162997 -9.811,-1.384 -25.074,26.578997 -25.074,26.578997 l -4.43,0.554 c 0,0 3.6,-26.025997 -8.86,-23.256997 -12.46,2.769 -27.687,41.810997 -27.687,41.810997 0,0 -5.538,4.429 -9.414,18.3 -3.876,13.871 -18.55,14.09 -42.915,11.045 -24.365,-3.045 -47.345,17.443 -47.345,17.443 -22.15,-0.831 -40.977,2.215 -55.374,7.752 -14.397,5.537 -32.117,23.811 -55.375,22.15 -23.258,-1.661 -34.332,2.492 -32.947,10.521 1.385,8.029 9.413,9.414 22.426,10.8 13.013,1.386 44.853,-7.476 65.342,-19.381 a 78.147,78.147 0 0 1 41.53,-10.143 c -2.768,24.19 6.646,21.218 5.538,45.029 -1.108,23.811 8.583,46.791 24.365,59.527 15.782,12.736 21.6,6.091 22.149,-1.661 0.549,-7.752 -15.781,-27.687 -16.335,-35.44 -0.554,-7.753 9.137,-1.384 10.244,0.554 1.107,1.938 16.889,17.166 29.9,20.489 13.011,3.323 7.2,-15.782 2.492,-27.134 -4.708,-11.352 3.6,-22.15 19.1,-24.641 15.5,-2.491 22.7,5.814 19.658,16.058 -3.042,10.244 -4.153,24.919 8.86,24.088 13.013,-0.831 34.332,-32.117 35.993,-50.668 1.661,-18.551 4.153,-28.794 16.059,-32.67 11.906,-3.876 33.5,-15.782 33.5,-37.932 0,-22.15 -23.25,-34.61 -23.25,-34.61 z m -46.722,1.107 c -1.592,6.091 -16.4,11.144 -16.4,11.144 0,0 1.873,-21.665 17.862,-26.28 a 43.462,43.462 0 0 1 -1.462,15.136 z m 16.182,39.385 c -5.433,0 -9.85,-5.237 -9.85,-11.673 0,-6.436 4.417,-11.671 9.85,-11.671 5.433,0 9.85,5.235 9.85,11.671 0,6.436 -4.418,11.673 -9.85,11.673 z m 21.311,-43.907 c -4.155,-2.006 -6.5,-3.074 -10.883,-3.517 0,0 2.808,-11.618997 11.345,-14.110997 a 36.68,36.68 0 0 1 -0.462,17.627997 z m 11.6,40.931 c -5.433,0 -9.85,-5.223 -9.85,-11.644 0,-6.421 4.419,-11.648 9.852,-11.648 5.433,0 9.847,5.225 9.847,11.646 0,6.421 -4.418,11.646 -9.847,11.646 z"
            class="ColorScheme-Text"/>
</svg>
```

## `~/.config/noctalia/plugins/catwalk/icons/my-active-1-symbolic.svg`

```svg
<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<svg
        xmlns:dc="http://purl.org/dc/elements/1.1/"
        xmlns:cc="http://creativecommons.org/ns#"
        xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
        xmlns:svg="http://www.w3.org/2000/svg"
        xmlns="http://www.w3.org/2000/svg"
        version="1.1"
        height="388"
        width="388"
        viewBox="0 0 388 388">
    <defs id="defs3051">
    <style type="text/css" id="current-color-scheme">
      .ColorScheme-Text {
        color:#ffffff
      }
      </style>
  </defs>
    <metadata>
        <rdf:RDF>
            <cc:Work rdf:about="">
                <dc:format>image/svg+xml</dc:format>
                <dc:type rdf:resource="http://purl.org/dc/dcmitype/StillImage"/>
                <dc:title>RunCat: Frame 1</dc:title>
            </cc:Work>
        </rdf:RDF>
    </metadata>
    <title>RunCat: Frame 1</title>
    <path style="fill:currentColor"
            d="m 327.054,197.34487 1.662,-4.153 c 35.162,-4.43 46.517,-27.359 44.671,-42.219 -1.938,-15.6 -17.815,-29.352 -23.629,-31.705 0,0 4.43,-34.885998 -5.261,-34.885998 -11.365,0 -26.856,26.578998 -26.856,26.578998 h -4.153 c 0,0 -0.277,-24.363998 -7.2,-24.086998 -14.939,0.6 -31.01,42.083998 -31.01,42.083998 -3.6,3.876 -4.43,13.29 -14.951,24.088 -10.521,10.798 -36.244,9.357 -56.733,9.08 -20.489,-0.277 -40.724,16.669 -40.724,16.669 -6.368,0 -24.088,-3.323 -39.316,-4.43 -15.228,-1.107 -47.345,0.831 -55.928,1.938 -8.583,1.107 -60.358,12.459 -57.312,23.811 3.046,11.352 24.364,4.153 50.113,0 25.749,-4.153 65.342,-4.43 74.756,-1.384 9.414,3.046 -1.385,20.488 -18.551,25.2 -17.166,4.712 -32.117,22.421 -39.592,30.452 -7.475,8.031 -14.4,23.257 1.938,24.088 16.338,0.831 32.117,-16.613 39.869,-19.381 7.752,-2.768 2.215,8.306 -0.554,15.227 -2.769,6.921 -6.368,28.518 4.984,29.349 11.352,0.831 28.8,-25.472 32.117,-30.179 3.317,-4.707 18,-11.352 21.319,-14.4 3.319,-3.048 12.183,-12.46 12.183,-12.46 0,0 32.394,-0.83 48.729,-3.876 16.335,-3.046 31.84,-15.5 40.146,-16.612 8.306,-1.112 19.935,7.2 22.981,9.414 3.046,2.214 25.749,15.781 37.1,18.55 11.351,2.769 12.46,-12.182 12.46,-12.182 0,0 9.967,4.983 15.5,-6.368 5.533,-11.351 -38.758,-38.207 -38.758,-38.207 z m -28.425,-72.171 c -2.492,3.415 -12,4.984 -12,4.984 0,0 6.46,-19.2 16.8,-23.35 1.753,9.414 -1.739,14.174 -4.8,18.366 z m 53.251,7.5 c 5.5,0 9.967,5.578 9.967,12.459 0,6.881 -4.462,12.459 -9.967,12.459 -5.505,0 -9.967,-5.578 -9.967,-12.459 0,-6.881 4.462,-12.451 9.967,-12.451 z m -11.014,-32.22 c 0.655,6.977 -2.275,14.593 -2.275,14.593 a 30.833,30.833 0 0 0 -8.971,-1.753 c 4.614,-9.183 7.863,-11.931 11.246,-12.84 z m -22.118,58.868 c -5.5,0 -9.967,-5.579 -9.967,-12.46 0,-6.881 4.462,-12.459 9.967,-12.459 5.505,0 9.968,5.578 9.968,12.459 0,6.881 -4.463,12.46 -9.968,12.46 z"
            class="ColorScheme-Text"/>
</svg>
```

## `~/.config/noctalia/plugins/catwalk/icons/my-active-2-symbolic.svg`

```svg
<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<svg
        xmlns:dc="http://purl.org/dc/elements/1.1/"
        xmlns:cc="http://creativecommons.org/ns#"
        xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
        xmlns:svg="http://www.w3.org/2000/svg"
        xmlns="http://www.w3.org/2000/svg"
        version="1.1"
        height="388"
        width="388"
        viewBox="0 0 388 388">
    <defs id="defs3051">
    <style type="text/css" id="current-color-scheme">
      .ColorScheme-Text {
        color:#ffffff
      }
      </style>
  </defs>
    <metadata>
        <rdf:RDF>
            <cc:Work rdf:about="">
                <dc:format>image/svg+xml</dc:format>
                <dc:type rdf:resource="http://purl.org/dc/dcmitype/StillImage"/>
                <dc:title>RunCat: Frame 2</dc:title>
            </cc:Work>
        </rdf:RDF>
    </metadata>
    <title>RunCat: Frame 2</title>
    <path style="fill:currentColor"
            d="m 382.705,182.19956 c 4.43,-19.381 -18,-37.654 -18,-37.654 0,0 6.645,-31.148 0,-33.779 -11.665,-4.617 -30.733,22.427 -30.733,22.427 l -4.707,-0.831 c 5.123,-32.531999 -5.676,-26.3 -18.965,-14.4 -13.289,11.9 -25.334,36.27 -33.917,44.3 -8.583,8.03 -18.827,5.26 -38.208,-3.887 -19.381,-9.147 -42.085,-6.081 -50.668,-1.374 -8.583,4.707 -15.777,1.941 -15.777,1.941 0,0 -24.642,-17.443 -32.394,-20.765 -7.752,-3.322 -28.518,-12.736 -53.99,-13.29 -25.472,-0.554 -46.792,9.967 -46.792,9.967 -10.521,9.137 1.385,16.889 12.737,14.4 11.352,-2.489 38.208,-6.092 56.758,-1.939 18.55,4.153 46.791,25.2 46.238,31.287 -0.553,6.087 -12.09,16.8 -25.2,19.658 -12.9,2.815 -48.175,29.071 -49.283,42.638 -1.108,13.567 14.4,14.4 29.626,6.645 15.226,-7.755 26.856,-1.384 26.856,-1.384 -14.12,13.843 -15.5,30.732 -3.6,33.224 11.9,2.492 22.149,-9.69 37.1,-23.257 14.951,-13.567 29.9,-19.935 53.437,-17.166 23.537,2.769 60.911,-0.554 60.911,-0.554 9.968,9.691 42.915,30.179 55.1,35.993 12.185,5.814 25.749,2.492 27.41,-3.6 1.661,-6.092 -16.612,-20.765 -14.951,-24.641 1.661,-3.876 19.461,3.225 26.411,-7.1 6.4,-9.509 -26.134,-24.46 -31.4,-25.844 -5.266,-1.384 -2.215,-5.814 -2.215,-5.814 17.451,-1.667 33.787,-5.82 38.216,-25.201 z m -18.39,-23.248 c 5.561,0 10.069,5.279 10.069,11.79 0,6.511 -4.508,11.79 -10.069,11.79 -5.561,0 -10.068,-5.278 -10.068,-11.79 0,-6.512 4.508,-11.79 10.068,-11.79 z m -4.728,-35.033 c 0,0 1.28,6.61 -5.019,15.47 a 48.782,48.782 0 0 0 -9.056,-3.089 c 0,0 8.26,-11.689 14.075,-12.381 z m -47.207,20.627 c -3.2,2.628 -10.936,3.184 -10.936,3.184 0,0 5.587,-16.156 19.084,-21.763 -0.277,8.583 -1.872,13.422 -8.148,18.579 z m 19.566,35.506 c -6.015,0 -10.89,-5.608 -10.89,-12.526 0,-6.918 4.875,-12.526 10.89,-12.526 6.015,0 10.89,5.608 10.89,12.526 0,6.918 -4.876,12.526 -10.89,12.526 z"
            class="ColorScheme-Text"/>
</svg>
```

## `~/.config/noctalia/plugins/catwalk/icons/my-active-3-symbolic.svg`

```svg
<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<svg
        xmlns:dc="http://purl.org/dc/elements/1.1/"
        xmlns:cc="http://creativecommons.org/ns#"
        xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
        xmlns:svg="http://www.w3.org/2000/svg"
        xmlns="http://www.w3.org/2000/svg"
        version="1.1"
        height="388"
        width="388"
        viewBox="0 0 388 388">
    <defs id="defs3051">
    <style type="text/css" id="current-color-scheme">
      .ColorScheme-Text {
        color:#ffffff
      }
      </style>
  </defs>
    <metadata>
        <rdf:RDF>
            <cc:Work rdf:about="">
                <dc:format>image/svg+xml</dc:format>
                <dc:type rdf:resource="http://purl.org/dc/dcmitype/StillImage"/>
                <dc:title>RunCat: Frame 3</dc:title>
            </cc:Work>
        </rdf:RDF>
    </metadata>
    <title>RunCat: Frame 3</title>
    <path style="fill:currentColor"
            d="m 364.709,159.58645 c 0,0 13.013,-29.833 4.983,-32.117 -15.7,-4.465 -32.344,14.823 -32.344,14.823 l -4.018,-0.887 c 0,0 3.415,-14.766 2.861,-21.688 -0.554,-6.922 -18.55,0.83 -28.795,9.413 -10.245,8.583 -29.9,36.271 -41.807,41.531 -11.907,5.26 -25.472,-13.013 -43.746,-26.026 -18.274,-13.013 -44.576,-2.492 -44.576,-2.492 -4.43,-1.384 -11.075,-13.566 -24.088,-26.3 C 140.166,103.10945 126.6,93.137455 96.7,88.153455 c -29.9,-4.984 -44.166,4.789 -42.5,11.157 1.666,6.367995 4.3,6.147995 38.352,9.331995 39.125,3.658 50.114,23.534 59.528,34.886 9.414,11.352 -3.046,22.7 -13.844,38.208 -10.798,15.508 -6.922,26.3 -4.984,39.316 1.938,13.016 13.567,16.335 15.5,35.162 1.933,18.827 6.645,25.2 18.551,21.043 11.636,-4.06 6.876,-43.539 6.655,-45.322 0.112,0.294 1.322,0.967 13,-4.515 13.567,-6.368 26.857,3.322 44.3,7.752 17.443,4.43 30.179,-0.277 34.609,9.691 8.9,20.018 23.257,45.13 40.7,53.99 17.443,8.86 20.765,-8.86 14.674,-16.059 -6.091,-7.199 -7.2,-19.1 -7.2,-19.1 34.885,4.984 43.191,-1.661 44.3,-10.244 1.109,-8.583 -17.72,-13.29 -26.857,-18 -9.137,-4.71 -2.768,-12.182 -2.768,-12.182 29.071,-3.323 45.868,-11.352 48.452,-32.394 2.143,-17.453 -12.459,-31.288 -12.459,-31.288 z m -62.3,-8.029 c 0,0 10.429,-15.874 22.242,-19.012 0,0 -0.554,11.352 -5.907,15.69 -6.296,5.105 -16.331,3.324 -16.331,3.324 z m 26.026,37.008 c -5.811,0 -10.521,-5.33 -10.521,-11.905 0,-6.575 4.71,-11.906 10.521,-11.906 5.811,0 10.521,5.331 10.521,11.906 0,6.575 -4.707,11.905 -10.517,11.905 z m 34.516,-49.744 c 0.018,3.471 -4.4,12.116 -6.959,13.62 a 16.906,16.906 0 0 0 -7.883,-4.3 c 1.756,-2.193 8.571,-9.345 14.846,-9.32 z m -2.857,55.638 c -5.084,0 -9.206,-4.913 -9.206,-10.974 0,-6.061 4.122,-10.973 9.206,-10.973 5.084,0 9.207,4.913 9.207,10.973 0,6.06 -4.122,10.974 -9.207,10.974 z"
            class="ColorScheme-Text"/>
</svg>
```

## `~/.config/noctalia/plugins/catwalk/icons/my-active-4-symbolic.svg`

```svg
<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<svg
        xmlns:dc="http://purl.org/dc/elements/1.1/"
        xmlns:cc="http://creativecommons.org/ns#"
        xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
        xmlns:svg="http://www.w3.org/2000/svg"
        xmlns="http://www.w3.org/2000/svg"
        version="1.1"
        height="388"
        width="388"
        viewBox="0 0 388 388">
    <defs id="defs3051">
    <style type="text/css" id="current-color-scheme">
      .ColorScheme-Text {
        color:#ffffff
      }
      </style>
  </defs>
    <metadata>
        <rdf:RDF>
            <cc:Work rdf:about="">
                <dc:format>image/svg+xml</dc:format>
                <dc:type rdf:resource="http://purl.org/dc/dcmitype/StillImage"/>
                <dc:title>RunCat: Frame 4</dc:title>
            </cc:Work>
        </rdf:RDF>
    </metadata>
    <title>RunCat: Frame 4</title>
    <path style="fill:currentColor"
            d="m 328.854,134.31128 c 0,0 9.967,-30.872 0.692,-34.194 -9.275,-3.322 -29.487,19.1 -29.487,19.1 l -4.983,-1.107 c 2.907,-25.057 0.277,-27.411 -14.536,-16.474 -14.813,10.937 -26.58,30.871 -29.625,34.055 -3.045,3.184 -5.953,14.951 -33.5,1.246 -27.547,-13.705 -44.714,-5.814 -60.635,-1.938 -15.921,3.876 -50.113,22.565 -68.941,29.763 -18.828,7.198 -37.931,4.154 -42.084,3.461 -4.153,-0.693 -23.4,-15.228 -30.594,-7.337 -7.194,7.891 0.692,16.336 8.583,22.7 7.891,6.364 27.272,9 43.745,8.444 16.473,-0.556 65.9,-18.273 65.9,-18.273 2.815,3.922 0.877,2.722 1.984,15.274 1.107,12.552 15.874,24 19.75,28.61 3.876,4.61 0.923,9.783 1.661,21.6 0.738,11.817 12,11.444 21.781,11.444 9.781,0 13.29,5.537 15.136,9.783 1.846,4.246 5.168,10.152 15.5,10.152 10.332,0 12.182,-4.061 14.951,-8.122 2.769,-4.061 12,-8.122 16.243,-7.752 4.243,0.37 7.014,21.042 11.259,28.24 4.245,7.198 19.75,11.26 22.519,9.045 2.769,-2.215 6.091,-3.323 1.292,-19.012 -4.799,-15.689 -1.292,-39.685 0.185,-47.253 1.477,-7.568 3.137,-18.458 30.271,-23.626 27.134,-5.168 40.608,-18.458 40.608,-36.178 0,-17.72 -17.675,-31.651 -17.675,-31.651 z m -49.468,-5.584 a 15.8,15.8 0 0 1 -11.905,3.921 c 0,0 7.752,-15.827 18.92,-18.412 -0.001,0.001 0.83,7.523 -7.015,14.491 z m 15.644,37.847 c -5.709,0 -10.337,-5.131 -10.337,-11.46 0,-6.329 4.628,-11.46 10.337,-11.46 5.709,0 10.336,5.131 10.336,11.46 0,6.329 -4.628,11.46 -10.336,11.46 z m 16.7,-41.908 c 0,0 7.16,-9.46 11.52,-10.429 0.277,5.446 -0.807,10.106 -4.453,13.8 a 26.262,26.262 0 0 0 -7.07,-3.371 z m 16.9,47.077 c -5.1,0 -9.229,-4.787 -9.229,-10.693 0,-5.906 4.132,-10.693 9.229,-10.693 5.097,0 9.229,4.788 9.229,10.693 0,5.905 -4.139,10.698 -9.236,10.698 z"
            class="ColorScheme-Text"/>
</svg>
```

## `~/.config/noctalia/plugins/catwalk/icons/my-idle-0-symbolic.svg`

```svg
<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<svg
        xmlns:dc="http://purl.org/dc/elements/1.1/"
        xmlns:cc="http://creativecommons.org/ns#"
        xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
        xmlns:svg="http://www.w3.org/2000/svg"
        xmlns="http://www.w3.org/2000/svg"
        version="1.1"
        height="388"
        width="388">
    <defs id="defs3051">
    <style type="text/css" id="current-color-scheme">
      .ColorScheme-Text {
        color:#ffffff
      }
      </style>
  </defs>
    <path style="fill:currentColor"
            d="M 365.652,223.08199  c 0,0 11.752,-20.337 9.131,-34.046 -1.842,-9.637 -31.391,18.589 -31.391,18.589 l -6.092,-1.557 c 0,0 8.033,-29.068 0.383,-30.981 -7.65,-1.913 -29.451,15.3 -41.308,30.981 0,0 -20.654,5.119 -29.068,31.437 -8.414,26.318 -45.515,-29.142 -58.52,-37.939 -13.005,-8.797 -28.685,-26.773 -70.376,-13.769 -41.690997,13.004 -54.688997,34.988 -54.693997,53.549 0,15.3 2.677,22.184 -1.53,28.686 0,0 -47.427,-4.972 -43.6,-43.6 3.827,-38.628 32.129,-32.511 36.718,-32.893 4.589,-0.382 14.152,-4.972 12.24,-16.447 -1.912,-11.475 -19.51,-16.832 -33.279,-11.477 -13.769,5.355 -43.6,19.124 -43.6,61.579 0,42.455 25.626,61.937 69.229,74.966 43.602997,13.029 104.413997,13.025 123.533997,13.025 19.12,0 125.453,2.27 132.72,-5.762 0,0 41.251,-12.68 41.251,-44.347 0.004,-25.239 -3.591,-31.012 -11.748,-39.991 z M 326.829,202.74698999999998  c 0,0 -5.915,-2.07 -14.787,0 0,0 10.942,-11.534 14.787,-11.534 3.845,0 0,11.534 0,11.534 z M 358.53700000000003,217.33299  c -1.774,-2.366 -6.323,-4.549 -6.323,-4.549 0,0 8.775,-7.195 9.366,-5.124 0.591,2.071 -3.042,9.673 -3.042,9.673 z"
            class="ColorScheme-Text"/>
</svg>
```

## `~/.config/noctalia/plugins/catwalk/icons/my-idle-1-symbolic.svg`

```svg
<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<svg
        xmlns:dc="http://purl.org/dc/elements/1.1/"
        xmlns:cc="http://creativecommons.org/ns#"
        xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
        xmlns:svg="http://www.w3.org/2000/svg"
        xmlns="http://www.w3.org/2000/svg"
        version="1.1"
        height="388"
        width="388">
    <defs id="defs3051">
    <style type="text/css" id="current-color-scheme">
      .ColorScheme-Text {
        color:#ffffff
      }
      </style>
  </defs>
    <path style="fill:currentColor"
            d="M 365.652,223.08199  c 0,0 11.752,-20.337 9.131,-34.046 -1.842,-9.637 -31.391,18.589 -31.391,18.589 l -6.092,-1.557 c 0,0 8.033,-29.068 0.383,-30.981 -7.65,-1.913 -29.451,15.3 -41.308,30.981 0,0 -20.654,5.119 -29.068,31.437 -8.414,26.318 -45.515,-29.142 -58.52,-37.939 -13.005,-8.797 -28.685,-26.773 -70.376,-13.769 -41.690997,13.004 -54.688997,34.988 -54.693997,53.549 0,15.3 2.677,22.184 -1.53,28.686 0,0 -47.427,-4.972 -43.6,-43.6 3.827,-38.628 32.129,-32.511 36.718,-32.893 4.589,-0.382 14.152,-4.972 12.24,-16.447 -1.912,-11.475 -19.51,-16.832 -33.279,-11.477 -13.769,5.355 -43.6,19.124 -43.6,61.579 0,42.455 25.626,61.937 69.229,74.966 43.602997,13.029 104.413997,13.025 123.533997,13.025 19.12,0 125.453,2.27 132.72,-5.762 0,0 41.251,-12.68 41.251,-44.347 0.004,-25.239 -3.591,-31.012 -11.748,-39.991 z M 326.829,202.74698999999998  c 0,0 -5.915,-2.07 -14.787,0 0,0 10.942,-11.534 14.787,-11.534 3.845,0 0,11.534 0,11.534 z M 358.53700000000003,217.33299  c -1.774,-2.366 -6.323,-4.549 -6.323,-4.549 0,0 8.775,-7.195 9.366,-5.124 0.591,2.071 -3.042,9.673 -3.042,9.673 z M 269.042,141.19398999999999  v -7.225 h 30.575 v 7.383 l -18.971,19.281 h 19.645 v 7.289 h -32.6 v -6.915 l 19.168,-19.811 z"
            class="ColorScheme-Text"/>
</svg>
```

## `~/.config/noctalia/plugins/catwalk/icons/my-idle-2-symbolic.svg`

```svg
<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<svg
        xmlns:dc="http://purl.org/dc/elements/1.1/"
        xmlns:cc="http://creativecommons.org/ns#"
        xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
        xmlns:svg="http://www.w3.org/2000/svg"
        xmlns="http://www.w3.org/2000/svg"
        version="1.1"
        height="388"
        width="388">
    <defs id="defs3051">
    <style type="text/css" id="current-color-scheme">
      .ColorScheme-Text {
        color:#ffffff
      }
      </style>
  </defs>
    <path style="fill:currentColor"
            d="M 365.652,223.08199  c 0,0 11.752,-20.337 9.131,-34.046 -1.842,-9.637 -31.391,18.589 -31.391,18.589 l -6.092,-1.557 c 0,0 8.033,-29.068 0.383,-30.981 -7.65,-1.913 -29.451,15.3 -41.308,30.981 0,0 -20.654,5.119 -29.068,31.437 -8.414,26.318 -45.515,-29.142 -58.52,-37.939 -13.005,-8.797 -28.685,-26.773 -70.376,-13.769 -41.690997,13.004 -54.688997,34.988 -54.693997,53.549 0,15.3 2.677,22.184 -1.53,28.686 0,0 -47.427,-4.972 -43.6,-43.6 3.827,-38.628 32.129,-32.511 36.718,-32.893 4.589,-0.382 14.152,-4.972 12.24,-16.447 -1.912,-11.475 -19.51,-16.832 -33.279,-11.477 -13.769,5.355 -43.6,19.124 -43.6,61.579 0,42.455 25.626,61.937 69.229,74.966 43.602997,13.029 104.413997,13.025 123.533997,13.025 19.12,0 125.453,2.27 132.72,-5.762 0,0 41.251,-12.68 41.251,-44.347 0.004,-25.239 -3.591,-31.012 -11.748,-39.991 z M 326.829,202.74698999999998  c 0,0 -5.915,-2.07 -14.787,0 0,0 10.942,-11.534 14.787,-11.534 3.845,0 0,11.534 0,11.534 z M 358.53700000000003,217.33299  c -1.774,-2.366 -6.323,-4.549 -6.323,-4.549 0,0 8.775,-7.195 9.366,-5.124 0.591,2.071 -3.042,9.673 -3.042,9.673 z M 269.042,141.19398999999999  v -7.225 h 30.575 v 7.383 l -18.971,19.281 h 19.645 v 7.289 h -32.6 v -6.915 l 19.168,-19.811 z M 218.504,85.393992  v -10.809 h 40.16 v 11.042 l -24.918,28.837998 h 25.8 v 10.9 h -42.812 v -10.341 l 25.172,-29.629998 z"
            class="ColorScheme-Text"/>
</svg>
```

## `~/.config/noctalia/plugins/catwalk/icons/my-idle-3-symbolic.svg`

```svg
<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<svg
        xmlns:dc="http://purl.org/dc/elements/1.1/"
        xmlns:cc="http://creativecommons.org/ns#"
        xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
        xmlns:svg="http://www.w3.org/2000/svg"
        xmlns="http://www.w3.org/2000/svg"
        version="1.1"
        height="388"
        width="388">
    <defs id="defs3051">
    <style type="text/css" id="current-color-scheme">
      .ColorScheme-Text {
        color:#ffffff
      }
      </style>
  </defs>
    <path style="fill:currentColor"
            d="M 365.652,223.08199  c 0,0 11.752,-20.337 9.131,-34.046 -1.842,-9.637 -31.391,18.589 -31.391,18.589 l -6.092,-1.557 c 0,0 8.033,-29.068 0.383,-30.981 -7.65,-1.913 -29.451,15.3 -41.308,30.981 0,0 -20.654,5.119 -29.068,31.437 -8.414,26.318 -45.515,-29.142 -58.52,-37.939 -13.005,-8.797 -28.685,-26.773 -70.376,-13.769 -41.690997,13.004 -54.688997,34.988 -54.693997,53.549 0,15.3 2.677,22.184 -1.53,28.686 0,0 -47.427,-4.972 -43.6,-43.6 3.827,-38.628 32.129,-32.511 36.718,-32.893 4.589,-0.382 14.152,-4.972 12.24,-16.447 -1.912,-11.475 -19.51,-16.832 -33.279,-11.477 -13.769,5.355 -43.6,19.124 -43.6,61.579 0,42.455 25.626,61.937 69.229,74.966 43.602997,13.029 104.413997,13.025 123.533997,13.025 19.12,0 125.453,2.27 132.72,-5.762 0,0 41.251,-12.68 41.251,-44.347 0.004,-25.239 -3.591,-31.012 -11.748,-39.991 z M 326.829,202.74698999999998  c 0,0 -5.915,-2.07 -14.787,0 0,0 10.942,-11.534 14.787,-11.534 3.845,0 0,11.534 0,11.534 z M 358.53700000000003,217.33299  c -1.774,-2.366 -6.323,-4.549 -6.323,-4.549 0,0 8.775,-7.195 9.366,-5.124 0.591,2.071 -3.042,9.673 -3.042,9.673 z M 218.504,85.393992  v -10.809 h 40.16 v 11.042 l -24.918,28.837998 h 25.8 v 10.9 h -42.812 v -10.341 l 25.172,-29.629998 z"
            class="ColorScheme-Text"/>
</svg>
```

## `~/.config/noctalia/plugins/pomodoro/BarWidget.qml`

```qml
import QtQuick
import QtQuick.Layouts
import Quickshell
import qs.Commons
import qs.Widgets
import qs.Services.UI
import qs.Services.System

Item {
  id: root

  property var pluginApi: null
  property ShellScreen screen
  property string widgetId: ""
  property string section: ""
  property int sectionWidgetIndex: -1
  property int sectionWidgetsCount: 0

  readonly property bool pillDirection: BarService.getPillDirection(root)

  readonly property var mainInstance: pluginApi?.mainInstance
  readonly property bool isActive: mainInstance && (mainInstance.pomodoroRunning || mainInstance.pomodoroRemainingSeconds > 0 || mainInstance.pomodoroTotalSeconds > 0)

  readonly property int modeWork: 0
  readonly property int modeShortBreak: 1
  readonly property int modeLongBreak: 2

  readonly property string barPosition: Settings.data.bar.position || "top"
  readonly property bool barIsVertical: barPosition === "left" || barPosition === "right"

  readonly property real contentWidth: {
    if (barIsVertical) return Style.capsuleHeight
    if (isActive) return contentRow.implicitWidth + Style.marginM * 2
    return Style.capsuleHeight
  }
  readonly property real contentHeight: Style.capsuleHeight

  implicitWidth: contentWidth
  implicitHeight: contentHeight

  function formatTime(seconds) {
    const hours = Math.floor(seconds / 3600);
    const minutes = Math.floor((seconds % 3600) / 60);
    const secs = seconds % 60;

    if (hours > 0) {
      return `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${secs.toString().padStart(2, '0')}`;
    }
    return `${minutes.toString().padStart(2, '0')}:${secs.toString().padStart(2, '0')}`;
  }

  function getModeIcon() {
    if (!mainInstance) return "clock"
    if (mainInstance.pomodoroSoundPlaying) return "bell-ringing"
    if (mainInstance.pomodoroMode === modeWork) return "brain"
    if (mainInstance.pomodoroMode === modeShortBreak) return "coffee"
    if (mainInstance.pomodoroMode === modeLongBreak) return "bed"
    return "clock"
  }

  Rectangle {
    id: visualCapsule
    x: Style.pixelAlignCenter(parent.width, width)
    y: Style.pixelAlignCenter(parent.height, height)
    width: root.contentWidth
    height: root.contentHeight
    color: {
      if (mouseArea.containsMouse &&
          (!mainInstance || (!mainInstance.pomodoroRunning && !mainInstance.pomodoroSoundPlaying)))
        return Color.mHover
      return Style.capsuleColor
    }
    radius: Style.radiusL

    RowLayout {
      id: contentRow
      anchors.centerIn: parent
      spacing: Style.marginS
      layoutDirection: Qt.LeftToRight

      NIcon {
        icon: getModeIcon()
        applyUiScale: false
        color: {
          if (mainInstance && (mainInstance.pomodoroRunning || mainInstance.pomodoroSoundPlaying)) {
            return Color.mPrimary
          }
          return mouseArea.containsMouse ? Color.mOnHover : Color.mOnSurface
        }
      }

      NText {
        visible: !barIsVertical && mainInstance && (mainInstance.pomodoroRunning || mainInstance.pomodoroRemainingSeconds > 0 || mainInstance.pomodoroTotalSeconds > 0)
        family: Settings.data.ui.fontFixed
        pointSize: Style.barFontSize
        text: {
          if (!mainInstance) return ""
          return formatTime(mainInstance.pomodoroRemainingSeconds)
        }
        color: {
          if (mainInstance && (mainInstance.pomodoroRunning || mainInstance.pomodoroSoundPlaying)) {
            return Color.mPrimary
          }
          return mouseArea.containsMouse ? Color.mOnHover : Color.mOnSurface
        }
      }
    }
  }

  NPopupContextMenu {
    id: contextMenu

    model: {
      var items = [];

      if (mainInstance) {
        if (mainInstance.pomodoroRunning || mainInstance.pomodoroRemainingSeconds > 0 || mainInstance.pomodoroTotalSeconds > 0) {
          items.push({
            "label": mainInstance.pomodoroRunning ? pluginApi.tr("panel.pause") : pluginApi.tr("panel.resume"),
            "action": "toggle",
            "icon": mainInstance.pomodoroRunning ? "media-pause" : "media-play"
          });

          items.push({
            "label": pluginApi.tr("panel.skip"),
            "action": "skip",
            "icon": "player-skip-forward"
          });

          items.push({
            "label": pluginApi.tr("panel.reset"),
            "action": "reset",
            "icon": "refresh"
          });

          items.push({
            "label": pluginApi.tr("panel.reset-all"),
            "action": "reset-all",
            "icon": "rotate"
          });
        }
      }

      items.push({
        "label": pluginApi.tr("panel.settings"),
        "action": "widget-settings",
        "icon": "settings"
      });

      return items;
    }

    onTriggered: action => {
      contextMenu.close();
      PanelService.closeContextMenu(screen);

      if (action === "widget-settings") {
        BarService.openPluginSettings(screen, pluginApi.manifest);
      } else if (mainInstance) {
        if (action === "toggle") {
          if (mainInstance.pomodoroRunning) {
            mainInstance.pomodoroPause();
          } else {
            mainInstance.pomodoroStart();
          }
        } else if (action === "reset") {
          mainInstance.pomodoroResetSession();
        } else if (action === "reset-all") {
          mainInstance.pomodoroResetAll();
        } else if (action === "skip") {
          mainInstance.pomodoroSkip();
        }
      }
    }
  }

  MouseArea {
    id: mouseArea
    anchors.fill: parent
    hoverEnabled: true
    cursorShape: Qt.PointingHandCursor
    acceptedButtons: Qt.LeftButton | Qt.MiddleButton | Qt.RightButton

    onClicked: (mouse) => {
      if (mouse.button === Qt.LeftButton) {
        if (pluginApi) {
          pluginApi.openPanel(root.screen, root)
        }
      } else if (mouse.button === Qt.RightButton) {
        PanelService.showContextMenu(contextMenu, root, screen);
      } else if (mouse.button === Qt.MiddleButton) {
        if (!mainInstance)
          return
        mainInstance.pomodoroRunning
          ? mainInstance.pomodoroPause()
          : mainInstance.pomodoroStart()
      }
    }
  }
}
```

## `~/.config/noctalia/plugins/pomodoro/Main.qml`

```qml
import QtQuick
import Quickshell
import qs.Commons
import qs.Services.System
import qs.Services.UI
import Quickshell.Io

Item {
  id: root

  // --- CONFIGURATION: Change sound here ---
  readonly property string alarmSoundFile: Qt.resolvedUrl("alarm.mp3").toString().replace("file://", "")


  property var pluginApi: null

  onPluginApiChanged: {
    if (pluginApi) {
      settingsVersion++
      Logger.i("Pomodoro", "pluginApi available, loading settings")
    }
  }

  FileView {
    id: settingsFileWatcher
    path: Qt.resolvedUrl("settings.json")
    
    onTextChanged: {
      if (text && text.length > 0) {
        try {
          var newSettings = JSON.parse(text);
          if (pluginApi && pluginApi.pluginSettings) {
            if (newSettings.workDuration !== undefined)
              pluginApi.pluginSettings.workDuration = newSettings.workDuration;
            if (newSettings.shortBreakDuration !== undefined)
              pluginApi.pluginSettings.shortBreakDuration = newSettings.shortBreakDuration;
            if (newSettings.longBreakDuration !== undefined)
              pluginApi.pluginSettings.longBreakDuration = newSettings.longBreakDuration;
            if (newSettings.sessionsBeforeLongBreak !== undefined)
              pluginApi.pluginSettings.sessionsBeforeLongBreak = newSettings.sessionsBeforeLongBreak;
            if (newSettings.autoStartBreaks !== undefined)
              pluginApi.pluginSettings.autoStartBreaks = newSettings.autoStartBreaks;
            if (newSettings.autoStartWork !== undefined)
              pluginApi.pluginSettings.autoStartWork = newSettings.autoStartWork;
            if (newSettings.compactMode !== undefined)
              pluginApi.pluginSettings.compactMode = newSettings.compactMode;
              
            // Trigger update
            root.settingsVersion++;
            
            Logger.i("Pomodoro", "Settings reloaded from file");
          }
        } catch (e) {
          Logger.e("Pomodoro", "Failed to parse settings.json: " + e);
        }
      }
    }
  }

  IpcHandler {
    target: "plugin:pomodoro"

    function toggle() {
      if (pluginApi) {
        pluginApi.withCurrentScreen(screen => {
          pluginApi.togglePanel(screen);
        });
      }
    }

    function start() {
      root.pomodoroStart();
    }

    function pause() {
      root.pomodoroPause();
    }

    function reset() {
      root.pomodoroResetSession();
    }

    function resetAll() {
      root.pomodoroResetAll();
    }

    function skip() {
      root.pomodoroSkip();
    }

    function stopAlarm() {
      root.pomodoroStopAlarm();
    }
  }

  readonly property int modeWork: 0
  readonly property int modeShortBreak: 1
  readonly property int modeLongBreak: 2

  property bool pomodoroRunning: false
  property int pomodoroMode: modeWork  // 0-1-2 = work, short-break, long-break
  property int pomodoroRemainingSeconds: 0
  property int pomodoroTotalSeconds: 0
  property int pomodoroOriginalTotal: 0
  property int pomodoroCompletedSessions: 0
  property bool pomodoroSoundPlaying: false

  property int settingsVersion: 0
  
  property int workDuration: _computeWorkDuration()
  property int shortBreakDuration: _computeShortBreakDuration()
  property int longBreakDuration: _computeLongBreakDuration()
  property int sessionsBeforeLongBreak: _computeSessionsBeforeLongBreak()
  property bool autoStartBreaks: _computeAutoStartBreaks()
  property bool autoStartWork: _computeAutoStartWork()
  property bool compactMode: _computeCompactMode()
  
  function _computeWorkDuration() { return (pluginApi?.pluginSettings?.workDuration ?? 25) * 60; }
  function _computeShortBreakDuration() { return (pluginApi?.pluginSettings?.shortBreakDuration ?? 5) * 60; }
  function _computeLongBreakDuration() { return (pluginApi?.pluginSettings?.longBreakDuration ?? 15) * 60; }
  function _computeSessionsBeforeLongBreak() { return pluginApi?.pluginSettings?.sessionsBeforeLongBreak ?? 4; }
  function _computeAutoStartBreaks() { return pluginApi?.pluginSettings?.autoStartBreaks ?? false; }
  function _computeAutoStartWork() { return pluginApi?.pluginSettings?.autoStartWork ?? false; }
  function _computeCompactMode() { return pluginApi?.pluginSettings?.compactMode ?? false; }
  
  onSettingsVersionChanged: {
    workDuration = _computeWorkDuration()
    shortBreakDuration = _computeShortBreakDuration()
    longBreakDuration = _computeLongBreakDuration()
    sessionsBeforeLongBreak = _computeSessionsBeforeLongBreak()
    autoStartBreaks = _computeAutoStartBreaks()
    autoStartWork = _computeAutoStartWork()
    compactMode = _computeCompactMode()
    Logger.i("Pomodoro", "Settings updated: autoStartBreaks=" + autoStartBreaks + ", autoStartWork=" + autoStartWork + ", compactMode=" + compactMode)
  }

  function getDurationForMode(mode) {
    if (mode === modeWork) return workDuration;
    if (mode === modeShortBreak) return shortBreakDuration;
    if (mode === modeLongBreak) return longBreakDuration;
    return workDuration;
  }

  Timer {
    id: updateTimer
    interval: 1000
    repeat: true
    running: root.pomodoroRunning
    triggeredOnStart: false

    onTriggered: {
      if (!root.pomodoroRunning)
        return;

      root.pomodoroRemainingSeconds = root.pomodoroRemainingSeconds - 1;
      
      if (root.pomodoroRemainingSeconds <= 0) {
        root.pomodoroOnFinished();
      }
    }
  }

  // ---  Alarm Limit Timer ---
  Timer {
    id: alarmLimitTimer
    interval: 5000 // 5 seconds
    repeat: false
    running: false
    onTriggered: {
       root.pomodoroStopAlarm();
    }
  }

  function pomodoroStart(stopSound = true) {
    // Stop any playing alarm sound when starting, unless explicitly asked not to (for auto-start)
    if (stopSound && root.pomodoroSoundPlaying) {
      SoundService.stopSound(root.alarmSoundFile); // Uses variable
      root.pomodoroSoundPlaying = false;
      alarmLimitTimer.stop();
    }
    
    if (root.pomodoroRemainingSeconds <= 0) {
      root.pomodoroRemainingSeconds = getDurationForMode(root.pomodoroMode);
      root.pomodoroOriginalTotal = root.pomodoroRemainingSeconds;
    } else if (root.pomodoroOriginalTotal <= 0) {
      root.pomodoroOriginalTotal = root.pomodoroRemainingSeconds;
    }
    
    root.pomodoroTotalSeconds = root.pomodoroRemainingSeconds;
    root.pomodoroRunning = true;
  }

  function pomodoroPause() {
    root.pomodoroRunning = false;
    SoundService.stopSound(root.alarmSoundFile); // Uses variable
    root.pomodoroSoundPlaying = false;
    alarmLimitTimer.stop();
  }

  function pomodoroResetSession() {
    root.pomodoroRunning = false;
    root.pomodoroRemainingSeconds = getDurationForMode(root.pomodoroMode);
    root.pomodoroTotalSeconds = 0;
    root.pomodoroOriginalTotal = 0;

    SoundService.stopSound(root.alarmSoundFile); // Uses variable
    root.pomodoroSoundPlaying = false;
    alarmLimitTimer.stop();
  }

  function pomodoroResetAll() {
    root.pomodoroRunning = false;
    root.pomodoroRemainingSeconds = 0;
    root.pomodoroTotalSeconds = 0;
    root.pomodoroOriginalTotal = 0;
    root.pomodoroCompletedSessions = 0;
    root.pomodoroMode = modeWork;

    SoundService.stopSound(root.alarmSoundFile); // Uses variable
    root.pomodoroSoundPlaying = false;
    alarmLimitTimer.stop();
  }

  function pomodoroSkip() {
    root.pomodoroRunning = false;
    SoundService.stopSound(root.alarmSoundFile); // Uses variable
    root.pomodoroSoundPlaying = false;
    alarmLimitTimer.stop();
    
    pomodoroAdvanceToNextPhase();
  }

  function pomodoroStopAlarm() {
    if (root.pomodoroSoundPlaying) {
      SoundService.stopSound(root.alarmSoundFile); // Uses variable
      root.pomodoroSoundPlaying = false;
      alarmLimitTimer.stop();
    }
  }

  function pomodoroSetMode(mode) {
    if (root.pomodoroRunning) {
      root.pomodoroPause();
    }
    root.pomodoroMode = mode;
    root.pomodoroRemainingSeconds = getDurationForMode(mode);
    root.pomodoroTotalSeconds = 0;
  }

  function pomodoroAdvanceToNextPhase() {
    if (root.pomodoroMode === modeWork) {
      if (root.pomodoroCompletedSessions + 1 >= root.sessionsBeforeLongBreak) {
        root.pomodoroMode = modeLongBreak;
      } else {
        root.pomodoroMode = modeShortBreak;
      }
    } else {
      if (root.pomodoroMode === modeLongBreak) {
        root.pomodoroCompletedSessions = 0;
      } else {
        root.pomodoroCompletedSessions++;
      }
      root.pomodoroMode = modeWork;
    }
    
    root.pomodoroRemainingSeconds = getDurationForMode(root.pomodoroMode);
    root.pomodoroTotalSeconds = 0;
    root.pomodoroOriginalTotal = 0;
  }

  function pomodoroOnFinished() {
    root.pomodoroRunning = false;
    root.pomodoroRemainingSeconds = 0;
    root.pomodoroSoundPlaying = true;

    // Play Sound (checking toggle setting)
    if (pluginApi?.pluginSettings?.playSound !== false) {
      SoundService.playSound(root.alarmSoundFile, { // Uses variable
        repeat: true,
        volume: 0.3 
      });
      // Start the alarm limit timer
      alarmLimitTimer.start();
    }

    var toastMessage;
    var shouldAutoStart = false;
    
    if (root.pomodoroMode === modeWork) {
      toastMessage = pluginApi?.tr("toast.work-finished") || "Work session complete! Time for a break.";
      shouldAutoStart = root.autoStartBreaks;
    } else if (root.pomodoroMode === modeLongBreak) {
      toastMessage = pluginApi?.tr("toast.long-break-finished") || "Long break over! Ready for a new cycle?";
      shouldAutoStart = root.autoStartWork;
    } else {
      toastMessage = pluginApi?.tr("toast.break-finished") || "Break over! Ready to focus?";
      shouldAutoStart = root.autoStartWork;
    }

    ToastService.showNotice(
      pluginApi?.tr("toast.title") || "Pomodoro",
      toastMessage,
      "clock"
    );

    pomodoroAdvanceToNextPhase();
    
    if (shouldAutoStart) {
      Qt.callLater(() => {
        // Pass false to keep sound playing!
        root.pomodoroStart(false);
      });
    }
  }
}
```

## `~/.config/noctalia/plugins/pomodoro/Panel.qml`

```qml
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import qs.Commons
import qs.Services.System
import qs.Widgets

Item {
  id: root

  property var pluginApi: null
  readonly property var geometryPlaceholder: panelContainer
  readonly property bool allowAttach: true

  readonly property int modeWork: 0
  readonly property int modeShortBreak: 1
  readonly property int modeLongBreak: 2

  readonly property var mainInstance: pluginApi?.mainInstance

  onPluginApiChanged: {
    // Force re-evaluation of mainInstance binding when pluginApi changes
    if (pluginApi && pluginApi.mainInstance) {
      mainInstanceChanged();
    }
  }

  readonly property bool compactMode: mainInstance ? mainInstance.compactMode : false
  
  // Only provide proper dimensions when mainInstance is available to prevent blank panel glitches
  readonly property bool panelReady: pluginApi !== null && mainInstance !== null && mainInstance !== undefined
  
  property real contentPreferredWidth: panelReady ? (compactMode ? 340 : 380) * Style.uiScaleRatio : 0
  property real contentPreferredHeight: panelReady ? (compactMode ? 240 : 360) * Style.uiScaleRatio : 0

  anchors.fill: parent
  
  readonly property bool isRunning: mainInstance ? mainInstance.pomodoroRunning : false
  readonly property int currentMode: mainInstance ? mainInstance.pomodoroMode : modeWork
  readonly property int remainingSeconds: mainInstance ? mainInstance.pomodoroRemainingSeconds : 0
  readonly property int totalSeconds: mainInstance ? mainInstance.pomodoroTotalSeconds : 0
  readonly property int originalTotal: mainInstance ? mainInstance.pomodoroOriginalTotal : 0
  readonly property int completedSessions: mainInstance ? mainInstance.pomodoroCompletedSessions : 0
  readonly property bool soundPlaying: mainInstance ? mainInstance.pomodoroSoundPlaying : false
  readonly property int sessionsBeforeLongBreak: mainInstance ? mainInstance.sessionsBeforeLongBreak : 4
  
  function startTimer() { if (mainInstance) mainInstance.pomodoroStart(); }
  function pauseTimer() { if (mainInstance) mainInstance.pomodoroPause(); }
  function resetSession() { if (mainInstance) mainInstance.pomodoroResetSession(); }
  function resetAll() { if (mainInstance) mainInstance.pomodoroResetAll(); }
  function skipTimer() { if (mainInstance) mainInstance.pomodoroSkip(); }
  function stopAlarm() { if (mainInstance) mainInstance.pomodoroStopAlarm(); }

  function formatTime(seconds, totalTimeSeconds) {
    const hours = Math.floor(seconds / 3600);
    const minutes = Math.floor((seconds % 3600) / 60);
    const secs = seconds % 60;

    if (!totalTimeSeconds || totalTimeSeconds === 0) {
      if (hours > 0) {
        return `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${secs.toString().padStart(2, '0')}`;
      }
      return `${minutes.toString().padStart(2, '0')}:${secs.toString().padStart(2, '0')}`;
    }

    if (totalTimeSeconds < 3600) {
      return `${minutes.toString().padStart(2, '0')}:${secs.toString().padStart(2, '0')}`;
    }
    return `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${secs.toString().padStart(2, '0')}`;
  }
  
  function getModeIcon() {
    if (currentMode === modeWork) return "brain"
    if (currentMode === modeShortBreak) return "coffee"
    if (currentMode === modeLongBreak) return "bed"
    return "clock"
  }
  
  function getModeName() {
    if (currentMode === modeWork) return pluginApi?.tr("panel.work") || "Work"
    if (currentMode === modeShortBreak) return pluginApi?.tr("panel.short-break") || "Short Break"
    if (currentMode === modeLongBreak) return pluginApi?.tr("panel.long-break") || "Long Break"
    return "Pomodoro"
  }

  Rectangle {
    id: panelContainer
    anchors.fill: parent
    color: "transparent"
    visible: panelReady

    ColumnLayout {
      anchors {
        fill: parent
        margins: Style.marginM
      }
      spacing: Style.marginL

      NBox {
        Layout.fillWidth: true
        Layout.fillHeight: true

        ColumnLayout {
          id: content
          anchors.fill: parent
          anchors.margins: Style.marginM
          spacing: Style.marginM
          clip: true

          RowLayout {
            Layout.fillWidth: true
            spacing: Style.marginS

            NIcon {
              icon: getModeIcon()
              pointSize: Style.fontSizeL
              color: Color.mPrimary
            }

            NText {
              text: pluginApi?.tr("panel.title") || "Pomodoro"
              pointSize: Style.fontSizeL
              font.weight: Style.fontWeightBold
              color: Color.mOnSurface
              Layout.fillWidth: true
            }

            Item {
              id: alarmButtonContainer
              Layout.alignment: Qt.AlignVCenter
              Layout.preferredWidth: soundPlaying ? (bellIcon.implicitWidth + Style.marginS) : 0
              Layout.preferredHeight: bellIcon.implicitHeight + Style.marginS
              clip: true

              Behavior on Layout.preferredWidth {
                NumberAnimation { duration: 150; easing.type: Easing.InOutQuad }
              }

              NIcon {
                id: bellIcon
                anchors.centerIn: parent
                icon: "bell-ringing"
                pointSize: Style.fontSizeXL
                color: bellMouseArea.containsMouse ? Qt.lighter(Color.mError, 1.2) : Color.mError
                opacity: soundPlaying ? 1 : 0

                Behavior on opacity {
                  NumberAnimation { duration: 150 }
                }
              }

              MouseArea {
                id: bellMouseArea
                anchors.fill: parent
                hoverEnabled: true
                enabled: soundPlaying
                cursorShape: Qt.PointingHandCursor
                onClicked: stopAlarm()
              }
            }
            
            NText {
              text: (pluginApi?.tr("panel.session") || "Session") + " " + (completedSessions + 1) + "/" + sessionsBeforeLongBreak
              pointSize: Style.fontSizeS
              color: Color.mOnSurfaceVariant
            }
          }

      Item {
        id: timerDisplayItem
        Layout.fillWidth: true
        Layout.fillHeight: true
        Layout.alignment: Qt.AlignHCenter
        Layout.bottomMargin: Style.marginM

        Canvas {
          id: progressRing
          anchors.centerIn: parent
          width: Math.min(parent.width, parent.height) * 0.9
          height: width
          visible: originalTotal > 0 && !compactMode && (isRunning || remainingSeconds > 0)
          z: -1

          property real progressRatio: {
            if (originalTotal <= 0)
              return 0;
            const ratio = remainingSeconds / originalTotal;
            return Math.max(0, Math.min(1, ratio));
          }

          onProgressRatioChanged: requestPaint()

          onPaint: {
            var ctx = getContext("2d");
            if (width <= 0 || height <= 0) {
              return;
            }

            var centerX = width / 2;
            var centerY = height / 2;
            var radius = Math.min(width, height) / 2 - 5;

            if (radius <= 0) {
              return;
            }

            ctx.reset();

            ctx.beginPath();
            ctx.arc(centerX, centerY, radius, 0, 2 * Math.PI);
            ctx.lineWidth = 6;
            ctx.strokeStyle = Qt.alpha(Color.mOnSurface, 0.1);
            ctx.stroke();

            if (progressRatio > 0) {
              ctx.beginPath();
              ctx.arc(centerX, centerY, radius, -Math.PI / 2, -Math.PI / 2 + progressRatio * 2 * Math.PI);
              ctx.lineWidth = 6;
              ctx.strokeStyle = Color.mPrimary;
              ctx.lineCap = "round";
              ctx.stroke();
            }
          }
        }

        ColumnLayout {
          anchors.centerIn: parent
          spacing: Style.marginS
          
          NText {
            id: modeLabel
            Layout.alignment: Qt.AlignHCenter
            text: getModeName()
            pointSize: Style.fontSizeM
            color: Color.mPrimary
            font.weight: Style.fontWeightMedium
          }

          NText {
            id: timerDisplay
            Layout.alignment: Qt.AlignHCenter
            font.family: Settings.data.ui.fontFixed

            readonly property bool showingHours: totalSeconds >= 3600 || remainingSeconds >= 3600

            font.pointSize: {
              const scale = compactMode ? 0.8 : 1.0;
              return (showingHours ? Style.fontSizeXXL * 1.3 : (Style.fontSizeXXL * 1.8)) * scale;
            }

            font.weight: Style.fontWeightBold
            color: Color.mPrimary

            text: formatTime(remainingSeconds, totalSeconds)
          }
        }
      }

      GridLayout {
        id: buttonGrid
        Layout.fillWidth: true
        columns: 2
        rowSpacing: Style.marginS
        columnSpacing: Style.marginS
        uniformCellWidths: true

        NButton {
          id: startButton
          Layout.fillWidth: true
          Layout.preferredWidth: 1
          text: isRunning ? (pluginApi?.tr("panel.pause") || "Pause") : (totalSeconds > 0 ? (pluginApi?.tr("panel.resume") || "Resume") : (pluginApi?.tr("panel.start") || "Start"))
          icon: isRunning ? "player-pause" : "player-play"
          onClicked: {
            if (isRunning) {
              pauseTimer();
            } else {
              startTimer();
            }
          }
        }

        NButton {
          id: skipButton
          Layout.fillWidth: true
          Layout.preferredWidth: 1
          text: pluginApi?.tr("panel.skip") || "Skip"
          icon: "player-skip-forward"
          enabled: isRunning || remainingSeconds > 0 || totalSeconds > 0
          onClicked: {
            skipTimer();
          }
        }

        NButton {
          id: resetButton
          Layout.fillWidth: true
          Layout.preferredWidth: 1
          text: pluginApi?.tr("panel.reset") || "Reset"
          icon: "refresh"
          enabled: isRunning || remainingSeconds > 0 || soundPlaying
          onClicked: {
            resetSession();
          }
        }

        NButton {
          id: resetAllButton
          Layout.fillWidth: true
          Layout.preferredWidth: 1
          text: pluginApi?.tr("panel.reset-all") || "Reset All"
          icon: "rotate"
          enabled: isRunning || remainingSeconds > 0 || soundPlaying || completedSessions > 0
          onClicked: {
            resetAll();
          }
        }
      }
        }
      }
    }
  }
}

```

## `~/.config/noctalia/plugins/pomodoro/README.md`

```md
# Pomodoro Plugin

A Pomodoro timer plugin for Noctalia for productivity. Happy Coding :)

***Note:*** The only translation available right now is english, more translations will be added in the future.

## Features

- **Sessions**: There are configurable sessions for the pomodoro plugin based on the standard format (work - short break - long break), all of them can be configured in the settings.
- **Cycles**: Cycles are also configurable such that the user can set the number of cycles before a long break.
- **Session Tracking**: Tracks completed sessions in a cycle.
- **Auto-start**: Optionally auto-start breaks and/or work sessions.
- **Compact Mode**: Shorter and more minimal panel view without the progress ring.
- **Bar Widget**: Shows current mode based on the icon and remaining time with respect to the session.
- **Notifications**: Sound and toast notification when sessions finish.

## Work in Progress
- **Custom Presets**: Presets that user can create and store locally and select them while starting a pomodoro session.
- **Custom Sounds**: Custom sounds that user can select or add themselves that will be used to notify when a work/break session ends.

## IPC Commands

You can control the pomodoro plugin via the command line using the Noctalia IPC interface.

### General Usage
```bash
qs -c noctalia-shell ipc call plugin:pomodoro <command>
```

### Available Commands

| Command | Description | Example |
|---|---|---|
| `toggle` | Opens or closes the pomodoro panel on the current screen | `qs -c noctalia-shell ipc call plugin:pomodoro toggle` |
| `start` | Starts/resumes the pomodoro timer | `qs -c noctalia-shell ipc call plugin:pomodoro start` |
| `pause` | Pauses the running timer | `qs -c noctalia-shell ipc call plugin:pomodoro pause` |
| `reset` | Resets the current session | `qs -c noctalia-shell ipc call plugin:pomodoro reset` |
| `resetAll` | Resets all sessions and returns to work mode | `qs -c noctalia-shell ipc call plugin:pomodoro resetAll` |
| `skip` | Skips to the next phase (work → break or break → work) | `qs -c noctalia-shell ipc call plugin:pomodoro skip` |
| `stopAlarm` | Stops the alarm sound when ringing | `qs -c noctalia-shell ipc call plugin:pomodoro stopAlarm` |

### Examples

**Start a pomodoro session:**
```bash
qs -c noctalia-shell ipc call plugin:pomodoro start
```

**Skip to break after finishing work early:**
```bash
qs -c noctalia-shell ipc call plugin:pomodoro skip
```

**Reset everything and start fresh:**
```bash
qs -c noctalia-shell ipc call plugin:pomodoro resetAll
```

## Settings

***Note:*** These settings are stored in the settings.json file and can be changed by opening the widget settings.

| Setting | Default | Description |
|---|---|---|
| `workDuration` | 25 min | Duration of each work session |
| `shortBreakDuration` | 5 min | Duration of short breaks |
| `longBreakDuration` | 15 min | Duration of long breaks |
| `sessionsBeforeLongBreak` | 4 | Number of work sessions before a long break |
| `autoStartBreaks` | false | Automatically start break timer after work |
| `autoStartWork` | false | Automatically start work timer after break |
| `compactMode` | false | Hide the circular progress bar |

## Credits

- **Alarm Sound**: `alarm.mp3` - Sourced from [Pixabay](https://pixabay.com/) (Royalty-free, [Pixabay Content License](https://pixabay.com/service/license-summary/))
```

## `~/.config/noctalia/plugins/pomodoro/Settings.qml`

```qml
import QtQuick
import QtQuick.Layouts
import qs.Commons
import qs.Widgets

ColumnLayout {
  id: root

  property var pluginApi: null
  property int editWorkDuration: 25
  property int editShortBreakDuration: 5
  property int editLongBreakDuration: 15
  property int editSessionsBeforeLongBreak: 4

  property bool editAutoStartBreaks: false
  property bool editAutoStartWork: false
  property bool editCompactMode: false
  
  // --- : Sound Property ---
  property bool editPlaySound: true

  spacing: Style.marginM

  onPluginApiChanged: {
    if (pluginApi) {
      loadSettings()
    }
  }

  Component.onCompleted: {

    if (pluginApi) {
      loadSettings()
    }
  }

  function loadSettings() {
    const settings = pluginApi?.pluginSettings
    const defaults = pluginApi?.manifest?.metadata?.defaultSettings

    root.editWorkDuration = settings?.workDuration ?? defaults?.workDuration ?? 25
    root.editShortBreakDuration = settings?.shortBreakDuration ?? defaults?.shortBreakDuration ?? 5
    root.editLongBreakDuration = settings?.longBreakDuration ?? defaults?.longBreakDuration ?? 15
    root.editSessionsBeforeLongBreak = settings?.sessionsBeforeLongBreak ?? defaults?.sessionsBeforeLongBreak ?? 4
    root.editAutoStartBreaks = settings?.autoStartBreaks ?? defaults?.autoStartBreaks ?? false
    root.editAutoStartWork = settings?.autoStartWork ?? defaults?.autoStartWork ?? false
    root.editCompactMode = settings?.compactMode ?? defaults?.compactMode ?? false

    
    // --- : Load Sound Setting ---
    root.editPlaySound = settings?.playSound ?? defaults?.playSound ?? true

    autoStartBreaksToggle.checked = root.editAutoStartBreaks
    autoStartWorkToggle.checked = root.editAutoStartWork
    compactModeToggle.checked = root.editCompactMode
    playSoundToggle.checked = root.editPlaySound


  }

  ColumnLayout {
    Layout.fillWidth: true
    spacing: Style.marginS

    NLabel {
      label: pluginApi?.tr("settings.work-duration") || "Work Duration"
      description: pluginApi?.tr("settings.work-duration-desc") || "Duration of each work session in minutes"
    }

    NSpinBox {
      id: workDurationSpinBox
      from: 5
      to: 180
      stepSize: 5
      value: root.editWorkDuration
      onValueChanged: if (value !== root.editWorkDuration) root.editWorkDuration = value
    }
  }

  ColumnLayout {
    Layout.fillWidth: true
    spacing: Style.marginS

    NLabel {
      label: pluginApi?.tr("settings.short-break-duration") || "Short Break Duration"
      description: pluginApi?.tr("settings.short-break-duration-desc") || "Duration of short breaks in minutes"
    }

    NSpinBox {
      id: shortBreakSpinBox
      from: 1
      to: 60
      stepSize: 1
      value: root.editShortBreakDuration
      onValueChanged: if (value !== root.editShortBreakDuration) root.editShortBreakDuration = value
    }
  }

  ColumnLayout {
    Layout.fillWidth: true
    spacing: Style.marginS

    NLabel {
      label: pluginApi?.tr("settings.long-break-duration") || "Long Break Duration"
      description: pluginApi?.tr("settings.long-break-duration-desc") || "Duration of long breaks in minutes"
    }

    NSpinBox {
      id: longBreakSpinBox
      from: 5
      to: 120
      stepSize: 5
      value: root.editLongBreakDuration
      onValueChanged: if (value !== root.editLongBreakDuration) root.editLongBreakDuration = value
    }
  }

  ColumnLayout {
    Layout.fillWidth: true
    spacing: Style.marginS

    NLabel {
      label: pluginApi?.tr("settings.sessions-before-long-break") || "Sessions Before Long Break"
      description: pluginApi?.tr("settings.sessions-before-long-break-desc") || "Number of work sessions before a long break"
    }

    NSpinBox {
      id: sessionsSpinBox
      from: 1
      to: 10
      stepSize: 1
      value: root.editSessionsBeforeLongBreak
      onValueChanged: if (value !== root.editSessionsBeforeLongBreak) root.editSessionsBeforeLongBreak = value
    }
  }

  NDivider {
    Layout.fillWidth: true
    Layout.topMargin: Style.marginM
    Layout.bottomMargin: Style.marginM
  }

  Item {
    Layout.fillWidth: true
    Layout.preferredHeight: autoStartBreaksToggle.implicitHeight
    
    NToggle {
      id: autoStartBreaksToggle
      anchors.fill: parent
      label: pluginApi?.tr("settings.auto-start-breaks") || "Auto-start Breaks"
      description: pluginApi?.tr("settings.auto-start-breaks-desc") || "Automatically start break timer after work session"
      checked: root.editAutoStartBreaks
    }
    
    MouseArea {
      anchors.fill: parent
      cursorShape: Qt.PointingHandCursor
      onClicked: {
        root.editAutoStartBreaks = !root.editAutoStartBreaks
        autoStartBreaksToggle.checked = root.editAutoStartBreaks
      }
    }
  }

  Item {
    Layout.fillWidth: true
    Layout.preferredHeight: autoStartWorkToggle.implicitHeight
    
    NToggle {
      id: autoStartWorkToggle
      anchors.fill: parent
      label: pluginApi?.tr("settings.auto-start-work") || "Auto-start Work"
      description: pluginApi?.tr("settings.auto-start-work-desc") || "Automatically start work timer after break"
      checked: root.editAutoStartWork
    }
    
    MouseArea {
      anchors.fill: parent
      cursorShape: Qt.PointingHandCursor
      onClicked: {
        root.editAutoStartWork = !root.editAutoStartWork
        autoStartWorkToggle.checked = root.editAutoStartWork
      }
    }
  }

  Item {
    Layout.fillWidth: true
    Layout.preferredHeight: compactModeToggle.implicitHeight
    
    NToggle {
      id: compactModeToggle
      anchors.fill: parent
      label: pluginApi?.tr("settings.compact-mode") || "Compact Mode"
      description: pluginApi?.tr("settings.compact-mode-desc") || "Hide the circular progress bar for a cleaner look"
      checked: root.editCompactMode
    }
    
    MouseArea {
      anchors.fill: parent
      cursorShape: Qt.PointingHandCursor
      onClicked: {
        root.editCompactMode = !root.editCompactMode
        compactModeToggle.checked = root.editCompactMode
      }
    }
  }

  // --- : Play Sound Toggle ---
  Item {
    Layout.fillWidth: true
    Layout.preferredHeight: playSoundToggle.implicitHeight

    NToggle {
      id: playSoundToggle
      anchors.fill: parent
      label: "Play Alarm Sound"
      description: "Play a sound when the timer finishes"
      checked: root.editPlaySound
    }

    MouseArea {
      anchors.fill: parent
      cursorShape: Qt.PointingHandCursor
      onClicked: {
        root.editPlaySound = !root.editPlaySound
        playSoundToggle.checked = root.editPlaySound
      }
    }
  }

  function saveSettings() {
    if (!pluginApi) {
      Logger.e("Pomodoro", "Cannot save settings: pluginApi is null")
      return
    }

    pluginApi.pluginSettings.workDuration = root.editWorkDuration
    pluginApi.pluginSettings.shortBreakDuration = root.editShortBreakDuration
    pluginApi.pluginSettings.longBreakDuration = root.editLongBreakDuration
    pluginApi.pluginSettings.sessionsBeforeLongBreak = root.editSessionsBeforeLongBreak
    pluginApi.pluginSettings.autoStartBreaks = root.editAutoStartBreaks
    pluginApi.pluginSettings.autoStartWork = root.editAutoStartWork
    pluginApi.pluginSettings.compactMode = root.editCompactMode
    
    // --- : Save Sound Setting ---
    pluginApi.pluginSettings.playSound = root.editPlaySound

    pluginApi.saveSettings()

    if (pluginApi.mainInstance) {
      pluginApi.mainInstance.settingsVersion++
    }


  }
}
```

<!-- Não foi possível ler /home/freitas/.config/noctalia/plugins/pomodoro/alarm.mp3: 'utf-8' codec can't decode byte 0xff in position 0: invalid start byte -->

## `~/.config/noctalia/plugins/pomodoro/manifest.json`

```json
{
  "id": "pomodoro",
  "name": "Pomodoro",
  "version": "1.2.0",
  "minNoctaliaVersion": "4.0.0",
  "author": "notprayasmitra",
  "license": "MIT",
  "repository": "https://github.com/noctalia-dev/noctalia-plugins",
  "description": "A pomodoro timer plugin to help boost productivity.",
  "tags": [
    "Bar",
    "Productivity"
  ],
  "entryPoints": {
    "main": "Main.qml",
    "barWidget": "BarWidget.qml",
    "panel": "Panel.qml",
    "settings": "Settings.qml"
  },
  "dependencies": {
    "plugins": []
  },
  "metadata": {
    "defaultSettings": {
      "workDuration": 25,
      "shortBreakDuration": 5,
      "longBreakDuration": 15,
      "sessionsBeforeLongBreak": 4,
      "autoStartBreaks": false,
      "autoStartWork": false
    }
  }
}
```

<!-- Não foi possível ler /home/freitas/.config/noctalia/plugins/pomodoro/preview.png: 'utf-8' codec can't decode byte 0x89 in position 0: invalid start byte -->

## `~/.config/noctalia/plugins/pomodoro/i18n/de.json`

```json
{
  "panel": {
    "long-break": "Lange Pause",
    "pause": "Pause",
    "reset": "Zurücksetzen",
    "reset-all": "Alles zurücksetzen",
    "resume": "Fortsetzen",
    "session": "Sitzung",
    "settings": "Widget-Einstellungen",
    "short-break": "Kurze Pause",
    "skip": "Überspringen",
    "start": "Starten",
    "title": "Pomodoro",
    "work": "Arbeit"
  },
  "settings": {
    "auto-start-breaks": "Autostart-Fehler",
    "auto-start-breaks-desc": "Pausentimer nach Arbeitssitzung automatisch starten",
    "auto-start-work": "Automatischer Arbeitsbeginn",
    "auto-start-work-desc": "Automatisch Arbeitszeit nach Pause starten",
    "compact-mode": "Kompaktmodus",
    "compact-mode-desc": "Ein kürzeres und minimalistischeres Aussehen für das Widget",
    "long-break-duration": "Dauer der langen Pause",
    "long-break-duration-desc": "Dauer langer Pausen in Minuten",
    "sessions-before-long-break": "Sitzungen vor langer Pause",
    "sessions-before-long-break-desc": "Anzahl der Arbeitssitzungen vor einer langen Pause",
    "short-break-duration": "Kurze Pausenlänge",
    "short-break-duration-desc": "Dauer der kurzen Pausen in Minuten",
    "work-duration": "Arbeitsdauer",
    "work-duration-desc": "Dauer jeder Arbeitssitzung in Minuten"
  },
  "toast": {
    "break-finished": "Pause vorbei! Bereit, dich zu konzentrieren?",
    "long-break-finished": "Die lange Pause ist vorbei! Bereit für einen neuen Zyklus?",
    "title": "Pomodoro",
    "work-finished": "Arbeitssitzung abgeschlossen! Zeit für eine Pause."
  }
}
```

## `~/.config/noctalia/plugins/pomodoro/i18n/en.json`

```json
{
  "panel": {
    "long-break": "Long Break",
    "pause": "Pause",
    "reset": "Reset",
    "reset-all": "Reset All",
    "resume": "Resume",
    "session": "Session",
    "settings": "Widget Settings",
    "short-break": "Short Break",
    "skip": "Skip",
    "start": "Start",
    "title": "Pomodoro",
    "work": "Work"
  },
  "settings": {
    "auto-start-breaks": "Auto-start Breaks",
    "auto-start-breaks-desc": "Automatically start break timer after work session",
    "auto-start-work": "Auto-start Work",
    "auto-start-work-desc": "Automatically start work timer after break",
    "compact-mode": "Compact Mode",
    "compact-mode-desc": "A shorter and more minimal look for the widget",
    "long-break-duration": "Long Break Duration",
    "long-break-duration-desc": "Duration of long breaks in minutes",
    "sessions-before-long-break": "Sessions Before Long Break",
    "sessions-before-long-break-desc": "Number of work sessions before a long break",
    "short-break-duration": "Short Break Duration",
    "short-break-duration-desc": "Duration of short breaks in minutes",
    "work-duration": "Work Duration",
    "work-duration-desc": "Duration of each work session in minutes"
  },
  "toast": {
    "break-finished": "Break over! Ready to focus?",
    "long-break-finished": "Long break over! Ready for a new cycle?",
    "title": "Pomodoro",
    "work-finished": "Work session complete! Time for a break."
  }
}
```

## `~/.config/noctalia/plugins/pomodoro/i18n/es.json`

```json
{
  "panel": {
    "long-break": "Descanso Largo",
    "pause": "Pausar",
    "reset": "Restablecer",
    "reset-all": "Restablecer todo",
    "resume": "Reanudar",
    "session": "Sesión",
    "settings": "Ajustes del Widget",
    "short-break": "Descanso Corto",
    "skip": "Omitir",
    "start": "Empezar",
    "title": "Pomodoro",
    "work": "Trabajo"
  },
  "settings": {
    "auto-start-breaks": "Errores de inicio automático",
    "auto-start-breaks-desc": "Iniciar automáticamente el temporizador de descanso después de la sesión de trabajo",
    "auto-start-work": "Inicio automático del área de trabajo",
    "auto-start-work-desc": "Iniciar automáticamente el temporizador de trabajo después del descanso",
    "compact-mode": "Modo compacto",
    "compact-mode-desc": "Un aspecto más corto y minimalista para el widget",
    "long-break-duration": "Duración de la pausa larga",
    "long-break-duration-desc": "Duración de las pausas largas en minutos",
    "sessions-before-long-break": "Sesiones antes de una pausa larga",
    "sessions-before-long-break-desc": "Número de sesiones de trabajo antes de un descanso largo",
    "short-break-duration": "Duración de la pausa breve",
    "short-break-duration-desc": "Duración de las pausas cortas en minutos",
    "work-duration": "Duración del trabajo",
    "work-duration-desc": "Duración de cada sesión de trabajo en minutos"
  },
  "toast": {
    "break-finished": "¡Se acabó el descanso! ¿Listo para concentrarte?",
    "long-break-finished": "¡Se acabó el descanso! ¿Listo para un nuevo ciclo?",
    "title": "Pomodoro",
    "work-finished": "¡Sesión de trabajo completada! Hora de un descanso."
  }
}
```

## `~/.config/noctalia/plugins/pomodoro/i18n/fr.json`

```json
{
  "panel": {
    "long-break": "Pause Longue",
    "pause": "Pause",
    "reset": "Réinitialiser",
    "reset-all": "Tout réinitialiser",
    "resume": "Reprendre",
    "session": "Session",
    "settings": "Paramètres du widget",
    "short-break": "Courte pause",
    "skip": "Ignorer",
    "start": "Démarrer",
    "title": "Pomodoro",
    "work": "Travail"
  },
  "settings": {
    "auto-start-breaks": "Démarrages automatiques interrompus",
    "auto-start-breaks-desc": "Démarrer automatiquement le minuteur de pause après une session de travail",
    "auto-start-work": "Démarrage auto du bureau",
    "auto-start-work-desc": "Démarrer automatiquement le minuteur de travail après la pause",
    "compact-mode": "Mode compact",
    "compact-mode-desc": "Un aspect plus court et plus minimal pour le widget",
    "long-break-duration": "Durée de pause longue",
    "long-break-duration-desc": "Durée des longues pauses en minutes",
    "sessions-before-long-break": "Sessions avant longue pause",
    "sessions-before-long-break-desc": "Nombre de sessions de travail avant une pause longue",
    "short-break-duration": "Durée de la pause courte",
    "short-break-duration-desc": "Durée des pauses courtes en minutes",
    "work-duration": "Durée de travail",
    "work-duration-desc": "Durée de chaque session de travail en minutes"
  },
  "toast": {
    "break-finished": "La pause est finie ! Prêt à se concentrer ?",
    "long-break-finished": "Longue pause terminée ! Prêt pour un nouveau cycle ?",
    "title": "Pomodoro",
    "work-finished": "Session de travail terminée ! L'heure est à la pause."
  }
}
```

## `~/.config/noctalia/plugins/pomodoro/i18n/hu.json`

```json
{
  "panel": {
    "long-break": "Hosszú szünet",
    "pause": "Szünet",
    "reset": "Visszaállítás",
    "reset-all": "Összes beállítás visszaállítása",
    "resume": "Folytatás",
    "session": "Munkamenet",
    "settings": "Widget beállítások",
    "short-break": "Rövid szünet",
    "skip": "Ugrás",
    "start": "Indítás",
    "title": "Pomodoro",
    "work": "Munka"
  },
  "settings": {
    "auto-start-breaks": "Automatikus indítási hibák",
    "auto-start-breaks-desc": "Automatikus szünetidőzítő indítása a munkamenet után",
    "auto-start-work": "Automatikus munkafolyamat indítás",
    "auto-start-work-desc": "Munkaidő-időzítő automatikus indítása szünet után",
    "compact-mode": "Kompakt mód",
    "compact-mode-desc": "Rövidebb és minimalista megjelenés a widgethez",
    "long-break-duration": "Hosszú szünet időtartama",
    "long-break-duration-desc": "Hosszú szünetek időtartama percben",
    "sessions-before-long-break": "Hosszú szünet előtti munkamenetek",
    "sessions-before-long-break-desc": "Hány munkamenet után legyen egy hosszabb szünet",
    "short-break-duration": "Rövid szünet időtartama",
    "short-break-duration-desc": "Rövid szünetek időtartama percben",
    "work-duration": "Munkaidő",
    "work-duration-desc": "Minden munkamenet időtartama percben"
  },
  "toast": {
    "break-finished": "Szünet vége! Készen állsz a koncentrálásra?",
    "long-break-finished": "Hosszú szünet vége! Készen állsz egy új ciklusra?",
    "title": "Pomodoro",
    "work-finished": "A munkamenet véget ért! Ideje szünetet tartani."
  }
}
```

## `~/.config/noctalia/plugins/pomodoro/i18n/it.json`

```json
{
  "panel": {
    "long-break": "Pausa Larga",
    "pause": "Pausa",
    "reset": "Restablecer",
    "reset-all": "Restablecer todo",
    "resume": "Reanudar",
    "session": "Sesión",
    "settings": "Configuración del Widget",
    "short-break": "Pausa Breve",
    "skip": "Omitir",
    "start": "Comenzar",
    "title": "Pomodoro",
    "work": "Trabajo"
  },
  "settings": {
    "auto-start-breaks": "Errores de inicio automático",
    "auto-start-breaks-desc": "Iniciar automáticamente el temporizador de descanso después de la sesión de trabajo",
    "auto-start-work": "Inicio automático del trabajo",
    "auto-start-work-desc": "Iniciar automáticamente el temporizador de trabajo después del descanso",
    "compact-mode": "Modo Compacto",
    "compact-mode-desc": "Un aspecto más corto y minimalista para el widget",
    "long-break-duration": "Duración de la pausa larga",
    "long-break-duration-desc": "Duración de las pausas largas en minutos",
    "sessions-before-long-break": "Sesiones antes de una pausa larga",
    "sessions-before-long-break-desc": "Número de sesiones de trabajo antes de un descanso largo",
    "short-break-duration": "Duración de la pausa breve",
    "short-break-duration-desc": "Duración de los descansos cortos en minutos",
    "work-duration": "Duración del trabajo",
    "work-duration-desc": "Duración de cada sesión de trabajo en minutos"
  },
  "toast": {
    "break-finished": "¡Se acabó el descanso! ¿Listo para concentrarte?",
    "long-break-finished": "¡Se acabó el descanso! ¿Listo para un nuevo ciclo?",
    "title": "Pomodoro",
    "work-finished": "¡Sesión de trabajo completada! Hora de un descanso."
  }
}
```

## `~/.config/noctalia/plugins/pomodoro/i18n/ja.json`

```json
{
  "panel": {
    "long-break": "長めの休憩",
    "pause": "一時停止",
    "reset": "リセット",
    "reset-all": "すべてリセット",
    "resume": "再開",
    "session": "セッション",
    "settings": "ウィジェット設定",
    "short-break": "短い休憩",
    "skip": "スキップ",
    "start": "開始",
    "title": "ポモドーロ",
    "work": "作業"
  },
  "settings": {
    "auto-start-breaks": "自動起動の破損",
    "auto-start-breaks-desc": "作業セッション後に休憩タイマーを自動的に開始",
    "auto-start-work": "起動時にワークスペースを復元",
    "auto-start-work-desc": "休憩後、作業タイマーを自動的に開始",
    "compact-mode": "コンパクトモード",
    "compact-mode-desc": "ウィジェットをより短く、よりミニマルな外観に",
    "long-break-duration": "長めの休憩時間",
    "long-break-duration-desc": "長休憩の時間 (分)",
    "sessions-before-long-break": "長時間の休憩前のセッション",
    "sessions-before-long-break-desc": "長い休憩を取るまでの作業セッション数",
    "short-break-duration": "短い休憩時間",
    "short-break-duration-desc": "短い休憩時間（分）",
    "work-duration": "作業時間",
    "work-duration-desc": "各作業セッションの時間（分）"
  },
  "toast": {
    "break-finished": "休憩終わり！集中する準備はできた？",
    "long-break-finished": "長い休憩は終わり！新しいサイクルを始める準備はいい？",
    "title": "ポモドーロ",
    "work-finished": "お仕事お疲れ様でした！休憩しましょう。"
  }
}
```

## `~/.config/noctalia/plugins/pomodoro/i18n/ku.json`

```json
{
  "panel": {
    "long-break": "Demek dirêj",
    "pause": "Rawestîne",
    "reset": "Ji nû ve saz bike",
    "reset-all": "Hemûyan Vejîne",
    "resume": "Berdewam bike",
    "session": "Rûniştin",
    "settings": "Mîhengên Wîcêtan",
    "short-break": "Demek kurt",
    "skip": "Derbas bike",
    "start": "Destpêk",
    "title": "Pomodoro",
    "work": "Xebat"
  },
  "settings": {
    "auto-start-breaks": "Şikestên Destpêk-Xweber",
    "auto-start-breaks-desc": "Piştî danişîna xebatê, demjimêra bêhnvedanê bixweber dest pê bike",
    "auto-start-work": "Xebata Xweser Destpê Bike",
    "auto-start-work-desc": "Piştî bêhnvedanê bixweber demjimêra kar dest pê bike",
    "compact-mode": "Rewşa Kompakt",
    "compact-mode-desc": "Dîmeneke kurtir û mînîmaltir ji bo wîcgetê",
    "long-break-duration": "Demdirêjiya Navbereke Dirêj",
    "long-break-duration-desc": "Demê dirêjkirina navberên dirêj bi deqîqeyan",
    "sessions-before-long-break": "Rûniştinên Berî Navbereke Dirêj",
    "sessions-before-long-break-desc": "Hejmara danişînên kar berî navbereke dirêj",
    "short-break-duration": "Demê Kurt ê Kurt",
    "short-break-duration-desc": "Demê kurtkirinê di deqîqeyan de",
    "work-duration": "Demê Karî",
    "work-duration-desc": "Demjimê dema her rûniştina xebatê bi deqîqeyan"
  },
  "toast": {
    "break-finished": "Dem hat bûn! Amade yî balê bikşînî?",
    "long-break-finished": "Demek dirêj xelas bû! Ma tu ji bo çerxeke nû amade yî?",
    "title": "Pomodoro",
    "work-finished": "Xebata kar temam bû! Dem dema bêhnvedanê ye."
  }
}
```

## `~/.config/noctalia/plugins/pomodoro/i18n/nl.json`

```json
{
  "panel": {
    "long-break": "Lange pauze",
    "pause": "Pauze",
    "reset": "Resetten",
    "reset-all": "Alles resetten",
    "resume": "Hervatten",
    "session": "Sessie",
    "settings": "Widgetinstellingen",
    "short-break": "Korte pauze",
    "skip": "Overslaan",
    "start": "Starten",
    "title": "Pomodoro",
    "work": "Werk"
  },
  "settings": {
    "auto-start-breaks": "Automatisch opstarten mislukt",
    "auto-start-breaks-desc": "Start automatisch een pauzetimer na een werksessie",
    "auto-start-work": "Automatisch starten Werk",
    "auto-start-work-desc": "Start de werktimer automatisch na een pauze",
    "compact-mode": "Compacte modus",
    "compact-mode-desc": "Een kortere en meer minimalistische uitstraling voor de widget",
    "long-break-duration": "Duur lange pauze",
    "long-break-duration-desc": "Duur van lange pauzes in minuten",
    "sessions-before-long-break": "Sessies voor lange pauze",
    "sessions-before-long-break-desc": "Aantal werksessies voor een lange pauze",
    "short-break-duration": "Korte pauzeduur",
    "short-break-duration-desc": "Duur van korte pauzes in minuten",
    "work-duration": "Werkduur",
    "work-duration-desc": "Duur van elke werksessie in minuten"
  },
  "toast": {
    "break-finished": "Pauze voorbij! Klaar om te focussen?",
    "long-break-finished": "Lange pauze voorbij! Klaar voor een nieuwe cyclus?",
    "title": "Pomodoro",
    "work-finished": "Werksessie voltooid! Tijd voor een pauze."
  }
}
```

## `~/.config/noctalia/plugins/pomodoro/i18n/pl.json`

```json
{
  "panel": {
    "long-break": "Długa przerwa",
    "pause": "Wstrzymaj",
    "reset": "Resetuj",
    "reset-all": "Zresetuj wszystko",
    "resume": "Wznów",
    "session": "Sesja",
    "settings": "Ustawienia widżetu",
    "short-break": "Krótka przerwa",
    "skip": "Pomiń",
    "start": "Uruchom",
    "title": "Pomodoro",
    "work": "Praca"
  },
  "settings": {
    "auto-start-breaks": "Autostart przestaje działać",
    "auto-start-breaks-desc": "Automatycznie uruchamiaj minutnik przerwy po sesji pracy",
    "auto-start-work": "Automatyczne uruchamianie pracy",
    "auto-start-work-desc": "Automatycznie uruchamiaj licznik czasu pracy po przerwie",
    "compact-mode": "Tryb kompaktowy",
    "compact-mode-desc": "Bardziej krótki i minimalistyczny wygląd widżetu",
    "long-break-duration": "Długi czas przerwy",
    "long-break-duration-desc": "Czas trwania długich przerw w minutach",
    "sessions-before-long-break": "Sesje przed długą przerwą",
    "sessions-before-long-break-desc": "Liczba sesji pracy przed dłuższą przerwą",
    "short-break-duration": "Czas trwania krótkiej przerwy",
    "short-break-duration-desc": "Czas trwania krótkich przerw w minutach",
    "work-duration": "Czas pracy",
    "work-duration-desc": "Czas trwania każdej sesji roboczej w minutach"
  },
  "toast": {
    "break-finished": "Koniec przerwy! Gotowy do skupienia?",
    "long-break-finished": "Długa przerwa dobiegła końca! Gotowy na nowy cykl?",
    "title": "Pomodoro",
    "work-finished": "Sesja pracy zakończona! Czas na przerwę."
  }
}
```

## `~/.config/noctalia/plugins/pomodoro/i18n/pt.json`

```json
{
  "panel": {
    "long-break": "Pausa Longa",
    "pause": "Pausar",
    "reset": "Restaurar",
    "reset-all": "Redefinir Tudo",
    "resume": "Retomar",
    "session": "Sessão",
    "settings": "Configurações do Widget",
    "short-break": "Pausa Curta",
    "skip": "Ignorar",
    "start": "Iniciar",
    "title": "Pomodoro",
    "work": "Trabalho"
  },
  "settings": {
    "auto-start-breaks": "Quebras de Inicialização Automática",
    "auto-start-breaks-desc": "Iniciar automaticamente o temporizador de pausa após a sessão de trabalho",
    "auto-start-work": "Iniciar Trabalho Automaticamente",
    "auto-start-work-desc": "Iniciar o timer de trabalho automaticamente após a pausa",
    "compact-mode": "Modo Compacto",
    "compact-mode-desc": "Um visual mais curto e minimalista para o widget",
    "long-break-duration": "Duração da Pausa Longa",
    "long-break-duration-desc": "Duração das pausas longas em minutos",
    "sessions-before-long-break": "Sessões Antes da Pausa Longa",
    "sessions-before-long-break-desc": "Número de sessões de trabalho antes de uma pausa longa",
    "short-break-duration": "Duração da Pausa Curta",
    "short-break-duration-desc": "Duração das pausas curtas em minutos",
    "work-duration": "Duração do Trabalho",
    "work-duration-desc": "Duração de cada sessão de trabalho em minutos"
  },
  "toast": {
    "break-finished": "A pausa acabou! Pronto para focar?",
    "long-break-finished": "A pausa acabou! Preparado para um novo ciclo?",
    "title": "Pomodoro",
    "work-finished": "Sessão de trabalho concluída! Hora de uma pausa."
  }
}
```

## `~/.config/noctalia/plugins/pomodoro/i18n/ru.json`

```json
{
  "panel": {
    "long-break": "Длительный перерыв",
    "pause": "Пауза",
    "reset": "Сбросить",
    "reset-all": "Сбросить всё",
    "resume": "Возобновить",
    "session": "Сеанс",
    "settings": "Настройки виджета",
    "short-break": "Короткий перерыв",
    "skip": "Пропустить",
    "start": "Начать",
    "title": "Pomodoro",
    "work": "Работа"
  },
  "settings": {
    "auto-start-breaks": "Автозапуск не работает",
    "auto-start-breaks-desc": "Автоматически запускать таймер перерыва после рабочей сессии",
    "auto-start-work": "Автозапуск Work",
    "auto-start-work-desc": "Автоматически запускать рабочий таймер после перерыва",
    "compact-mode": "Компактный режим",
    "compact-mode-desc": "Более короткий и минималистичный вид для виджета",
    "long-break-duration": "Длительность долгого перерыва",
    "long-break-duration-desc": "Длительность долгих перерывов в минутах",
    "sessions-before-long-break": "Сеансы до долгого перерыва",
    "sessions-before-long-break-desc": "Количество рабочих сессий до длинного перерыва",
    "short-break-duration": "Длительность короткого перерыва",
    "short-break-duration-desc": "Длительность коротких перерывов в минутах",
    "work-duration": "Длительность работы",
    "work-duration-desc": "Длительность каждой рабочей сессии в минутах"
  },
  "toast": {
    "break-finished": "Перерыв окончен! Готовы сосредоточиться?",
    "long-break-finished": "Долгий перерыв окончен! Готовы к новому циклу?",
    "title": "Pomodoro",
    "work-finished": "Рабочая сессия завершена! Время для перерыва."
  }
}
```

## `~/.config/noctalia/plugins/pomodoro/i18n/tr.json`

```json
{
  "panel": {
    "long-break": "Uzun Ara",
    "pause": "Duraklat",
    "reset": "Sıfırla",
    "reset-all": "Tümünü Sıfırla",
    "resume": "Devam Et",
    "session": "Oturum",
    "settings": "Widget Ayarları",
    "short-break": "Kısa Mola",
    "skip": "Atla",
    "start": "Başlat",
    "title": "Pomodoro",
    "work": "İş"
  },
  "settings": {
    "auto-start-breaks": "Otomatik Başlangıç Arızaları",
    "auto-start-breaks-desc": "Çalışma oturumundan sonra mola zamanlayıcısını otomatik olarak başlat",
    "auto-start-work": "Otomatik İşe Başla",
    "auto-start-work-desc": "Aradan sonra otomatik olarak iş zamanlayıcısını başlat",
    "compact-mode": "Kompakt Modu",
    "compact-mode-desc": "Widget için daha kısa ve minimal bir görünüm",
    "long-break-duration": "Uzun Ara Süresi",
    "long-break-duration-desc": "Uzun molaların süresi (dakika)",
    "sessions-before-long-break": "Uzun Aradan Önceki Oturumlar",
    "sessions-before-long-break-desc": "Uzun moladan önce yapılacak çalışma oturumu sayısı",
    "short-break-duration": "Kısa Mola Süresi",
    "short-break-duration-desc": "Kısa molaların süresi (dakika)",
    "work-duration": "Çalışma Süresi",
    "work-duration-desc": "Her bir çalışma oturumunun süresi (dakika)"
  },
  "toast": {
    "break-finished": "Mola bitti! Odaklanmaya hazır mısın?",
    "long-break-finished": "Uzun ara bitti! Yeni bir döngüye hazır mısın?",
    "title": "Pomodoro",
    "work-finished": "Çalışma oturumu tamamlandı! Mola zamanı."
  }
}
```

## `~/.config/noctalia/plugins/pomodoro/i18n/uk-UA.json`

```json
{
  "panel": {
    "long-break": "Тривала перерва",
    "pause": "Пауза",
    "reset": "Скинути",
    "reset-all": "Скинути все",
    "resume": "Відновити",
    "session": "Сеанс",
    "settings": "Налаштування віджетів",
    "short-break": "Коротка перерва",
    "skip": "Пропустити",
    "start": "Почати",
    "title": "Pomodoro",
    "work": "Робота"
  },
  "settings": {
    "auto-start-breaks": "Помилки автозапуску",
    "auto-start-breaks-desc": "Автоматично запускати таймер перерви після робочої сесії",
    "auto-start-work": "Автозапуск Workspace",
    "auto-start-work-desc": "Автоматично запускати робочий таймер після перерви",
    "compact-mode": "Компактний режим",
    "compact-mode-desc": "Коротший та мінімалістичніший вигляд для віджета",
    "long-break-duration": "Тривалість довгої перерви",
    "long-break-duration-desc": "Тривалість довгих перерв у хвилинах",
    "sessions-before-long-break": "Сеанси перед довгою перервою",
    "sessions-before-long-break-desc": "Кількість робочих сесій перед довгою перервою",
    "short-break-duration": "Тривалість короткої перерви",
    "short-break-duration-desc": "Тривалість коротких перерв у хвилинах",
    "work-duration": "Тривалість роботи",
    "work-duration-desc": "Тривалість кожної робочої сесії в хвилинах"
  },
  "toast": {
    "break-finished": "Перерва закінчилася! Готові зосередитися?",
    "long-break-finished": "Довга перерва закінчилася! Готові до нового циклу?",
    "title": "Pomodoro",
    "work-finished": "Робочу сесію завершено! Час на перерву."
  }
}
```

## `~/.config/noctalia/plugins/pomodoro/i18n/zh-CN.json`

```json
{
  "panel": {
    "long-break": "长时间休息",
    "pause": "暂停",
    "reset": "重置",
    "reset-all": "全部重置",
    "resume": "恢复",
    "session": "会话",
    "settings": "小部件设置",
    "short-break": "短暂休息",
    "skip": "跳过",
    "start": "开始",
    "title": "番茄工作法",
    "work": "工作"
  },
  "settings": {
    "auto-start-breaks": "自动启动中断",
    "auto-start-breaks-desc": "在工作会话后自动启动休息计时器",
    "auto-start-work": "自动启动工作区",
    "auto-start-work-desc": "休息后自动开始工作计时器",
    "compact-mode": "紧凑模式",
    "compact-mode-desc": "更短更简洁的 Widget 外观",
    "long-break-duration": "长时间休息时长",
    "long-break-duration-desc": "长时间休息的持续时间（分钟）",
    "sessions-before-long-break": "长时间休息前的会话",
    "sessions-before-long-break-desc": "长休息前的工作会话数",
    "short-break-duration": "短暂休息时长",
    "short-break-duration-desc": "短休息时长（分钟）",
    "work-duration": "工作时长",
    "work-duration-desc": "每个工作阶段的持续时间（分钟）"
  },
  "toast": {
    "break-finished": "休息结束！准备好专注了吗？",
    "long-break-finished": "休息够了吗！准备好迎接新的循环了吗？",
    "title": "番茄工作法",
    "work-finished": "工作会话已完成！休息一下吧。"
  }
}
```

## `~/.config/noctalia/plugins/pomodoro/i18n/zh-TW.json`

```json
{
  "panel": {
    "long-break": "長休息",
    "pause": "暫停",
    "reset": "重置",
    "reset-all": "全部重置",
    "resume": "繼續",
    "session": "環節",
    "settings": "小工具設定",
    "short-break": "短休息",
    "skip": "跳過",
    "start": "開始",
    "title": "番茄鐘",
    "work": "工作"
  },
  "settings": {
    "auto-start-breaks": "自動切換休息",
    "auto-start-breaks-desc": "在工作環節後自動開始計時休息時間",
    "auto-start-work": "自動切換工作",
    "auto-start-work-desc": "在休息環節後自動開始計時工作時間",
    "compact-mode": "緊湊模式",
    "compact-mode-desc": "讓小工具看起來更小更精練",
    "long-break-duration": "長休息時長",
    "long-break-duration-desc": "設定想長休息幾分鐘",
    "sessions-before-long-break": "長休息前的節數",
    "sessions-before-long-break-desc": "設定在一個長休息前該有幾個工作環節",
    "short-break-duration": "短休息時長",
    "short-break-duration-desc": "設定想短休息幾分鐘",
    "work-duration": "工作時長",
    "work-duration-desc": "設定每次的工作環節該有幾分鐘"
  },
  "toast": {
    "break-finished": "休息時間到了! 準備好專心了嗎?",
    "long-break-finished": "長休息結束了! 準備好再來一輪了嗎?",
    "title": "番茄鐘",
    "work-finished": "工作環節完成! 該休息一下了"
  }
}
```

## `~/.config/noctalia/colorschemes/Monochrome/Monochrome.json`

```json
{
  "dark": {
    "mPrimary": "#aaaaaa",
    "mOnPrimary": "#111111",
    "mSecondary": "#a7a7a7",
    "mOnSecondary": "#111111",
    "mTertiary": "#cccccc",
    "mOnTertiary": "#111111",
    "mError": "#dddddd",
    "mOnError": "#111111",
    "mSurface": "#111111",
    "mOnSurface": "#828282",
    "mSurfaceVariant": "#191919",
    "mOnSurfaceVariant": "#5d5d5d",
    "mOutline": "#3c3c3c",
    "mShadow": "#000000",
    "mHover": "#cccccc",
    "mOnHover": "#111111",
    "terminal": {
      "foreground": "#828282",
      "background": "#111111",
      "selectionFg": "#111111",
      "selectionBg": "#828282",
      "cursorText": "#111111",
      "cursor": "#aaaaaa",
      "normal": {
        "black": "#191919",
        "red": "#dddddd",
        "green": "#cccccc",
        "yellow": "#aaaaaa",
        "blue": "#a7a7a7",
        "magenta": "#dddddd",
        "cyan": "#cccccc",
        "white": "#828282"
      },
      "bright": {
        "black": "#3c3c3c",
        "red": "#dddddd",
        "green": "#cccccc",
        "yellow": "#aaaaaa",
        "blue": "#a7a7a7",
        "magenta": "#dddddd",
        "cyan": "#cccccc",
        "white": "#ffffff"
      }
    }
  },
  "light": {
    "mPrimary": "#555555",
    "mOnPrimary": "#eeeeee",
    "mSecondary": "#505058",
    "mOnSecondary": "#eeeeee",
    "mTertiary": "#333333",
    "mOnTertiary": "#eeeeee",
    "mError": "#222222",
    "mOnError": "#efefef",
    "mSurface": "#d4d4d4",
    "mOnSurface": "#696969",
    "mSurfaceVariant": "#e8e8e8",
    "mOnSurfaceVariant": "#9e9e9e",
    "mOutline": "#c3c3c3",
    "mShadow": "#fafafa",
    "mHover": "#333333",
    "mOnHover": "#eeeeee",
    "terminal": {
      "foreground": "#696969",
      "background": "#d4d4d4",
      "selectionFg": "#d4d4d4",
      "selectionBg": "#696969",
      "cursorText": "#d4d4d4",
      "cursor": "#555555",
      "normal": {
        "black": "#e8e8e8",
        "red": "#222222",
        "green": "#333333",
        "yellow": "#555555",
        "blue": "#505058",
        "magenta": "#222222",
        "cyan": "#333333",
        "white": "#696969"
      },
      "bright": {
        "black": "#c3c3c3",
        "red": "#222222",
        "green": "#333333",
        "yellow": "#555555",
        "blue": "#505058",
        "magenta": "#222222",
        "cyan": "#333333",
        "white": "#000000"
      }
    }
  }
}
```

## `~/.config/noctalia/colorschemes/Mine/Mine.json`

```json
{
  "dark": {
    "mPrimary": "#e1e2d5",
    "mOnPrimary": "#1d1b1d",
    "mSecondary": "#2d2a2e",
    "mOnSecondary": "#e1e2d5",
    "mTertiary": "#2d2a2e",
    "mOnTertiary": "#e1e2d5",
    "mError": "#d94a59",
    "mOnError": "#1d1b1d",
    "mSurface": "#1d1b1d",
    "mOnSurface": "#e1e2d5",
    "mSurfaceVariant": "#262427",
    "mOnSurfaceVariant": "#e1e2d5",
    "mOutline": "#000023",
    "mShadow": "#120f18",
    "mHover": "#2d2a2e",
    "mOnHover": "#e1e2d5",
    "terminal": {
      "normal": {
        "black": "#120f18",
        "red": "#D94A59",
        "green": "#3DCC61",
        "yellow": "#FFD400",
        "blue": "#4ea8de",
        "magenta": "#5a189a",
        "cyan": "#04a6c2",
        "white": "#E1E2D5"
      },
      "bright": {
        "black": "#262427",
        "red": "#FF707F",
        "green": "#61F285",
        "yellow": "#F2E661",
        "blue": "#48bfe3",
        "magenta": "#7b2cbf",
        "cyan": "#00b2ca",
        "white": "#f1faee"
      },
      "foreground": "#E1E2D5",
      "background": "#1D1B1D",
      "selectionFg": "#1D1B1D",
      "selectionBg": "#E1E2D5",
      "cursor": "#E1E2D5",
      "cursorText": "#1D1B1D"
    }
  },
  "light": {
    "mPrimary": "#3a3a34",
    "mOnPrimary": "#ffffff",
    "mSecondary": "#e6e4e8",
    "mOnSecondary": "#2d2a2e",
    "mTertiary": "#f0eef2",
    "mOnTertiary": "#2d2a2e",
    "mError": "#d94a59",
    "mOnError": "#ffffff",
    "mSurface": "#ffffff",
    "mOnSurface": "#1d1b1d",
    "mSurfaceVariant": "#f3f2f5",
    "mOnSurfaceVariant": "#3a3a3a",
    "mOutline": "#b8b6bb",
    "mShadow": "#00000020",
    "mHover": "#e6e4e8",
    "mOnHover": "#1d1b1d",
    "terminal": {
      "normal": {
        "black": "#1d1b1d",
        "red": "#D94A59",
        "green": "#2ea043",
        "yellow": "#c99700",
        "blue": "#1f6feb",
        "magenta": "#7b2cbf",
        "cyan": "#0ea5a5",
        "white": "#d0d0c8"
      },
      "bright": {
        "black": "#5c5c5c",
        "red": "#ff707f",
        "green": "#4ad66d",
        "yellow": "#e6c200",
        "blue": "#4ea8de",
        "magenta": "#9d4edd",
        "cyan": "#22b8cf",
        "white": "#ffffff"
      },
      "foreground": "#1D1B1D",
      "background": "#FFFFFF",
      "selectionFg": "#FFFFFF",
      "selectionBg": "#3a3a34",
      "cursor": "#1D1B1D",
      "cursorText": "#FFFFFF"
    }
  }
}
```

## `~/.config/ghostty/config.ghostty`

```ghostty

```

