return {
	"nvim-pack/nvim-spectre",
	config = function()
		require("spectre").setup({
			color_devicons = true,
			line_sep_start = "┌-----------------------------------------",
			result_padding = "¦  ",
			line_sep = "└-----------------------------------------",
			folder_icon = "",
			hide_cursor = true,
		})
	end,
	keys = {
		{
			"<leader>sR",
			'<cmd>lua require("spectre").toggle()<cr>',
			desc = "Toggle Spectre",
		},
	},
}
