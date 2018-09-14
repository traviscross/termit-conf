# Minimalist Termit Configuration

[Termit](https://github.com/nonstop/termit/wiki) is a
highly-configurable terminal emulator.  It's basically a thin layer
over the [VTE Terminal Widget
Library](https://wiki.gnome.org/Apps/Terminal/VTE).  It exposes most
of the knobs offered by VTE so they may be set from a Lua
configuration file.

Termit is a great terminal emulator.  It's underappreciated.  But
without custom configuration, its default behavior is fairly
unimpressive.

With just a bit of Lua, however, we can make Termit into a minimalist
terminal emulator.  This configuration features:

- No borders
- No menus
- No scroll bars
- No blinking cursor
- Tabs along the bottom
- UTF-8 encoding
- Key bindings for increasing/decreasing font size
- Chrome-like key bindings for tab management
- Light on dark theme with reasonable colors

## Dependencies

This configuration depends on:

- termit
- fonts-inconsolata

## Installation

```
sudo apt-get install -y termit fonts-inconsolata
mkdir -p ~/.config
git clone https://github.com/traviscross/termit-conf.git ~/.config/termit
```
