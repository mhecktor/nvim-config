local keymap_options = require("utils.core").keymap_options

return { -- Linting
	"mfussenegger/nvim-lint",
	enabled = true,
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")
		lint.linters_by_ft = {
			markdown = { "markdownlint" },
		}

		-- To allow other plugins to add linters to require('lint').linters_by_ft,
		-- instead set linters_by_ft like this:
		-- lint.linters_by_ft = lint.linters_by_ft or {}
		-- lint.linters_by_ft['markdown'] = { 'markdownlint' }
		--
		-- However, note that this will enable a set of default linters,
		-- which will cause errors unless these tools are available:
		-- {
		--   clojure = { "clj-kondo" },
		--   dockerfile = { "hadolint" },
		--   inko = { "inko" },
		--   janet = { "janet" },
		--   json = { "jsonlint" },
		--   markdown = { "vale" },
		--   rst = { "vale" },
		--   ruby = { "ruby" },
		--   terraform = { "tflint" },
		--   text = { "vale" }
		-- }
		--
		-- You can disable the default linters by setting their filetypes to nil:
		-- lint.linters_by_ft['clojure'] = nil
		-- lint.linters_by_ft['dockerfile'] = nil
		-- lint.linters_by_ft['inko'] = nil
		-- lint.linters_by_ft['janet'] = nil
		-- lint.linters_by_ft['json'] = nil
		-- lint.linters_by_ft['markdown'] = nil
		-- lint.linters_by_ft['rst'] = nil
		-- lint.linters_by_ft['ruby'] = nil
		-- lint.linters_by_ft['terraform'] = nil
		-- lint.linters_by_ft['text'] = nil
		lint.linters_by_ft["typescript"] = { "eslint", "deno" }
		lint.linters_by_ft["lua"] = { "luacheck" }

		lint.linters.luacheck = {
			name = "luacheck",
			cmd = "luacheck",
			stdin = true,
			args = {
				"--globals",
				"vim",
				"lvim",
				"reload",
				"--",
			},
			stream = "stdout",
			ignore_exitcode = true,
			parser = require("lint.parser").from_errorformat("%f:%l:%c: %m", {
				source = "luacheck",
			}),
		}

		-- javascript, javascriptreact, javascript.jsx, typescript, typescriptreact, typescript.tsx
		-- Create autocommand which carries out the actual linting
		-- on the specified events.
		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				if pcall(function()
					lint.try_lint()
				end) then
					print()
				else
					print("Failed to lint!")
				end
			end,
		})

		vim.keymap.set("n", "<leader>l", function()
			lint.try_lint()
		end, keymap_options({ desc = "Trigger linting for current buffer" }))
	end,
}
