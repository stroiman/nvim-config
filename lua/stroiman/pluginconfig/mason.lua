local ok, mason = pcall(require, 'mason')
if ok then 
  mason.setup({})
end

local ok2, masonLspConfig = pcall(require, 'mason-lspconfig')
if ok2 then
  masonLspConfig.setup({
    ensure_installed = {
      'lua_ls'
    }
  })
end
