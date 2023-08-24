

lua << EOF
-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("config.git")
require("config.which-key")
require("config.lsp")
require("config.mapping")
vim.wo.relativenumber = false

function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
require "config.toggleterm-config"
require('leap').add_default_mappings()
EOF


call plug#begin('~/.vim/plugged')
Plug 'fatih/vim-go'

Plug 'APZelos/blamer.nvim'
call plug#end()
set ts=4 sw=4
let g:blamer_enabled = 1
