local colours = require "colours"
local dotfiles_path = os.getenv("Dotfiles")

local M = {}

local dark_theme_as_default = true
local dark_theme = "Gruvbox Dark"
local light_theme = "Github"
local dark_theme_bg_img = dotfiles_path .. "/common/backgrounds/1.jpg"
local light_theme_bg_img = dotfiles_path .. "/common/backgrounds/4.jpg"
local dark_theme_bg_hsb = {brightness = 0.02, saturation = 0.5}
local light_theme_bg_hsb = {brightness = 1.0, saturation = 1.0}
local dark_theme_bg_opacity = 0.91
local light_theme_bg_opacity = 1

M.default_colours = dark_theme_as_default and colours.dark or colours.light
M.alternate_colours = dark_theme_as_default and colours.light or colours.dark
M.default_theme = dark_theme_as_default and dark_theme or light_theme
M.alternate_theme = dark_theme_as_default and light_theme or dark_theme
M.default_bg_img = dark_theme_as_default and dark_theme_bg_img or light_theme_bg_img
M.alternate_bg_img = dark_theme_as_default and light_theme_bg_img or dark_theme_bg_img
M.default_bg_hsb = dark_theme_as_default and dark_theme_bg_hsb or light_theme_bg_hsb
M.alternate_bg_hsb = dark_theme_as_default and light_theme_bg_hsb or dark_theme_bg_hsb
M.default_bg_opacity = dark_theme_as_default and dark_theme_bg_opacity or light_theme_bg_opacity
M.alternate_bg_opacity = dark_theme_as_default and light_theme_bg_opacity or dark_theme_bg_opacity

return M
