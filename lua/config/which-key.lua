local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
    return
end

-- local mappings = {
--     { "<leader>g", group = "Git", nowait = true, remap = false },
--     {
--         "<leader>gR",
--         "<cmd>lua require 'gitsigns'.reset_buffer()<cr>",
--         desc = "Reset Buffer",
--         nowait = true,
--         remap = false,
--     },
--     { "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "Checkout branch", nowait = true, remap = false },
--     { "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Checkout commit", nowait = true, remap = false },
--     { "<leader>gd", "<cmd>Gitsigns diffthis HEAD<cr>", desc = "Diff", nowait = true, remap = false },
--     { "<leader>gj", "<cmd>lua require 'gitsigns'.next_hunk()<cr>", desc = "Next Hunk", nowait = true, remap = false },
--     { "<leader>gk", "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", desc = "Prev Hunk", nowait = true, remap = false },
--     { "<leader>gl", "<cmd>lua require 'gitsigns'.blame_line()<cr>", desc = "Blame", nowait = true, remap = false },
--     { "<leader>go", "<cmd>Telescope git_status<cr>", desc = "Open changed file", nowait = true, remap = false },
--     {
--         "<leader>gp",
--         "<cmd>lua require 'gitsigns'.preview_hunk()<cr>",
--         desc = "Preview Hunk",
--         nowait = true,
--         remap = false,
--     },
--     { "<leader>gr", "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", desc = "Reset Hunk", nowait = true, remap = false },
--     { "<leader>gs", "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", desc = "Stage Hunk", nowait = true, remap = false },
--     {
--         "<leader>gu",
--         "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
--         desc = "Undo Stage Hunk",
--         nowait = true,
--         remap = false,
--     },
--     { "<leader>t", group = "Upload / Download" },
--     { "<leader>td", "<cmd>TransferDownload<cr>", desc = "Download from remote server (scp)" },
--     { "<leader>tf", "<cmd>DiffRemote<cr>", desc = "Diff file with remote server (scp)" },
--     { "<leader>ti", "<cmd>TransferInit<cr>", desc = "Init/Edit Deployment config" },
--     { "<leader>tr", "<cmd>TransferRepeat<cr>", desc = "Repeat transfer command" },
--     { "<leader>tu", "<cmd>TransferUpload<cr>", desc = "Upload to remote server (scp)" },
-- }

local mappings = {}

local opts = {
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
}
--
-- require("which-key").register({

-- })


local wk = require("which-key")
wk.add({
    { "<leader>f", group = "file" }, -- group
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File", mode = "n" },
    { "<leader>fb", function() print("hello") end, desc = "Foobar" },
    { "<leader>fn", desc = "New File" },
    { "<leader>f1", hidden = true }, -- hide this keymap
    { "<leader>w", proxy = "<c-w>", group = "windows" }, -- proxy to window mappings
    { "<leader>b", group = "buffers", expand = function()
        return require("which-key.extras").expand.buf()
    end
    },

    { "<leader>t", group = "file" }, -- group
    { "<leader>tu", "<cmd>TransferUpload<cr>", desc = "Upload to remote server (scp)" },
    { "<leader>td", "<cmd>TransferDownload<cr>", desc = "Download from remote server (scp)" },
    { "<leader>tf", "<cmd>DiffRemote<cr>", desc = "Diff file with remote server (scp)" },
    { "<leader>ti", "<cmd>TransferInit<cr>", desc = "Init/Edit Deployment config" },
    { "<leader>tr", "<cmd>TransferRepeat<cr>", desc = "Repeat transfer command" },
    { "<leader>tu", "<cmd>TransferUpload<cr>", desc = "Upload to remote server (scp)" },

    {
        -- Nested mappings are allowed and can be added in any order
        -- Most attributes can be inherited or overridden on any level
        -- There's no limit to the depth of nesting
        mode = { "n", "v" }, -- NORMAL and VISUAL mode
        { "<leader>q", "<cmd>q<cr>", desc = "Quit" }, -- no need to specify mode since it's inherited
        { "<leader>w", "<cmd>w<cr>", desc = "Write" },
    }
})
