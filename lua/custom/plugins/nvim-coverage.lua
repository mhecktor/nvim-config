return {
	{
		"andythigpen/nvim-coverage",
		config = function()
			require("coverage").setup({
				auto_reload = true,
				lang = {
					python = {
						coverage_command = "poetry run pytest --log-level DEBUG --cov=src --cov-report=lcov",
						coverage_file = "coverage.lcov",
						only_open_buffers = true,
					},
				},
				lcov_file = "coverage.lcov",
			})
		end,
	},
	{},
}
