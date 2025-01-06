-- disable by default
vim.g.copilot_filetypes = {
	["*"] = false,
}
-- explicitly request for copilot suggestions on Ctrl-Enter
vim.keymap.set("i", "<C-CR>", "<Plug>(copilot-suggest)")
return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				suggestion = { enabled = true },
				panel = { enabled = false },
				filetypes = {
					["."] = true,
				},
				server_opts_overrides = {
					settings = {
						advanced = {
							listCount = 10,
							inlineSuggestCount = 3,
						},
					},
				},

				copilot_node_command = "/Users/mhecktor/.nvm/versions/node/v22.4.1/bin/node", -- Node.js version must be > 18.x
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
