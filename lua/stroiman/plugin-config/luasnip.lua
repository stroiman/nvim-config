local setup_luasnip = function()
  local ls = require("luasnip")
  local types = require("luasnip.util.types")

  ls.config.set_config({
    history = true,
    updateevents = "TextChanged,TextChangedI",
    enable_autosnippets = true,
    ext_opts = {
      [types.choiceNode] = {
        active = {
          virt_text = { { "<-", "Error" } },
        },
      },
    },
  })

  require("luasnip.loaders.from_lua").load()


  vim.keymap.set("i", "\\ss", function()
    if ls.expand_or_jumpable() then
      ls.expand_or_jump()
    end
  end)
  vim.keymap.set({ "i", "s" }, "<C-k>", function()
    if ls.expand_or_jumpable() then
      ls.expand_or_jump()
    end
  end)

  vim.keymap.set({ "i", "s" }, "<C-j>", function()
    if ls.jumpable(-1) then
      ls.jump(-1)
    end
  end, { silent = true })

  vim.keymap.set({ "i", "s" }, "<C-l>", function()
    if ls.choice_active() then
      ls.change_choice(1)
    end
  end, { silent = true })

  vim.keymap.set("i", "<C-n>", "<Plug>luasnip-next-choice", {})
  vim.keymap.set("s", "<C-n>", "<Plug>luasnip-next-choice", {})
  vim.keymap.set("i", "<C-p>", "<Plug>luasnip-prev-choice", {})
  vim.keymap.set("s", "<C-p>", "<Plug>luasnip-prev-choice", {})
  vim.keymap.set("n", "<leader><leader>se", function()
    require("luasnip.loaders").edit_snippet_files({
      edit = function(file)
        vim.cmd.tabnew(file)
      end,
    })
  end)

  vim.g.stroiman_luasnip_loaded = true
end

vim.api.nvim_create_autocmd("User", {
  pattern = "LuasnipPreExpand",
  group = vim.api.nvim_create_augroup("stroiman_luasnip", {}),
  callback = function()
    vim.cmd([[let &undolevels = &undolevels]])
  end,
})

vim.api.nvim_create_autocmd("User", {
  pattern = "LazyLoad",
  group = "stroiman_plugin_load",
  callback = function(ev)
    if ev.data == "luasnip" then
      setup_luasnip()
    end
  end,
})

if vim.g.stroiman_luasnip_loaded then
  setup_luasnip()
end
