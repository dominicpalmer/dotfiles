-- Updated dynamically via toggle_theme
vim.o.background = "dark"
_G.colourscheme = "gruvbox"
vim.cmd("colorscheme " .. _G.colourscheme)

local ok, err = pcall(require, "style.highlights")
if not ok then
   error("Error loading module " .. module .. "\n" .. err)
end
