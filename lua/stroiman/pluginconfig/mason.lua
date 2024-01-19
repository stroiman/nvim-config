local ok, mason = pcall(require, 'mason-lspconfig')
if ok then
  mason.setup({
    ensure_installed = {
      'lua_ls'
    }
  })
end
