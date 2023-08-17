lua << EOF
-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.wo.relativenumber = false
EOF


call plug#begin('~/.vim/plugged')
Plug 'fatih/vim-go'
call plug#end()
