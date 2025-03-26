local setup_gruvbox = function()
  -- Default options:
  require("gruvbox").setup({
    -- terminal_colors = true, -- add neovim terminal colors
    -- undercurl = true,
    -- underline = true,
    -- bold = true,
    -- italic = {
    --   strings = true,
    --   emphasis = true,
    --   comments = true,
    --   operators = false,
    --   folds = true,
    -- },
    -- strikethrough = true,
    -- invert_selection = false,
    -- invert_signs = false,
    -- invert_tabline = false,
    -- invert_intend_guides = false,
    -- inverse = true, -- invert background for search, diffs, statuslines and errors
    contrast = "hard", -- can be "hard", "soft" or empty string
    -- palette_overrides = {},
    -- overrides = {},
    -- dim_inactive = false,
    transparent_mode = false,
  })
  -- vim.cmd("colorscheme gruvbox")

  vim.g.stroiman_gruvbox_setup = true
end

vim.api.nvim_create_autocmd("User", {
  pattern = "LazyLoad",
  group = "stroiman_plugin_load",
  callback = function(ev)
    if ev.data == "gruvbox" then
      setup_gruvbox()
    end
  end,
})

if vim.g.stroiman_gruvbox_setup then
  setup_gruvbox()
end
