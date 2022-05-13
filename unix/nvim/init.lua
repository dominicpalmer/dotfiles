local modules = {
   "core",
   "style",
   "plugins",
}

for _, module in ipairs(modules) do
   local ok, err = pcall(require, module)
   if not ok then
      error("Error loading module " .. module .. "\n" .. err)
   end
end
