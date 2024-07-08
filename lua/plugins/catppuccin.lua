return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  opts = {
    transparent_background = true,
    custom_highlights = function(colors)
      return {
        LineNr = { fg = "#707070" },
        -- Comment = { fg = colors.flamingo },
        -- TabLineSel = { bg = colors.pink },
        -- CmpBorder = { fg = colors.surface2 },
        -- Pmenu = { bg = colors.none },
      }
    end,
  },
  priority = 1000,
}
