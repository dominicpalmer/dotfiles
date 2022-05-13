local ok, err = pcall(require, "style.highlights")
if not ok then
   error("Error loading module " .. module .. "\n" .. err)
end

vim.g.vscode_style = "light"

-- Updated dynamically via toggle_theme
local colourscheme = "gruvbox"
_G.colourscheme = "gruvbox"
vim.cmd("colorscheme " .. colourscheme)
