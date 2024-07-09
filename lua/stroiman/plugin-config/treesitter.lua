local setup_treesitter = function()
  require("nvim-treesitter.configs").setup({
    ensure_installed = { "lua", "javascript", "typescript", "ocaml", "go", "ocaml_interface", "pug", "vimdoc", "tsx" },
    sync_install = false,
    highlight = { enable = true },
    indent = { enable = true },
  })

  vim.g.stroiman_treesitter_setup = true
end

vim.api.nvim_create_autocmd("User", {
  pattern = "LazyLoad",
  group = "stroiman_plugin_load",
  callback = function(ev)
    if ev.data == "treesitter" then
      setup_treesitter()
    end
  end,
})

if vim.g.stroiman_treesitter_setup then
  setup_treesitter()
end
