vim.api.nvim_create_autocmd("User", {
  pattern = "LazyLoad",
  group = "stroiman_plugin_load",
  callback = function(ev, opts)
    if ev.data == "treesitter" then
      local treesitter = require("nvim-treesitter")
      treesitter.setup({
        ensure_installed = { "lua", "javascript", "typescript", "ocaml", "go" },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true }
      })
    end
  end
})
