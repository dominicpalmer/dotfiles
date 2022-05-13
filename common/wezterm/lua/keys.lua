local wezterm = require "wezterm";

local M = {}

local shared = {
   -- Reload, change theme
   {key="t", mods="LEADER", action=wezterm.action{EmitEvent="ct_wezterm_tmux"}},
   {key="t", mods="CTRL", action=wezterm.action{EmitEvent="ct_wezterm_tmux_nvim"}},
   {key="r", mods="LEADER", action="ReloadConfiguration"},

   -- Compatibility
   {key="Backspace", mods="CTRL", action=wezterm.action{SendKey={key="\x17"}}},
}

M.platform = {
   windows = {
      -- Tab handlers
      {key="m", mods="LEADER", action=wezterm.action{SpawnTab="CurrentPaneDomain"}},
      {key="h", mods="LEADER", action=wezterm.action{CloseCurrentTab={confirm=false}}},
      {key="j", mods="LEADER", action=wezterm.action{CloseCurrentPane={confirm=false}}},
      {key="v", mods="LEADER", action=wezterm.action{SplitHorizontal={domain="CurrentPaneDomain"}}},
      {key="c", mods="LEADER", action=wezterm.action{SplitVertical={domain="CurrentPaneDomain"}}},

      -- Tab switchers
      {key="n", mods="LEADER", action="ActivateLastTab"},
      {key="1", mods="LEADER", action=wezterm.action{ActivateTab=0}},
      {key="2", mods="LEADER", action=wezterm.action{ActivateTab=1}},
      {key="3", mods="LEADER", action=wezterm.action{ActivateTab=2}},
      {key="4", mods="LEADER", action=wezterm.action{ActivateTab=3}},
      {key="5", mods="LEADER", action=wezterm.action{ActivateTab=4}},
      {key="6", mods="LEADER", action=wezterm.action{ActivateTab=5}},
      {key="7", mods="LEADER", action=wezterm.action{ActivateTab=6}},
      {key="8", mods="LEADER", action=wezterm.action{ActivateTab=7}},
      {key="9", mods="LEADER", action=wezterm.action{ActivateTab=8}},

      -- Pane switchers
      {key="h", mods="ALT", action=wezterm.action{ActivatePaneDirection="Left"}},
      {key="j", mods="ALT", action=wezterm.action{ActivatePaneDirection="Down"}},
      {key="k", mods="ALT", action=wezterm.action{ActivatePaneDirection="Up"}},
      {key="l", mods="ALT", action=wezterm.action{ActivatePaneDirection="Right"}},

      -- Scroll
      {key="j", mods="CTRL", action=wezterm.action{ScrollByPage=1}},
      {key="k", mods="CTRL", action=wezterm.action{ScrollByPage=-1}},

      table.unpack(shared),
   },

   unix = {
      -- Sends PageDown to tmux, which sends <C-j> to Neovim if it's open
      -- If Neovim isn't open, tmux will call PageDown on scrollback
      {key="j", mods="CTRL", action=wezterm.action{SendKey={key="PageDown"}}},

      table.unpack(shared),
   }
}

return M
