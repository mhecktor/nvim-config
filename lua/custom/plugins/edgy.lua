---@diagnostic disable: unused-local
return {
	"folke/edgy.nvim",
	enabled = false,
	event = "VeryLazy",
	init = function()
		vim.opt.laststatus = 3
		vim.opt.splitkeep = "screen"
	end,
	keys = {
		{
			"<leader>ue",
			function()
				require("edgy").toggle()
			end,
			desc = "Edgy Toggle",
		},
	    -- stylua: ignore
		{ "<leader>uE", function() require("edgy").select() end, desc = "Edgy Select Window" },
	},
	opts = function()
		local opts = {
			close_when_all_hidden = false,
			bottom = {
				{
					ft = "toggleterm",
					size = { height = 0.4 },
					filter = function(buf, win)
						return vim.api.nvim_win_get_config(win).relative == ""
					end,
				},
				"Trouble",
				{
					ft = "help",
					size = { height = 20 },
					-- don't open help files in edgy that we're editing
					filter = function(buf)
						return vim.bo[buf].buftype == "help"
					end,
				},
				{ title = "Spectre", ft = "spectre_panel", size = { height = 0.2 } },
			},
			left = {
				{
					title = "Neo-Tree",
					ft = "neo-tree",
					filter = function(buf)
						return vim.b[buf].neo_tree_source == "filesystem"
					end,
					size = { height = 0.5 },
				},
			},
			right = {
				{
					title = "Outline",
					ft = "Outline",
					pinned = true,
					open = "Outline",
				},
			},
			keys = {
				-- increase width
				["<c-Right>"] = function(win)
					win:resize("width", 2)
				end,
				-- decrease width
				["<c-Left>"] = function(win)
					win:resize("width", -2)
				end,
				-- increase height
				["<c-Up>"] = function(win)
					win:resize("height", 2)
				end,
				-- decrease height
				["<c-Down>"] = function(win)
					win:resize("height", -2)
				end,
			},
		}

		local LazyVimUtils = require("LazyVimUtils")
		if LazyVimUtils.has("neo-tree.nvim") then
			local positions = {
				filesystem = "left",
				buffers = "top",
				git_status = "right",
				document_symbols = "bottom",
				diagnostics = "bottom",
			}
			local sources = LazyVimUtils.opts("neo-tree.nvim").sources or {}
			for i, v in ipairs(sources) do
				table.insert(opts.left, i, {
					title = "Neo-Tree " .. v:gsub("_", " "):gsub("^%l", string.upper),
					ft = "neo-tree",
					filter = function(buf)
						return vim.b[buf].neo_tree_source == v
					end,
					pinned = true,
					open = function()
						vim.cmd(
							("Neotree show position=%s %s dir=%s"):format(
								positions[v] or "bottom",
								v,
								LazyVimUtils.root()
							)
						)
					end,
				})
			end

			for _, pos in ipairs({ "top", "bottom", "left", "right" }) do
				opts[pos] = opts[pos] or {}
				table.insert(opts[pos], {
					ft = "trouble",
					filter = function(_buf, win)
						return vim.w[win].trouble
							and vim.w[win].trouble.position == pos
							and vim.w[win].trouble.type == "split"
							and vim.w[win].trouble.relative == "editor"
							and not vim.w[win].trouble_preview
					end,
				})
			end
		end
		return opts
	end,
}
