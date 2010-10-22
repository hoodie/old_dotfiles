set number
set autoindent
set smartindent
set nowrap
set tabstop=2
set shiftwidth=2
set ignorecase
set ruler
syntax on
"colorscheme slate
set hlsearch
set incsearch

au BufNewFile,BufRead *.as setf actionscript

"highlighting
highlight Comment guifg=Orange
highlight CursorLine guibg=Black

if has('gui_running')
	colorscheme slate
else
	colorscheme slate
endif

filetype plugin on
if has('gui_running')
    set grepprg=grep\ -nH\ $*
    filetype indent on
    let g:tex_flavor='latex'
endif
