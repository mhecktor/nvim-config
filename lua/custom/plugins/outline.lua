return {
	"hedyhli/outline.nvim",
	cmd = "Outline",
	event = "BufEnter",
	keys = {
		{ "<leader>o", "<cmd>Outline!<CR>", desc = "Toggle Outline" },
	},
	opts = function()
		local defaults = require("outline").defaults
		local opts = {
			symbols = {
				icons = {},
			},
		}
	end,
	-- config = function()
	-- 	-- Example mapping to toggle outline
	-- 	vim.keymap.set("n", "<leader>o", "<cmd>Outline<CR>", { desc = "Toggle Outline" })
	--
	-- 	require("outline").setup({
	-- 		-- Your setup opts here (leave empty to use defaults)
	-- 		preview_window = {
	-- 			auto_preview = false,
	-- 		},
	-- 	})
	--
	-- end,
}
