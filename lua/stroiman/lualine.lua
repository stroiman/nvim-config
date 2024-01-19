require("lualine").setup {
  options = {
    theme = 'auto',
    icons_enabled = true,
    -- component_separators = '|',
    -- section_separators = '',
  },
  sections = {
    lualine_a = {
      {
        'filename',
        path = 1
      }
    }
  }
}
