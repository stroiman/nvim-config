local ok, null_ls = pcall(require, "null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

if ok then
	null_ls.setup({
		on_attach = function(client, bufnr)
			if client.supports_method("textDocument/formatting") then
				vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
				vim.api.nvim_create_autocmd("BufWritePre", {
					group = augroup,
					buffer = bufnr,
					callback = function()
						vim.lsp.buf.format()
					end,
				})
			end
		end,
		sources = {
			null_ls.builtins.formatting.stylua,
			null_ls.builtins.formatting.ocamlformat,
			null_ls.builtins.formatting.prettierd,
			-- null_ls.builtins.diagnostics.eslint_d,
		},
	})

	vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
end
