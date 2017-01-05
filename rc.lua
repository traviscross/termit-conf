-- -*- mode:lua; indent-tabs-mode:nil; lua-indent-level:2 -*-
-- Termit configuration
-- (c) Travis Cross <tc@traviscross.com>

require("termit.utils")

-- Set defaults
local defaults = {}
defaults.allowChangingTitle = true
defaults.backgroundColor = 'black'
defaults.backspaceBinding = 'AsciiDel'
defaults.colormap =
  {'#000000','#cd0000','#00cd00','#cdcd00',
   '#1e90ff','#cd00cd','#00cdcd','#e5e5e5',
   '#4c4c4c','#ff0000','#00ff00','#ffff00',
   '#4682b4','#ff00ff','#00ffff','#ffffff'}
defaults.cursorBlinkMode = 'BlinkOff'
defaults.cursorShape = 'Block'
defaults.deleteBinding = 'EraseDel'
defaults.encoding = 'UTF-8'
defaults.fillTabbar = false
defaults.font = 'Inconsolata Medium 10'
defaults.foregroundColor = '#bfbfbf'
defaults.geometry = '80x24'
defaults.hideMenubar = true
defaults.hideSingleTab = true
defaults.hideTabbar = false
defaults.hideTitlebarWhenMaximized = true
defaults.scrollbackLines = 100000
defaults.showBorder = false
defaults.showScrollbar = false
defaults.startMaximized = true
defaults.tabName = 'Terminal'
defaults.tabPos = 'Bottom'
defaults.windowTitle = 'Termit'
defaults.wordCharExceptions = '-A-Za-z0-9./?%&#:_+@~'
setOptions(defaults)
setKbPolicy('keycode')

-- Clear default keybindings
bindKey('Alt-Left',nil)
bindKey('Alt-Right',nil)
bindKey('Ctrl-t',nil)
bindKey('CtrlShift-w',nil)
bindKey('Ctrl-Insert',nil)
bindKey('Shift-Insert',nil)
bindMouse('DoubleClick',nil)

-- Set desired keybindings
function adjust_font_size(x)
  setTabFont(
    string.gsub(currentTab().font,"%d+$","",1)
      ..(currentTab().fontSize + x))
end
function move_tab_left() setTabPos(currentTabIndex() - 1) end
function move_tab_right() setTabPos(currentTabIndex() + 1) end
function incr_font_size () adjust_font_size(1) end
function decr_font_size () adjust_font_size(-1) end
bindKey('CtrlShift-plus',incr_font_size)
bindKey('CtrlShift-minus',decr_font_size)
bindKey('CtrlShift-Prior',move_tab_left)
bindKey('CtrlShift-Next',move_tab_right)
bindKey('Ctrl-Prior',prevTab)
bindKey('Ctrl-Next',nextTab)
bindKey('Shift-Left',prevTab)
bindKey('Shift-Right',nextTab)
bindKey('CtrlShift-r',reconfigure)
bindKey('CtrlShift-b',toggleTabbar)
bindKey('CtrlShift-t', openTab)
bindKey('CtrlShift-m',toggleMenubar)
bindKey('Ctrl-Insert',copy)
bindKey('Shift-Insert',paste)
