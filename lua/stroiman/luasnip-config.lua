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

  ls.add_snippets("javascript", {
    s("req", fmt('const {} = require ("{}");', {i(1), rep(1)} )),
    s("import", fmt('import {} from "{}";', {i(1), rep(1)} ))
  })
  ls.add_snippets("typescript", {
    ls.parser.parse_snippet("faketimers", "let clock: sinon.SinonFakeTimers\n\nbeforeEach(() => {\n  clock = sinon.useFakeTimers();\n})\n\nafterEach(() => {\n  clock.restore()\n})\n")
  })
  ls.filetype_extend("typescript", {"javascript"})
  ls.add_snippets("react", {
    ls.parser.parse_snippet("h1", '<h1>\n  $0\n</h1>'),
    ls.parser.parse_snippet("h2", '<h2>\n  $0\n</h2>'),
    ls.parser.parse_snippet("h3", '<h3>\n  $0\n</h3>'),
    ls.parser.parse_snippet("h4", '<h4>\n  $0\n</h4>'),
    ls.parser.parse_snippet("h5", '<h5>\n  $0\n</h5>'),
    ls.parser.parse_snippet("h6", '<h6>\n  $0\n</h6>'),
    ls.parser.parse_snippet("h7", '<h7>\n  $0\n</h7>'),
    ls.parser.parse_snippet("dc", '<div className="$1">\n  $0\n</div>'),
    ls.parser.parse_snippet("d", '<div>\n  $0\n</div>'),
  })
  ls.add_snippets("typescriptreact", {
  })
  ls.filetype_extend("typescriptreact", {"typescript"})
end

