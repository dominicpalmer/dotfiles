local core_modules = {
   "core.options",
   "core.general",
   "core.remaps",
}

for _, module in ipairs(core_modules) do
   local ok, err = pcall(require, module)
   if not ok then
      error("Error loading " .. module .. "\n" .. err)
   end
end

-- Load the base remaps once at startup
require("core.remaps").base()
