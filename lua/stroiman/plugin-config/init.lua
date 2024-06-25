vim.api.nvim_create_augroup("stroiman_plugin_load", {})

-- Make sure these are loaded first, so they are available if other
-- plugins cause errors during loading, these are avaiable for
-- navigating vim config files
require("stroiman.plugin-config.projectionist")
require("stroiman.plugin-config.telescope")
require("stroiman.plugin-config.harpoon")

for _, file in ipairs(vim.fn.readdir(vim.fn.stdpath('config') .. '/lua/stroiman/plugin-config', [[v:val =~ '\.lua$']])) do
  if file ~= 'init.lua' then
    require('stroiman.plugin-config.' .. file:gsub('%.lua$', ''))
  end
end
