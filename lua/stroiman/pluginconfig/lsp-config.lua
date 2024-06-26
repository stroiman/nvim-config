local ok, lspconfig = pcall(require, "lspconfig")
if ok then
	-- Specify how the border looks like
	local border = {
		{ "┌", "FloatBorder" },
		{ "─", "FloatBorder" },
		{ "┐", "FloatBorder" },
		{ "│", "FloatBorder" },
		{ "┘", "FloatBorder" },
		{ "─", "FloatBorder" },
		{ "└", "FloatBorder" },
		{ "│", "FloatBorder" },
	}

	-- Add the border on hover and on signature help popup window
	local handlers = {
		["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
		["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
	}

	-- Add border to the diagnostic popup window
	vim.diagnostic.config({
		virtual_text = {
			prefix = "■ ", -- Could be '●', '▎', 'x', '■', , 
		},
		float = { border = border },
	})

	-- Add the border (handlers) to the lua language server
	-- lspconfig.lua_ls.setup({
	--     handlers = handlers,
	--     -- The rest of the server configuration
	-- })
	--
	-- -- Add the border (handlers) to the pyright server
	-- lspconfig.pyright.setup({
	--     handlers = handlers,
	-- })

	local capabilities = require("cmp_nvim_lsp").default_capabilities()
	-- capabilities.handlers = handlers

	-- lspconfig.lua_ls.setup({
	--   capabilities=capabilities
	-- })

	lspconfig.tsserver.setup({
		capabilities = capabilities,
		init_options = {
			preferences = {
				disableSuggestions = true,
			},
		},
	})
	lspconfig.gopls.setup({
		capabilities = capabilities,
	})
	lspconfig.fsautocomplete.setup({})
	lspconfig.html.setup({
		capabilities = capabilities,
	})
	lspconfig.rescriptls.setup({
		capabilities = capabilities,
	})
	lspconfig.ocamllsp.setup({
		capabilities = capabilities,
		handlers = handlers,
	})
	-- lspconfig.rescript.setup({
	--   capabilities = capabilities,
	-- })
	-- lspconfig.marksman.setup({})

	-- lspconfig.rust_analyzer.setup {
	--   -- Server-specific settings. See `:help lspconfig-setup`
	--   settings = {
	--     ['rust-analyzer'] = {},
	--   },
	-- }

	-- Global mappings.
	-- See `:help vim.diagnostic.*` for documentation on any of the below functions

	vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
	vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
	vim.keymap.set("n", "[a", vim.diagnostic.goto_prev)
	vim.keymap.set("n", "]a", vim.diagnostic.goto_next)
	vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)
	vim.cmd("command! LspRename lua vim.lsp.buf.rename()")

	-- Use LspAttach autocommand to only map the following keys
	-- after the language server attaches to the current buffer
	vim.api.nvim_create_autocmd("LspAttach", {
		group = vim.api.nvim_create_augroup("UserLspConfig", {}),
		callback = function(ev)
			-- Enable completion triggered by <c-x><c-o>
			vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

			-- Buffer local mappings.
			-- See `:help vim.lsp.*` for documentation on any of the below functions
			local opts = { buffer = ev.buf }
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
			vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
			-- vim.keymap.set('n', 'K', vim.lsp.buf.signature_help, opts)
			vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
			vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
			vim.keymap.set("n", "<space>wl", function()
				print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
			end, opts)
			vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
			vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
			vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
			vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
			vim.keymap.set("n", "<space>f", function()
				vim.lsp.buf.format({ async = true })
			end, opts)
		end,
	})
end
