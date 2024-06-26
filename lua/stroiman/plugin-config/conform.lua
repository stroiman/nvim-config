local setup_conform = function()
  local conform = require("conform")
  conform.setup({
    formatters_by_ft = {
      lua = { "stylua" },
      javascript = { "prettierd" }
    },
    format_on_save = {
      lsp_fallback = true,
      async = false,
    }
  })

  vim.keymap.set({ "n", "v" }, "<leader>cf", conform.format)

  vim.g.stroiman_conform_setup = true;
end

vim.api.nvim_create_autocmd("User", {
  pattern = "LazyLoad",
  group = "stroiman_plugin_load",
  callback = function(ev)
    if ev.data == "conform" then
      setup_conform()
    end
  end
})

if vim.g.stroiman_conform_setup then
  setup_conform()
end
