-- Learn the keybindings, see :help lsp-zero-keybindings
-- Learn to configure LSP servers, see :help lsp-zero-api-showcase
local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.ensure_installed({
  'tsserver',
  'eslint',
})
local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<tab>'] = cmp.mapping.confirm({ select = true }),
  ['<C-Space>'] = cmp.mapping.complete(),
})


lsp.on_attach(function(_, bufnr)
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
end)

lsp.nvim_workspace()

lsp.setup()
