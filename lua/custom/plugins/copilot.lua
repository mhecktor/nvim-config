-- disable by default
-- vim.g.copilot_filetypes = {
-- 	["*"] = false,
-- }
--
return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		opts = {
			suggestion = {
				-- enabled = true,
				auto_trigger = true,
				-- Use alt to interact with Copilot
				keymap = {
					-- Disable the built-in mapping, we'll configure it in nvim-cmp
					accept = false,
					accept_word = "<C-c>w",
					accept_line = "<C-c>l",
					next = "<C-c>n",
					prev = "<C-c>p",
					dismiss = "/",
					enabled = true,
				},
			},
		},
		config = function(_, opts)
			local cmp = require("cmp")
			local copilot = require("copilot.suggestion")
			local luasnip = require("luasnip")

			require("copilot").setup(opts)

			local function set_trigger(trigger)
				vim.b.copilot_suggestion_auto_trigger = trigger
				vim.b.copilot_suggestion_hidden = not trigger
			end

			-- Hide suggestions when the completion menu is open-- Hide suggestions when the completion menu is open
			cmp.event:on("menu_opened", function()
				if copilot.is_visible() then
					copilot.dismiss()
				end
				set_trigger(false)
			end)

			-- Disable suggestions when inside a snippet
			cmp.event:on("menu_closed", function()
				set_trigger(not luasnip.expand_or_locally_jumpable())
			end)
			vim.api.nvim_create_autocmd("User", {
				pattern = { "LuasnipInsertNodeEnter", "LuasnipInsertNodeLeave" },
				callback = function()
					set_trigger(not luasnip.expand_or_locally_jumpable())
				end,
			})
		end,
	},
	{
		"zbirenbaum/copilot-cmp",
		config = function()
			require("copilot_cmp").setup({})
		end,
	},
}
