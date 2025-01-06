return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		-- "antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		"nvim-neotest/neotest-python",
		"rcasia/neotest-java",
		"rouge8/neotest-rust",
	},
	keys = {
		{
			"<leader>rtl",
			function()
				require("neotest").run.run_last()
			end,
			desc = "Run Last Test",
		},
		{
			"<leader>rtc",
			function()
				require("neotest").run.run(vim.fn.expand("%"))
			end,
			desc = "Run tests from current file",
		},
		{
			"<leader>rt",
			function()
				require("neotest").run.run()
			end,
			desc = "Run all tests",
		},
		{
			"<leader>rts",
			function()
				require("neotest").summary.open()
			end,
			desc = "Show test summary",
		},
		{
			"<leader>rto",
			function()
				require("neotest").output.open()
			end,
			desc = "Show test output",
		},
	},
	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-python")({
					dap = { justMyCode = false },
					args = { "--log-level", "DEBUG", "--cov=src", "--cov-report=lcov" },
					runner = "pytest",
				}),
			},
		})
	end,
}
