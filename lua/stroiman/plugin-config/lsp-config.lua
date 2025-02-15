local stroiman_lsp_config = vim.api.nvim_create_augroup("stroiman_lsp_config", {})

local setup_lspconfig = function()
  local lspconfig = require("lspconfig")
  local client_capabilities = vim.lsp.protocol.make_client_capabilities()
  local cmp_nvim_capabilities = require("cmp_nvim_lsp").default_capabilities()
  local capabilities = vim.tbl_deep_extend("force", client_capabilities, cmp_nvim_capabilities)

  require("mason").setup({})
  require("mason-lspconfig").setup({
    ensure_installed = {
      "lua_ls",
      "ts_ls",
    },
    automatic_installation = false,
    handlers = {
      function(server_name)
        require("lspconfig")[server_name].setup({ capabilities })
      end,
      ["ts_ls"] = function()
        require("stroiman.lsp-config.tsserver").setup({ capabilities })
      end,
      ["lua_ls"] = function()
        require("stroiman.lsp-config.lua_ls").setup({ capabilities })
      end,
      ["htmx"] = function()
        lspconfig.htmx.setup({
          capabilities,
          -- filetypes = { "html", "pug" },
        })
      end,
    },
  })
  require("lspconfig").ocamllsp.setup({ capabilities })

  require("mason-tool-installer").setup({
    ensure_installed = {
      "eslint_d",
      "prettierd",
      "stylua",
      "pylint",
      "black",
    },
    run_on_start = true,
  })

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

vim.api.nvim_create_autocmd("LspAttach", {
  group = stroiman_lsp_config,
  callback = function(event)
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    local map = function(keys, func, description)
      local desc = nil
      if description ~= nil then
        desc = "LSP: " .. description
      end
      vim.keymap.set("n", keys, func, { buffer = event.buf, desc })
    end

    map("<leader>cr", vim.lsp.buf.rename)
    map("gd", vim.lsp.buf.definition)
    map("gr", vim.lsp.buf.references)
    -- map("<leader>cr", function()
    --   vim.lsp.buf.code_action({ only = "refactor" })
    -- end)
    map("<leader>clc", function()
      vim.lsp.buf.clear(event.client_id, event.buf)
    end)
    --
    if client.supports_method("textDocument/documentHighlight") then
      vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
        group = stroiman_lsp_config,
        buffer = event.buf,
        callback = function()
          vim.lsp.buf.document_highlight()
        end,
      })
      vim.api.nvim_create_autocmd({ "CursorMoved" }, {
        group = stroiman_lsp_config,
        buffer = event.buf,
        callback = function()
          vim.lsp.buf.clear_references()
        end,
      })
    end
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
    --   group = stroiman_lsp_config,
    --   callback = function()
    --     vim.lsp.codelens.refresh({ bufnr = event.buf })
    --   end
    -- })
  end,
})

local border = "rounded"
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border })
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border })

if vim.g.stroiman_lsp_loaded then
  setup_lspconfig()
end
