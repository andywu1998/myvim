

lua << EOF
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
vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])

require'switch_case'
vim.api.nvim_set_keymap('n', '<Leader>nc', '<cmd>lua require("switch_case").switch_case()<CR>', {noremap = true, silent = true})
require('config.unixtimestamp')
EOF

set ts=4 sw=4
let g:blamer_enabled = 1

let g:coc_global_extensions = ['coc-json', 'coc-git', 'coc-pyright', 'coc-protobuf']
