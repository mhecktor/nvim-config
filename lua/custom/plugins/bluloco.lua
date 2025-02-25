return {
	"uloco/bluloco.nvim",
	lazy = false,
	priority = 1000,
	dependencies = { "rktjmp/lush.nvim" },
	init = function()
		vim.opt.termguicolors = true
		vim.cmd.colorscheme("bluloco")
	end,

	config = function()
		-- your optional config goes here, see below.
		require("bluloco").setup({
			transparent = false,
			italics = true,
			style = "auto",
		})
	end,
}
