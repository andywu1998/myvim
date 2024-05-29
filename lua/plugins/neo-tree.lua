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
            window = {
                mappings = {
                    -- upload (sync files)
                    uu = {
                        function(state)
                        vim.cmd("TransferUpload " .. state.tree:get_node().path)
                        end,
                        desc = "upload file or directory",
                        nowait = true,
                    },
                    -- download (sync files)
                    ud = {
                        function(state)
                        vim.cmd("TransferDownload" .. state.tree:get_node().path)
                        end,
                        desc = "download file or directory",
                        nowait = true,
                    },
                    -- diff directory with remote
                    uf = {
                        function(state)
                        local node = state.tree:get_node()
                        local context_dir = node.path
                        if node.type ~= "directory" then
                            -- if not a directory
                            -- one level up
                            context_dir = context_dir:gsub("/[^/]*$", "")
                        end
                        vim.cmd("TransferDirDiff " .. context_dir)
                        vim.cmd("Neotree close")
                        end,
                        desc = "diff with remote",
                    },
                }
            },
        },
    }
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
