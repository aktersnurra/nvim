-- Adds LSP diagnostics and formatting.

local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = false,
	sources = {
		diagnostics.cppcheck,
		diagnostics.flake8,
		diagnostics.golangci_lint,
		diagnostics.jsonlint,
		diagnostics.luacheck,
		diagnostics.shellcheck,
		diagnostics.yamllint,
		formatting.black.with({ extra_args = { "--fast" } }),
		formatting.clang_format,
		formatting.erlfmt,
		formatting.fourmolu,
		formatting.gofmt,
		formatting.goimports,
		formatting.nixfmt,
		formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
		formatting.rustfmt,
		formatting.shfmt,
		formatting.sqlformat,
		formatting.stylua,
		formatting.terraform_fmt,
	},
})
