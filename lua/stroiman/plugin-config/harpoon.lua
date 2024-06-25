local setup_harpoon = function()
  local harpoon = require("harpoon")
  harpoon:setup()

  vim.keymap.set("n", '<leader>hm', function() harpoon:list():add() end)
  vim.keymap.set("n", '<leader>hq', function()
    harpoon.ui:toggle_quick_menu(harpoon:list())
  end)
  vim.keymap.set("n", '<leader>hn', function() harpoon:list():next() end)
  vim.keymap.set("n", '<leader>hp', function() harpoon:list():prev() end)

  vim.g.stroiman_harpoon_setup = true;
end

vim.api.nvim_create_autocmd("User", {
  pattern = "LazyLoad",
  group = "stroiman_plugin_load",
  callback = function(ev)
    if ev.data == "harpoon" then
      setup_harpoon()
    end
  end
})

if vim.g.stroiman_harpoon_setup then
  setup_harpoon()
end
