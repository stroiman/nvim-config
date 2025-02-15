local setup_obsidian = function()
  require("obsidian").setup({
    workspaces = {
      {
        name = "vault",
        path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/Vault",
      },
      {
        name = "games",
        path = "~/Documents/Knowledge graphs/Games",
      },
    },
    daily_notes = {
      -- Optional, if you keep daily notes in a separate directory.
      folder = "20 Journal",
      -- Optional, if you want to change the date format for the ID of daily notes.
      -- date_format = "%Y-%m-%d",
      -- Optional, if you want to change the date format of the default alias of daily notes.
      -- alias_format = "%B %-d, %Y",
      -- Optional, default tags to add to each new daily note created.
      -- default_tags = { "daily-notes" },
      -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
      -- template = nil
    },
    disable_frontmatter = true,

    -- see below for full list of options 👇
  })

  vim.g.stroiman_obsidian_setup = true
end

vim.api.nvim_create_autocmd("User", {
  pattern = "LazyLoad",
  group = "stroiman_plugin_load",
  callback = function(ev)
    if ev.data == "obsidian" then
      setup_obsidian()
    end
  end,
})

if vim.g.stroiman_obsidian_setup then
end
setup_obsidian()
