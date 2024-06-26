local setup_lspconfig = function()
  require("mason").setup({})
  require("mason-lspconfig").setup({
    automatic_installation = true,
  })
  local lspconfig = require("lspconfig")
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  local lsp_default_capabilities = require("cmp_nvim_lsp").default_capabilities()

  capabilities = vim.tbl_deep_extend("force", capabilities, lsp_default_capabilities)
  lspconfig.tsserver.setup({
    capabilities,
    settings = {
      javascript = {
        inlayHints = {
          includeInlayParameterNameHints = "all",
          includeInlayParameterNameHintsWhenArgumentMatchesName = true,
          includeInlayFunctionParameterTypeHints = true,
          includeInlayVariableTypeHints = true,
          includeInlayVariableTypeHintsWhenTypeMatchesName = true,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayEnumMemberValueHints = true,
        },
      },
      typescript = {
        inlayHints = {
          includeInlayParameterNameHints = "all",
          includeInlayParameterNameHintsWhenArgumentMatchesName = true,
          includeInlayFunctionParameterTypeHints = true,
          includeInlayVariableTypeHints = true,
          includeInlayVariableTypeHintsWhenTypeMatchesName = true,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayEnumMemberValueHints = true,
        },
      },
    },
  })
  lspconfig.lua_ls.setup({
    settings = {
      Lua = {
        runtime = { version = "LuaJIT" },
        hint = { enable = true },
        workspace = {
          checkThirdParty = false,
          library = {
            "${3rd}/luv/library",
            ---@diagnostic disable-next-line: deprecated
            unpack(vim.api.nvim_get_runtime_file("", true)),
          },
        },
        completion = {
          callSnippet = "Replace",
        },
      },
    },
  })
  -- lspconfig.ocamllsp.setup({ capabilities })

  vim.g.stroiman_lsp_loaded = true
end

vim.api.nvim_create_autocmd("User", {
  pattern = "LazyLoad",
  group = "stroiman_plugin_load",
  callback = function(ev)
    if ev.data == "lsp-config" then
      setup_lspconfig()
    end
  end,
})

-- vim.keymap.set("n", "<leader>vm", setup_lspconfig)
vim.api.nvim_create_user_command("RestartLspConfig", setup_lspconfig, {})

vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.diagnostic.config({
  virtual_text = false,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "", -- '🛑', -- '',
      [vim.diagnostic.severity.WARN] = "", -- '', -- '',
      [vim.diagnostic.severity.INFO] = "", -- '', -- '', -- '',
      [vim.diagnostic.severity.HINT] = "…", -- '❔' , '' --''
    },
  },
  float = { border = "rounded" },
  underline = { min = vim.diagnostic.severity.ERROR },
})
vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action)
-- vim.keymap.set("n", "<leader>cr", function()
--   vim.lsp.buf.code_action({ only = "refactor" })
-- end)
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)
vim.cmd([[
augroup stroiman_lsp_config
  au!
  autocmd CursorHold  <buffer> lua vim.lsp.buf.document_highlight()
  autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()
  autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
  autocmd BufWritePre *.js,*.ts lua vim.lsp.buf.format()
  autocmd BufWritePre *.lua lua vim.lsp.buf.format()
augroup end
]])

vim.api.nvim_create_autocmd("LspAttach", {
  group = "stroiman_lsp_config",
  callback = function(event)
    local map = function(keys, func, description)
      local desc = nil
      if description ~= nil then
        desc = "LSP: " .. description
      end
      vim.keymap.set("n", keys, func, { buffer = event.buf, desc })
    end

    -- map('<leader>cr', vim.lsp.buf.rename)
    map("gd", vim.lsp.buf.definition)
    -- map("gr", vim.lsp.buf.references)
    map("<leader>cr", function()
      vim.lsp.buf.code_action({ only = "refactor" })
    end)
    map("<leader>clc", function()
      vim.lsp.buf.clear(event.client_id, event.buf)
    end)
    -- map('<leader>cld', function()
    --   print("Lenslens")
    --   local lenses = vim.lsp.codelens.get(event.buf)
    --   print("Lenses" .. vim.inspect(lenses))
    --   if #lenses > 0 then
    --     vim.lsp.codelens.display(
    --       lenses,
    --       event.buf,
    --       event.client_id
    --     )
    --   end
    -- end)
    map("<leader>ch", function()
      ---@diagnostic disable-next-line: missing-parameter
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
    end)

    -- vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
    --   buffer = event.buf,
    --   group = "stroiman_lsp_config",
    --   callback = function()
    --     vim.lsp.codelens.refresh({ bufnr = event.buf })
    --   end
    -- })
  end,
})

local border = "rounded"
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border })
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border })

if vim.g.stroiman_lsp_loaded then
  setup_lspconfig()
end
