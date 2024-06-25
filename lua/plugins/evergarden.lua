return {
  'comfysage/evergarden',
  priority = 1000,
  opts = {
    transparent_background = true,
    contrast_dark = 'medium', -- 'hard'|'medium'|'soft'
    overrides = {},           -- add custom overrides
  },
  config = function()
    require("stroiman.plugin-config.evergarden")
  end
}
