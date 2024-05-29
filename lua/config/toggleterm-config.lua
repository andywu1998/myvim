-- toggleterm-config.lua


-- local powershell_options = {
--   shell = vim.fn.executable "pwsh" == 1 and "pwsh" or "powershell",
--   shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
--   shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
--   shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
--   shellquote = "",
--   shellxquote = "",
-- }
--
-- for option, value in pairs(powershell_options) do
--   vim.opt[option] = value
-- end

local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
    return
end

toggleterm.setup({
    size = 20,
    open_mapping = [[<c-\>]],
    hide_numbers = true,
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = 2,
    start_in_insert = true,
    insert_mappings = true,
    persist_size = true,
    direction = "vertical",
    close_on_exit = true,
    shell = vim.o.shell,
    float_opts = {
        border = "curved",
        winblend = 0,
        highlights = {
            border = "Normal",
            background = "Normal",
        },
    },
})

function _G.set_terminal_keymaps()
    local opts = { noremap = true }
    vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

local Terminal = require("toggleterm.terminal").Terminal


local node = Terminal:new({ cmd = "node", hidden = true })

function _NODE_TOGGLE()
    node:toggle()
end

local python = Terminal:new({ cmd = "python3", hidden = true })

function _PYTHON_TOGGLE()
    python:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>tpy", "<cmd>lua _PYTHON_TOGGLE()<CR>", { noremap = true, silent = true })
local lazygit = Terminal:new({
    cmd = "lazygit",
    dir = "git_dir",
    direction = "float",
    float_opts = {
        border = "double",
    },
    -- function to run on opening the terminal
    on_open = function(term)
        vim.cmd("startinsert!")
        vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
    end,
    -- function to run on closing the terminal
    on_close = function(term)
        vim.cmd("startinsert!")
    end,
})

-- brew install jesseduffield/lazygit/lazygit
function _lazygit_toggle()
    lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>tg", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })

function _set_toggleterm_working_directory()
    local current_file = vim.fn.expand('%:p')
    local current_dir = vim.fn.fnamemodify(current_file, ':h')
    local command = "cd " .. vim.fn.shellescape(current_dir)
    return command
end

local cwdTerm = Terminal:new({ cmd = _set_toggleterm_working_directory(), hidden = true, close_on_exit = false })

function _GoTest()
    local current_file_directory = vim.fn.expand('%:p:h')
    test_name = require('dap-go2').get_test_name()
    cmd = "go test -run " .. "^" .. test_name .. "$" .. " -v"
    local term = Terminal:new({
        cmd = cmd,
        dir = current_file_directory,
        hidden = false,
        close_on_exit = false,
    })
    vim.notify(cmd)
    term:open()
end

function _CWD_TERM()
    local current_file_directory = vim.fn.expand('%:p:h')
    local term = Terminal:new({
        cmd = "zsh",
        dir = current_file_directory,
        hidden = false,
        close_on_exit = false,
    })
    vim.notify(cmd)
    term:open()
end

vim.api.nvim_set_keymap("n", "<leader>tcd", "<cmd>lua _CWD_TERM()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>tcw", "<cmd>lua _GoTest()<CR>",
    { noremap = true, silent = true, desc = "go test curent case" })


