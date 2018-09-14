-- -*- mode:lua; indent-tabs-mode:nil; lua-indent-level:2 -*-
--
-- Copyright (c) 2018 Travis Cross <tc@traviscross.com>
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
-- THE SOFTWARE.
--
-- ----
-- Termit configuration

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
bindKey('CtrlShift-Left',move_tab_left)
bindKey('CtrlShift-Right',move_tab_right)
bindKey('Shift-Left',prevTab)
bindKey('Shift-Right',nextTab)
bindKey('CtrlShift-r',reconfigure)
bindKey('CtrlShift-b',toggleTabbar)
bindKey('CtrlShift-t', openTab)
bindKey('CtrlShift-m',toggleMenubar)
bindKey('Ctrl-Insert',copy)
bindKey('CtrlShift-c',paste)
bindKey('Shift-Insert',paste)
bindKey('CtrlShift-v',paste)
