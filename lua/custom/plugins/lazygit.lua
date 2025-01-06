return {
	"kdheepak/lazygit.nvim",
	cmd = {
		"LazyGit",
		"LazyGitConfig",
		"LazyGitCurrentFile",
		"LazyGitFilter",
		"LazyGitFilterCurrentFile",
	},
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = {
		{ "<leader>tgg", "<cmd>LazyGit <CR>", desc = "LazyGit" },
		{ "<leader>tgf", "<cmd>LazyGitCurrentFile <CR>", desc = "LazyGit Current File" },
		{ "<leader>tgc", "<cmd>LazyGitConfig <CR>", desc = "LazyGit Config" },
		{ "<leader>tgf", "<cmd>LazyGitFilter <CR>", desc = "LazyGit Filter" },
		{ "<leader>tgc", "<cmd>LazyGitFilterCurrentFile <CR>", desc = "LazyGit Filter Current File" },
	},
}
