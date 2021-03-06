autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
autocmd FileType python nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>
map <C-n> :NERDTreeToggle<CR>
syntax enable
syntax on

" line numbers, mouse, and clipboard enable
set nu
set mouse=a
set clipboard=unnamedplus

" utf-8, way better than ANSII
set encoding=utf-8

" Setup Vundle
set rtp+=$TIMS_CONFIG_FILES/static/vim/.vim/bundle/Vundle.vim
call vundle#begin() " Vundle will install anything between this and line 34

Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tomtom/tcomment_vim'
Plugin 'vim-airline/vim-airline' " tabline for vim
Plugin 'vim-airline/vim-airline-themes' " some themes for previous
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'derekwyatt/vim-scala'
Plugin 'sbdchd/neoformat'
Plugin 'yuezk/vim-js'
Plugin 'maxmellon/vim-jsx-pretty'
Plugin 'prettier/vim-prettier', { 'do': 'yarn install', 'for': ['javascript', 'css', 'scss'] }
Plugin 'martinda/Jenkinsfile-vim-syntax'
Plugin 'JamshedVesuna/vim-markdown-preview'

call vundle#end()

" let g:prettier#exec_cmd_path="$TIMS_CONFIG_FILES/static/"
let g:prettier#autoformat_config_present=1
let g:prettier#autoformat_config_files = [".prettierrc"]
" let g:prettier#config#use_tabs='true'
autocmd BufWritePre *.js,*.jsx,*.css,*.scss PrettierAsync

" Cool function I found that closes NERDTree if the last open
" window is closed.
" URL: https://github.com/scrooloose/nerdtree/issues/21
function! NERDTreeQuit()
  redir => buffersoutput
  silent buffers
  redir END
"                     1BufNo  2Mods.     3File           4LineNo
  let pattern = '^\s*\(\d\+\)\(.....\) "\(.*\)"\s\+line \(\d\+\)$'
  let windowfound = 0
for bline in split(buffersoutput, "\n")
    let m = matchlist(bline, pattern)

    if (len(m) > 0)
      if (m[2] =~ '..a..')
        let windowfound = 1
      endif
    endif
  endfor

  if (!windowfound)
    quitall
  endif
endfunction
autocmd WinEnter * call NERDTreeQuit()

filetype plugin indent on

" Setting up Python IDE
set nocompatible
"filetype off

" Split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright

" Enable folding, set space toggle
set foldmethod=syntax
set foldlevel=99
nnoremap <space> za
let g:SimpylFold_docstring_preview=1

au BufNewFile,BufRead *.scala
    \ set filetype=scala

" PEP8 standard indentation
au BufNewFile,BufRead *.py
    \ set autoindent    |
    \ set noexpandtab   |
    \ set tabstop=4     |
    \ set softtabstop=4 |
    \ set shiftwidth=4  |
    \ set shiftround    |
    \ set fileformat=unix

au BufNewFile,BufRead *.c,*.h,*.cpp
    \ set autoindent    |
    \ set noexpandtab   |
    \ set tabstop=4     |
    \ set softtabstop=4 |
    \ set shiftwidth=4  |
    \ set shiftround

au BufNewFile,BufRead *.js,*.jsx,*.html,*.css
    \ set autoindent    |
    \ set noexpandtab   |
    \ set tabstop=4     |
    \ set softtabstop=4 |
    \ set shiftwidth=4  |
    \ set shiftround

au BufNewFile,BufRead *.java
    \ set autoindent    |
    \ set tabstop=2     |
    \ set softtabstop=2 |
    \ set shiftwidth=2  |
    \ set noexpandtab

au BufNewFile,BufRead *.hs
    \ set tabstop=8     |             "A tab is 8 spaces
    \ set expandtab     |             "Always uses spaces instead of tabs
    \ set softtabstop=4 |             "Insert 4 spaces when tab is pressed
    \ set shiftwidth=4  |             "An indent is 4 spaces
    \ set shiftround                  "Round indent to nearest shiftwidth multiple

au BufNewFile,BufRead Jenkinsfile setf groovy

if has('gui_running')
    set background=dark
    colorscheme solarized
else
    colorscheme zenburn
endif

let NERDTree=['\.pyc$'. '\~$'] "ignore files in NERDTree

" Tab specific option
set tabstop=4                   "A tab is 8 spaces
set noexpandtab                 "Use tabs
set softtabstop=4               "Insert 4 spaces when tab is pressed
set shiftwidth=4                "An indent is 4 spaces
set shiftround                  "Round indent to nearest shiftwidth multiple
set smartindent


map <f9> :make


" airline theme setup, colour scheme to 256 colour palette
let g:airline_theme='luna'
set t_Co=256

set list          " Display unprintable characters f12 - switches
set listchars=tab:\ \ ,trail:•,extends:»,precedes:« " Unprintable chars mapping
nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>
set pastetoggle=<F3>

" Markdown preview options
let vim_markdown_preview_toggle=1 " Use hotkey to render the markdown file
let vim_markdown_preview_hotkey='<C-m>'
let vim_markdown_preview_browser='Firefox'
let vim_markdown_preview_temp_file=1 " Delete temp .html file after closing browser
