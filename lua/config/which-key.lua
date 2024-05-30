local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
    return
end

local mappings = {
    g = {
        name = "Git",
        j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
        k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
        l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
        p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
        r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
        R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
        s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
        u = {
            "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
            "Undo Stage Hunk",
        },
        o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
        b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
        c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
        d = {
            "<cmd>Gitsigns diffthis HEAD<cr>",
            "Diff",
        },
    }
}
local opts = {
    mode = "n",     -- NORMAL mode
    prefix = "<leader>",
    buffer = nil,   -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true,  -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true,  -- use `nowait` when creating keymaps
}
which_key.register(mappings, opts)


require("which-key").register({
  ["<leader>"] = {
    t = {
      name = "Upload / Download",
      d = { "<cmd>TransferDownload<cr>", "Download from remote server (scp)" },
      u = { "<cmd>TransferUpload<cr>", "Upload to remote server (scp)" },
      f = { "<cmd>DiffRemote<cr>", "Diff file with remote server (scp)" },
      i = { "<cmd>TransferInit<cr>", "Init/Edit Deployment config" },
      r = { "<cmd>TransferRepeat<cr>", "Repeat transfer command" },
    },
  }
})
