vim.keymap.set("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", {desc = "Prev Buffer"})
vim.keymap.set("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", {desc = "Next Buffer"})
vim.api.nvim_set_option("clipboard","unnamed")

