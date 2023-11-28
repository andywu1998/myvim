return {
{
"nvim-neo-tree/neo-tree.nvim",
opts = {
    filesystem = {
	filtered_items = {
	    visible = true,
	    show_hidden_count = true,
	    hide_dotfiles = false,
	    hide_gitignored = true,
	    hide_by_name = {
		-- '.git',
		-- '.DS_Store',
		-- 'thumbs.db',
	    },
	    never_show = {},
	},
    },
},
},

{'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons',
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
{
	"nvim-lua/plenary.nvim"
},
{
"MunifTanjim/nui.nvim"
}
}
