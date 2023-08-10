set ts=4 sw=4
syntax on
noremap <silent> tp :tabprevious<CR>
noremap <silent> tn :tabnext<CR>
noremap <silent> nt :tabnew<CR>

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                          \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
    Plug 'mhinz/vim-startify'
	Plug 'fatih/vim-go'
	Plug 'preservim/nerdtree'
call plug#end()
noremap <silent> sta :Startify

