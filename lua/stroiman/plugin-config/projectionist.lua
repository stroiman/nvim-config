vim.g.projectionist_heuristics = {
  ["init.lua"] = {
    ["lua/plugins/*.lua"] = {
      alternate = "lua/stroiman/plugin-config/{}.lua",
    },
    ["lua/stroiman/plugin-config/*.lua"] = {
      alternate = "lua/plugins/{}.lua",
    },
  },
  ["package.json&tsconfig.json"] = {
    ["src/*.ts"] = {
      command = "src",
      alternate = { "test/{}.test.ts" },
    },
    ["test/*.test.ts"] = {
      command = "test",
      alternate = "src/{}.ts",
    },
  },
  ["package.json"] = {
    ["src/*.js"] = {
      command = "src",
      alternate = { "test/{}.test.js" },
    },
    ["test/*.test.js"] = {
      command = "test",
      alternate = "src/{}.js",
    },
  },
  ["next.config.*"] = {
    ["app/i18n/locales/en/*.json"] = {
      command = "en",
      alternate = {
        "app/i18n/locales/da/{}.json",
      },
    },
    ["app/i18n/locales/da/*.json"] = {
      command = "da",
      alternate = {
        "app/i18n/locales/en/{}.json",
      },
    },
  },
}
