return {
	{ -- Autoformat
		"stevearc/conform.nvim",
		lazy = false,
		keys = {
			{
				"<leader>f",
				function()
					require("conform").format({ async = true, lsp_fallback = true })
				end,
				mode = "",
				desc = "[F]ormat buffer",
			},
		},
		opts = {
			notify_on_error = true,
			format_on_save = function(bufnr)
				-- Disable "format_on_save lsp_fallback" for languages that don't
				-- have a well standardized coding style. You can add additional
				-- languages here or re-enable it for the disabled ones.
				local disable_filetypes = { c = true, cpp = true }
				return {
					timeout_ms = 500,
					lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
				}
			end,
			formatters_by_ft = {
				lua = { "stylua" },
				vue = { "prettierd", "prettier" },
				go = { "gofmt", "gofumpt" },
				-- Conform can also run multiple formatters sequentially
				-- python = { "isort", "black" },
				--
				-- You can use a sub-list to tell conform to run *until* a formatter
				-- is found.
				html = { "htmlbeautifier", "prettierd" },
				-- javascript = { "prettierd", "prettier" },
				-- typescriptreact = { "prettierd", "prettier", "eslint" },
				rust = { "rustfmt", lsp_format = "fallback" },
				sql = { "pg_format", "sqlfluff" },
			},
		},
	},
}
-- vim: ts=2 sts=2 sw=2 et
