local setup_neotest = function()
  -- require("coverage").setup({
  --   opts = {
  --     auto_reload = true,
  --     lang = {
  --       go = {
  --         coverage_file = vim.fn.getcwd() .. "/coverage.out",
  --       },
  --     },
  --   },
  -- })
  local nt = require("neotest")

  nt.setup({
    summary = { mappings = {
      jumpto = { "i", "<cr>" },
    } },
    adapters = {
      require("neotest-golang")({
        go_test_args = {
          "-v",
          "-count=1",
          "-vet=off",
          -- "-coverprofile=" .. vim.fn.getcwd() .. "/coverage.out",
        },
        runner = "gotestsum",
        testify_enabled = true,
      }),
    },
  })

  vim.g.stroiman_neotest_setup = true

  vim.keymap.set("n", "<leader>tr", function()
    nt.run.run()
  end)
  vim.keymap.set("n", "<leader>tw", function()
    nt.watch.watch()
  end)
  vim.keymap.set("n", "<leader>ts", function()
    nt.summary.toggle()
  end)
  vim.keymap.set("n", "<leader>to", function() -- Test Off
    nt.watch.stop()
  end)
end

vim.api.nvim_create_autocmd("User", {
  pattern = "LazyLoad",
  group = "stroiman_plugin_load",
  callback = function(ev)
    if ev.data == "neotest" then
      setup_neotest()
    end
  end,
})

if vim.g.stroiman_neotest_setup then
  setup_neotest()
end
