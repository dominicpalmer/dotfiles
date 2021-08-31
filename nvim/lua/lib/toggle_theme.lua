local function toggle_theme(themes)
   local current_theme = vim.g.current_theme or vim.g.theme
   for _, name in ipairs(themes) do
      if name ~= current_theme then
         if require("lib").reload_theme(name) then
            -- Open a buffer and close it to reload the statusline
            vim.cmd "new|bwipeout"
            vim.g.current_theme = name
            if require("lib").change_theme(vim.g.theme, name) then
               vim.g.theme = name
            end
         end
      end
   end
end

return toggle_theme
