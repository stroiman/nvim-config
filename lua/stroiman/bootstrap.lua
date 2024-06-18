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

  require("lazy").setup("plugins")
  vim.g.stroiman_lazy_loaded = true
end

local group = vim.api.nvim_create_augroup("stroiman_lazy_events", {});
vim.api.nvim_create_autocmd("User", {
  pattern = "LazyReload",
  group = group,
  callback = function()
    vim.cmd("Lazy sync")
  end
})

function reload_buffer() 
  local path = vim.fn.expand "%:t:r"
  vim.cmd ("Lazy reload " .. path)
end

vim.keymap.set("n", "<leader>vr", reload_buffer)
vim.keymap.set("n", "<leader>vl", ":Lazy<cr>")
