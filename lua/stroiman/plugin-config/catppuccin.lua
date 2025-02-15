local setup_catppuccin = function()
  local catppuccin = require("catppuccin")
  catppuccin.setup({
    transparent_background = false,
    custom_highlights = function(colors)
      return {
        LineNr = { fg = "#707070" },
        -- Comment = { fg = colors.flamingo },
        -- TabLineSel = { bg = colors.pink },
        -- CmpBorder = { fg = colors.surface2 },
        -- Pmenu = { bg = colors.none },
      }
    end,
  })

  vim.cmd.colorscheme("catppuccin")

  vim.g.stroiman_catppuccin_setup = true
end

vim.api.nvim_create_autocmd("User", {
  pattern = "LazyLoad",
  group = "stroiman_plugin_load",
  callback = function(ev)
    if ev.data == "catppuccin" then
      setup_catppuccin()
    end
  end,
})

if vim.g.stroiman_catppuccin_setup then
  setup_catppuccin()
end
