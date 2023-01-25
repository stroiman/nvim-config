-- Learn the keybindings, see :help lsp-zero-keybindings
-- Learn to configure LSP servers, see :help lsp-zero-api-showcase
local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.ensure_installed({
  'tsserver',
  'eslint',
})

lsp.on_attach(function(_, bufnr)
    -- vim.cmd("command! LspDef lua vim.lsp.buf.definition()")
    vim.cmd("command! LspFormatting lua vim.lsp.buf.formatting()")
    vim.cmd("command! LspCodeAction lua vim.lsp.buf.code_action()")
    vim.cmd("command! LspHover lua vim.lsp.buf.hover()")
    vim.cmd("command! LspRename lua vim.lsp.buf.rename()")
    vim.cmd("command! LspRefs lua vim.lsp.buf.references()")
    vim.cmd("command! LspTypeDef lua vim.lsp.buf.type_definition()")
    vim.cmd("command! LspImplementation lua vim.lsp.buf.implementation()")
    vim.cmd("command! LspDiagPrev lua vim.lsp.diagnostic.goto_prev()")
    vim.cmd("command! LspDiagNext lua vim.lsp.diagnostic.goto_next()")
    vim.cmd("command! LspDiagLine lua vim.lsp.diagnostic.show_line_diagnostics()")
    vim.cmd("command! LspSignatureHelp lua vim.lsp.buf.signature_help()")    

  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  -- buf_map(bufnr, "n", "gd", ":LspDef<CR>")
  nmap("gy", ":LspTypeDef<CR>")
  nmap("K", ":LspHover<CR>")
  nmap("[a", ":LspDiagPrev<CR>")
  nmap("]a", ":LspDiagNext<CR>")
  nmap("ga", ":LspCodeAction<CR>")
  nmap("<Leader>a", ":LspDiagLine<CR>")
  nmap("<C-x><C-x>", "<cmd> LspSignatureHelp<CR>")

  nmap("<leader>rr", ":LspRename<CR>, '[R]efactor [R]ename")
  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  -- nmap('K', vim.lsp.buf.type_definition, 'Type [D]efinition')
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
end)

lsp.nvim_workspace()

lsp.setup()
