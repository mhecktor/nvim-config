-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
	"nvim-neo-tree/neo-tree.nvim",
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	cmd = "Neotree",
	keys = {
		{ "\\", ":Neotree reveal<CR>", { desc = "NeoTree reveal" } },
	},
	opts = {
		open_files_do_not_replace_types = { "terminal", "Trouble", "qf", "edgy", "Outline", "spectre_panel" },
		buffers = {
			follow_current_file = {
				enabled = true,
			},
		},
		filesystem = {
			window = {
				mappings = {
					["\\"] = "close_window",
					["K"] = { "toggle_preview", config = { use_float = true, use_image_nvim = true } },
				},
			},
		},
		follow_current_file = {
			enable = true,
			leave_dirs_open = true,
		},
		enable_git_status = true,
		enable_diagnostics = true,
	},
}
