local plugin_dir = "plugins"
local config_path = vim.fn.stdpath("config")
local lua_path = config_path .. "/lua"
local plugin_pattern = lua_path .. "/" .. plugin_dir .. "/*.lua"
local should_sync_on_reload = false

if not vim.g.stroiman_lazy_loaded then
  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
  if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable", -- latest stable release
      lazypath,
    })
  end
  vim.opt.rtp:prepend(lazypath)

  require("lazy").setup(plugin_dir, {
    ui = {
      border = "rounded",
    },
    change_detection = {
      enabled = true,
      notify = false,
    },
  })
  vim.g.stroiman_lazy_loaded = true
end

local group = vim.api.nvim_create_augroup("stroiman_lazy_events", {})

vim.api.nvim_create_autocmd("BufWritePre", {
  group = group,
  pattern = plugin_pattern,
  callback = function()
    should_sync_on_reload = true
  end,
})

vim.api.nvim_create_autocmd("User", {
  pattern = "LazyReload",
  group = group,
  callback = function()
    if should_sync_on_reload then
      vim.cmd("Lazy sync")
      should_sync_on_reload = true
    end
  end,
})

local reload_plugin = function()
  local path = vim.fn.expand("%:t:r")
  vim.cmd("Lazy reload " .. path)
end

vim.keymap.set("n", "<leader>vr", reload_plugin)
vim.keymap.set("n", "<leader>vp", ":Lazy<cr>")
