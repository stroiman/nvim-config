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

  -- ls.setup({
  --   snip_env = {
  --     s = function(...)
  --       local snip = ls.s(...)
  --       -- we can't just access the global `ls_file_snippets`, since it will be
  --       -- resolved in the environment of the scope in which it was defined.
  --       table.insert(getfenv(2).ls_file_snippets, snip)
  --     end,
  --
  --     parse = function(...)
  --       local snip = ls.parser.parse_snippet(...)
  --       table.insert(getfenv(2).ls_file_snippets, snip)
  --     end,
  --     -- remaining definitions.
  --   },
  -- })

  vim.keymap.set("i", "<C-n>", "<Plug>luasnip-next-choice", {})
  vim.keymap.set("s", "<C-n>", "<Plug>luasnip-next-choice", {})
  vim.keymap.set("i", "<C-p>", "<Plug>luasnip-prev-choice", {})
  vim.keymap.set("s", "<C-p>", "<Plug>luasnip-prev-choice", {})

  local s = ls.s
  local i = ls.insert_node
  local rep = require("luasnip.extras").rep
  local fmt = require("luasnip.extras.fmt").fmt

  vim.g.stroiman_luasnip_loaded = true
  vim.keymap.set("n", "<leader><leader>se", require("luasnip.loaders").edit_snippet_files)
end

vim.api.nvim_create_autocmd("User", {
  pattern = "LazyLoad",
  group = "stroiman_plugin_load",
  callback = function(ev)
    if ev.data == "luasnip" then
      setup_luasnip()
    end
  end
})


if vim.g.stroiman_luasnip_loaded then
  setup_luasnip()
end

vim.cmd [[
    command! LuaSnipEdit :lua require("luasnip.loaders").edit_snippet_files()
  ]]
