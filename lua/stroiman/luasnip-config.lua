local ok, ls = pcall(require, "luasnip")
if ok then
  local types = require("luasnip.util.types")

  -- require("ls.loaders.from_snipmate").load({ paths = '/Users/peter/.config/nvim/my_snippets' })
  -- require("ls.loaders.from_vscode").load()

  require("luasnip.loaders.from_vscode").lazy_load({ paths = "/Users/peter/.config/nvim/my_snippets" })
  vim.cmd('command! LuaSnipEdit :lua require("ls.loaders").edit_snippet_files()')

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

  vim.keymap.set({ "i", "s" }, "<C-k>", function()
    if ls.expand_or_jumpable() then
      ls.expand_or_jump()
    end
  end, { silent = true })

  vim.keymap.set({ "i", "s" }, "<C-j>", function()
    if ls.jumpable(-1) then
      ls.jump(-1)
    end
  end, { silent = true })

  -- vim.keymap.set("i", "<C-n>", "<Plug>luasnip-next-choice", {})
  -- vim.keymap.set("s", "<C-n>", "<Plug>luasnip-next-choice", {})
  -- vim.keymap.set("i", "<C-p>", "<Plug>luasnip-prev-choice", {})
  -- vim.keymap.set("s", "<C-p>", "<Plug>luasnip-prev-choice", {})

  local s = ls.s;
  local i = ls.insert_node;
  local rep = require("luasnip.extras").rep
  local fmt = require("luasnip.extras.fmt").fmt

  ls.add_snippets("all", {
    ls.parser.parse_snippet("expand", "--this is what was expanded!"),
  })
  ls.add_snippets("javascript", {
    s("req", fmt('const {} = require ("{}");', {i(1), rep(1)} ))
  })
  ls.add_snippets("typescript", {
    s("import", fmt('import {} from "{}";', {i(1), rep(1)} ))
  })
  ls.add_snippets("typescriptreact", {
    ls.parser.parse_snippet("dc", '<div className="$1">\n  $0\n</div>'),
    ls.parser.parse_snippet("d", '<div>\n  $0\n</div>'),
  })
end

