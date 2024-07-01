local setup_which_key = function()
  print("Configure which key")
  require("which-key").setup()

  -- Document existing key chains
  require("which-key").register({
    ["<leader>v"] = { name = "[V]im configuration", _ = "which_key_ignore" },
    -- ["<leader>s"] = { name = "[S]earch", _ = "which_key_ignore" },
    -- ["<leader>d"] = { name = "[D]ocument", _ = "which_key_ignore" },
    -- ["<leader>r"] = { name = "[R]ename", _ = "which_key_ignore" },
    -- ["<leader>s"] = { name = "[S]earch", _ = "which_key_ignore" },
    -- ["<leader>w"] = { name = "[W]orkspace", _ = "which_key_ignore" },
    -- ["<leader>t"] = { name = "[T]oggle", _ = "which_key_ignore" },
    -- ["<leader>h"] = { name = "Git [H]unk", _ = "which_key_ignore" },
  })
  -- visual mode
  -- require("which-key").register({
  --   ["<leader>h"] = { "Git [H]unk" },
  -- }, { mode = "v" })

  vim.g.stroiman_which_key_setup = true
end

vim.api.nvim_create_autocmd("User", {
  pattern = "LazyLoad",
  group = "stroiman_plugin_load",
  callback = function(ev)
    if ev.data == "which-key" then
      setup_which_key()
    end
  end,
})

if vim.g.stroiman_which_key_setup then
  setup_which_key()
end
