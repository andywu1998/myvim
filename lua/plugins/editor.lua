return {
	-- 文件树
	{
		"nvim-neo-tree/neo-tree.nvim",
		opts = {
			sources = { "filesystem", "buffers", "git_status", "document_symbols" },
			open_files_do_not_replace_types = { "terminal", "Trouble", "trouble", "qf", "Outline" },
			filesystem = {
				bind_to_cwd = false,
				follow_current_file = { enabled = true },
				use_libuv_file_watcher = true,
			},
			window = {
				mappings = {
					["<space>"] = "none",
				},
			},
			default_component_configs = {
				indent = {
					with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
					expander_collapsed = "",
					expander_expanded = "",
					expander_highlight = "NeoTreeExpander",
				},
			},
		}
	},

	-- 多tab切换插件
	{
		'akinsho/bufferline.nvim',
		version = "*",
		dependencies = 'nvim-tree/nvim-web-devicons',
		config = function()
			require("bufferline").setup({
				options = {
					offsets = {
						{
							filetype = "neo-tree",
							text = "File Explorer",
							text_align = "left",
							separator = true,
						},
					},
				},
			})
		end,

	},
	-- bufferline依赖
	{
		"nvim-lua/plenary.nvim"
	},
	-- bufferline依赖
	{
		"MunifTanjim/nui.nvim"
	},
	{
		"ggandor/leap.nvim",
		enabled = true,
		keys = {
			{ "s",  mode = { "n", "x", "o" }, desc = "Leap forward to" },
			{ "S",  mode = { "n", "x", "o" }, desc = "Leap backward to" },
			{ "gs", mode = { "n", "x", "o" }, desc = "Leap from windows" },
		},
		config = function(_, opts)
			local leap = require("leap")
			for k, v in pairs(opts) do
				leap.opts[k] = v
			end
			leap.add_default_mappings(true)
			vim.keymap.del({ "x", "o" }, "x")
			vim.keymap.del({ "x", "o" }, "X")
		end,
	},
	{
		"folke/which-key.nvim",
		optional = true,
		opts = {
			defaults = {
				["<leader>d"] = { name = "+debug" },
				["<leader>da"] = { name = "+adapters" },
			},
		},
	},
	{ 'echasnovski/mini.nvim', version = false },
}
