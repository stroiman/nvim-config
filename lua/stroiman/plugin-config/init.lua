vim.api.nvim_create_augroup("stroiman_plugin_load", {})

require("stroiman.plugin-config.telescope")
require("stroiman.plugin-config.projectionist")
require("stroiman.plugin-config.treesitter")
