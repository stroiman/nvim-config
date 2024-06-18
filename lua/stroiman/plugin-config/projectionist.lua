vim.g.projectionist_heuristics = {
  ["init.lua"] = {
    ["lua/plugins/*.lua"] = {
      alternate = "lua/stroiman/plugin-config/{}.lua"
    },
    ["lua/stroiman/plugin-config/*.lua"] = {
      alternate = "lua/plugins/{}.lua"
    },
  }
}
