return {
	"akinsho/toggleterm.nvim",
	cmd = { "ToggleTerm", "TermExec" },
	build = ":ToggleTerm",
	keys = {
		{ "<leader>tt", "<cmd>ToggleTerm <CR>", desc = "Toggle Terminal" },
		{ "<leader>tf", "<cmd>ToggleTerm direction=float<CR>", desc = "Toggle Terminal" },
	},
	opts = {
		size = 10,
		float_opts = {
			border = "curved",
		},
	},
}
