local modules = {
   "core",
   "plugins",
   "style",
}

for _, module in ipairs(modules) do
   local ok, err = pcall(require, module)
   if not ok then
      error("Error loading module " .. module .. "\n" .. err)
   end
end
