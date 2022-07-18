local common = require "common"
local colours = require "colours"

local M = {}

local dark = true

M.default_colours = dark and colours.dark or colours.light
M.alternate_colours = dark and colours.light or colours.dark

M.default_theme = dark and common.dark_theme or common.light_theme
M.alternate_theme = dark and common.light_theme or common.dark_theme

M.default_bg_img = dark and common.dark_theme_bg_img or common.light_theme_bg_img
M.alternate_bg_img = dark and common.light_theme_bg_img or common.dark_theme_bg_img

M.default_bg_hsb = dark and common.dark_theme_bg_hsb or common.light_theme_bg_hsb
M.alternate_bg_hsb = dark and common.light_theme_bg_hsb or common.dark_theme_bg_hsb

return M
