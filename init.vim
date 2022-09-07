:set number
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a
:set wrap!

" Disable backup
set nobackup
set nowb
set noswapfile

" Optimize
set synmaxcol=200
set lazyredraw
au! BufNewFile,BufRead *.json set foldmethod=indent " Change foldmethod for specific filetype

call plug#begin(stdpath('config').'/plugged')
" Theme
  Plug 'joshdick/onedark.vim',                  " Dark theme

" File browser
  Plug 'preservim/nerdTree'                     " File browser
  Plug 'Xuyuanp/nerdtree-git-plugin'            " Git status
  Plug 'ryanoasis/vim-devicons'                 " Icon
  Plug 'tiagofumo'
          \ .'/vim-nerdtree-syntax-highlight'
  Plug 'unkiwii/vim-nerdtree-sync'              " Sync current file

" File search
  Plug 'junegunn/fzf',
    \ { 'do': { -> fzf#install() } }            " Fuzzy finder
  Plug 'junegunn/fzf.vim'

" Status bar
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

" Terminal
  Plug 'voldikss/vim-floaterm'                  " Float terminal

" Code intellisense
  Plug 'neoclide/coc.nvim',
    \ {'branch': 'release'}                     " Language server protocol (LSP)
  Plug 'pappasam/coc-jedi',                     " Jedi language server
  Plug 'jiangmiao/auto-pairs'                   " Parenthesis auto
  Plug 'alvan/vim-closetag'
  Plug 'mattn/emmet-vim'
  Plug 'preservim/nerdcommenter'                " Comment code
  Plug 'liuchengxu/vista.vim'                   " Function tag bar
  Plug 'alvan/vim-closetag'                     " Auto close HTML/XML tag
    \ {
      \ 'do': 'yarn install '
              \ .'--frozen-lockfile '
              \ .'&& yarn build',
      \ 'branch': 'main'
    \ }

" Code syntax highlight
  Plug 'yuezk/vim-js'                           " Javascript
  Plug 'MaxMEllon/vim-jsx-pretty'               " JSX/React
  Plug 'jackguo380/vim-lsp-cxx-highlight'       " C/C++
  Plug 'uiiaoo/java-syntax.vim'                 " Java

" Debugging
  Plug 'puremourning/vimspector'                " Vimspector

" Source code version control
  Plug 'tpope/vim-fugitive'                     " Git infomation
  Plug 'tpope/vim-rhubarb'
  Plug 'airblade/vim-gitgutter'                 " Git show changes
  Plug 'samoshkin/vim-mergetool'                " Git merge
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin Setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set theme
colorscheme onedark
autocmd BufNew,BufRead *.asm set ft=nasm

nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>

" Overwrite some color highlight
if (has("autocmd"))
  augroup colorextend
    autocmd ColorScheme
      \ * call onedark#extend_highlight("Comment",{"fg": {"gui": "#728083"}})
    autocmd ColorScheme
      \ * call onedark#extend_highlight("LineNr", {"fg": {"gui": "#728083"}})
  augroup END
endif

" Disable automatic comment in newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Other setting
for setting_file in split(glob(stdpath('config').'/settings/*.vim'))
  execute 'source' setting_file
endfor"

let g:coc_disable_startup_warning = 1
