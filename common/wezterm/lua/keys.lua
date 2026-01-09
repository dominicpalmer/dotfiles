local wezterm = require "wezterm";

local M = {}

local shared = {
   -- Reload
   {key="r", mods="LEADER", action="ReloadConfiguration"},

   -- <Ctrl-BS> for deleting words, <Ctrl-Left/Right> for moving cursor by words
   {key="Backspace", mods="CTRL", action=wezterm.action{SendKey={key="\x17"}}},
   {key = 'LeftArrow', mods='CTRL|SHIFT', action = wezterm.action.DisableDefaultAssignment},
   {key = 'RightArrow', mods='CTRL|SHIFT', action = wezterm.action.DisableDefaultAssignment},
}

M.platform = {
   windows = {
      -- No tmux on Windows, so replicate custom tmux keybinds through Wezterm builtin actions

      -- Last tab with n, new tab with m
      {key="n", mods="LEADER", action="ActivateLastTab"},
      {key="m", mods="LEADER", action=wezterm.action.SpawnTab("CurrentPaneDomain")},

      -- Tab handlers
      {key="j", mods="LEADER", action=wezterm.action{CloseCurrentPane={confirm=false}}},
      {key="k", mods="LEADER", action=wezterm.action{CloseCurrentTab={confirm=false}}},
      {key="v", mods="LEADER", action=wezterm.action.SplitHorizontal{domain="CurrentPaneDomain"}},
      {key="c", mods="LEADER", action=wezterm.action.SplitVertical{domain="CurrentPaneDomain"}},

      -- Split horizontal and run Claude Code
      {key="i", mods="LEADER", action=wezterm.action.SplitPane{
         direction="Right",
         command={args={"pwsh", "-NoExit", "-Command", "cl"}}
      }},

      -- Tab switching
      {key="1", mods="LEADER", action=wezterm.action{ActivateTab=0}},
      {key="2", mods="LEADER", action=wezterm.action{ActivateTab=1}},
      {key="3", mods="LEADER", action=wezterm.action{ActivateTab=2}},
      {key="4", mods="LEADER", action=wezterm.action{ActivateTab=3}},
      {key="5", mods="LEADER", action=wezterm.action{ActivateTab=4}},
      {key="6", mods="LEADER", action=wezterm.action{ActivateTab=5}},
      {key="7", mods="LEADER", action=wezterm.action{ActivateTab=6}},
      {key="8", mods="LEADER", action=wezterm.action{ActivateTab=7}},
      {key="9", mods="LEADER", action=wezterm.action{ActivateTab=8}},

      -- Pane switching
      {key="h", mods="CTRL", action=wezterm.action{ActivatePaneDirection="Left"}},
      {key="j", mods="CTRL", action=wezterm.action{ActivatePaneDirection="Down"}},
      {key="k", mods="CTRL", action=wezterm.action{ActivatePaneDirection="Up"}},
      {key="l", mods="CTRL", action=wezterm.action{ActivatePaneDirection="Right"}},

      -- Pageup, Pagedown
      {key="j", mods="ALT", action=wezterm.action{ScrollByPage=1}},
      {key="k", mods="ALT", action=wezterm.action{ScrollByPage=-1}},

      table.unpack(shared),
   },

   linux = {
      -- Most keybinds are handled by tmux natively. Anything here is for
      -- intercepting keys before being handled downstream.

      -- Sends Pagedown to tmux. Tmux will then send <M-j> to Neovim if it's
      -- open, else call Pagedown on terminal scrollback. This avoids Pagedown
      -- moving Neovim out of the viewport if invoked when it's open.
      {key="j", mods="ALT", action=wezterm.action{SendKey={key="PageDown"}}},

      table.unpack(shared),
   }
}

return M
