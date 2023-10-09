return {
    -- neotree的图标
    { "nvim-tree/nvim-web-devicons", lazy = true },
    -- 不知道做啥的，先关掉
    -- { "MunifTanjim/nui.nvim", lazy = true },
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
    -- 不知道做啥的，先关掉
    -- {
    --     "lukas-reineke/indent-blankline.nvim",
    --     event = { "BufReadPost", "BufNewFile" },
    --     opts = {
    --         -- char = "▏",
    --         char = "│",
    --         filetype_exclude = {
    --             "help",
    --             "alpha",
    --             "dashboard",
    --             "neo-tree",
    --             "Trouble",
    --             "lazy",
    --             "mason",
    --             "notify",
    --             "toggleterm",
    --             "lazyterm",
    --         },
    --         show_trailing_blankline_indent = false,
    --         show_current_context = false,
    --     },
    -- },
}
