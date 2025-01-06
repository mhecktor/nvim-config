local get_option = vim.filetype.get_option
vim.filetype.get_option = function(filetype, option)
	return option == "commentstring" and require("ts_context_commentstring.internal").calculate_commentstring()
		or get_option(filetype, option)
end

return {
	"JoosepAlviste/nvim-ts-context-commentstring",
	config = function()
		require("ts_context_commentstring").setup({
			enable_autocmd = false,
			languages = {
				javascript = {
					__default = "// %s",
					jsx_element = "{/* %s */}",
					jsx_fragment = "{/* %s */}",
					jsx_attribute = "// %s",
					comment = "// %s",
				},
			},
		})
	end,
}
