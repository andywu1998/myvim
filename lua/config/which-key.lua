local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
    return
end

local mappings = {
    { "<leader>g", group = "Git", nowait = true, remap = false },
    {
        "<leader>gR",
        "<cmd>lua require 'gitsigns'.reset_buffer()<cr>",
        desc = "Reset Buffer",
        nowait = true,
        remap = false,
    },
    { "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "Checkout branch", nowait = true, remap = false },
    { "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Checkout commit", nowait = true, remap = false },
    { "<leader>gd", "<cmd>Gitsigns diffthis HEAD<cr>", desc = "Diff", nowait = true, remap = false },
    { "<leader>gj", "<cmd>lua require 'gitsigns'.next_hunk()<cr>", desc = "Next Hunk", nowait = true, remap = false },
    { "<leader>gk", "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", desc = "Prev Hunk", nowait = true, remap = false },
    { "<leader>gl", "<cmd>lua require 'gitsigns'.blame_line()<cr>", desc = "Blame", nowait = true, remap = false },
    { "<leader>go", "<cmd>Telescope git_status<cr>", desc = "Open changed file", nowait = true, remap = false },
    {
        "<leader>gp",
        "<cmd>lua require 'gitsigns'.preview_hunk()<cr>",
        desc = "Preview Hunk",
        nowait = true,
        remap = false,
    },
    { "<leader>gr", "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", desc = "Reset Hunk", nowait = true, remap = false },
    { "<leader>gs", "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", desc = "Stage Hunk", nowait = true, remap = false },
    {
        "<leader>gu",
        "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
        desc = "Undo Stage Hunk",
        nowait = true,
        remap = false,
    },
}
local opts = {
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
}
-- which_key.register(mappings, opts)
--
-- require("which-key").register({
--     { "<leader>t", group = "Upload / Download" },
--     { "<leader>td", "<cmd>TransferDownload<cr>", desc = "Download from remote server (scp)" },
--     { "<leader>tf", "<cmd>DiffRemote<cr>", desc = "Diff file with remote server (scp)" },
--     { "<leader>ti", "<cmd>TransferInit<cr>", desc = "Init/Edit Deployment config" },
--     { "<leader>tr", "<cmd>TransferRepeat<cr>", desc = "Repeat transfer command" },
--     { "<leader>tu", "<cmd>TransferUpload<cr>", desc = "Upload to remote server (scp)" },
-- })
