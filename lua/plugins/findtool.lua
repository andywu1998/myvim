return {
	{
		-- 查找文件
		"nvim-telescope/telescope.nvim",
		keys = {
			-- add a keymap to browse plugin files
			-- stylua: ignore
			{
				"<leader>fp",
				function()
					require("telescope.builtin").find_files({
						cwd = require("lazy.core.config")
						    .options.root
					})
				end,
				desc = "Find Plugin File",
			},
		},
		-- change some options
		opts = function()
			local actions = require("telescope.actions")
			return {
				defaults = {
					layout_strategy = "horizontal",
					layout_config = { prompt_position = "top" },
					sorting_strategy = "ascending",
					winblend = 0,
					mapping = {
						n = {
						},
					},
				},
			}
		end,

	},
	{
		"telescope.nvim",
		dependencies = {
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			config = function()
				require("telescope").load_extension("fzf")
			end,
		},
	}
}
