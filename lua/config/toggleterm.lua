-- open current working directory
local Terminal = require("toggleterm.terminal").Terminal
function _CWD_TERM()
	local current_file_directory = vim.fn.expand('%:p:h')
	local term = Terminal:new({
		cmd = "zsh",
		dir = current_file_directory,
		hidden = false,
		close_on_exit = false,
	})
	term:open()
end

vim.api.nvim_set_keymap("n", "<leader>tcd", "<cmd>lua _CWD_TERM()<CR>",
	{ noremap = true, silent = true, desc = "open current working directory" })
