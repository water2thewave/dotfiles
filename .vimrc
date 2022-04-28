" ================
" vim-plug Section
" ================
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Plugins
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'easymotion/vim-easymotion'
Plug 'chriskempson/base16-vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'edkolev/promptline.vim'
Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown' " Must come after 'tabular'
Plug 'isobit/vim-caddyfile'
Plug 'junegunn/vim-easy-align'
Plug 'leafOfTree/vim-svelte-plugin'
Plug 'leafgarland/typescript-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ntpeters/vim-better-whitespace'
Plug 'pangloss/vim-javascript'
Plug 'rizzatti/dash.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdcommenter'

" Snippets are separated from the engine. Add this if you want them:
"Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

call plug#end()


" ==================
" Usability Settings
" ==================
set number
set modeline
set showcmd
set colorcolumn=80
set ttimeoutlen=10

" Width of tab character
set tabstop=2

" size of an 'indent' measured in spaces
set shiftwidth=2

" Settings this to a non-zero insets a combo of spaces and tabs to simulate
" tabstops
set softtabstop=2

" Insert spaces instead of tabs
set expandtab

" Enabling this will make the tab key (in insert mode) insert spaces or tabs to
" go to the next indent of the next tabstop when the cursor is at the beginning
" of a line (i.e. the only preceding characters are whitespace).
set smarttab

" Set word wrap for certain files like Markdown
au FileType markdown,text setlocal textwidth=80
au FileType markdown vmap <Leader><Bslash> :EasyAlign*<Bar><Enter>


" ==================
" Keymappings
" ==================

" no mapping for Shift+k
nnoremap K k

nmap ; :

" Map ctrl-movement keys to window switching
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>

" Nerdtree
nmap <C-n> :NERDTreeToggle<CR>

" Nerdcomment
 "Bind ctrl / slash to toggle comment
map <C-_> <plug>NERDCommenterToggle


" =================
" Colors and Themes
" =================

" Set the tabline at the top to look pretty
let g:airline#extensions#tabline#enabled = 1

let g:airline_theme='base16_eighties'
let g:airline_powerline_fonts = 1

" If blue lines are in the number lines on the left, enable termguicolors
set termguicolors

" Use base16-shell colors
colorscheme base16-eighties
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif
set background=dark

set t_Co=256


" =====
" CtrlP
" =====
let g:ctrlp_cmd = 'CtrlPMixed'
set wildignore+=*/node_modules/*
let g:ctrlp_custom_ignore = 'node_modules'
let g:ctrlp_clear_cache_on_exit = 0


" ==========
" Whitespace
" ==========

" Strip whitespace on save for all files
autocmd BufEnter * EnableStripWhitespaceOnSave
let g:strip_whitespace_confirm=0
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1

" ==================
" COC autocompletion
" ==================
" set leader key for some commands

" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8
let mapleader = "," " map leader to comma
let g:coc_global_extensions = [
      \ 'coc-css',
      \ 'coc-highlight',
      \ 'coc-html',
      \ 'coc-json',
      \ 'coc-python',
      \ 'coc-tag',
      \ 'coc-tsserver',
      \ 'coc-vimlsp',
      \ 'coc-ultisnips',
      \ 'coc-eslint',
      \ 'coc-yaml',
      \ 'coc-svelte',
      \ 'coc-vetur',
      \ ]
      "\ 'coc-word',
      "\ 'coc-emoji',

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
"xmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}



inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

let g:airline#extensions#tabline#enabled = 1


" Easy Motion Navigation

map <Leader> <Plug>(easymotion-prefix)
nmap f <Plug>(easymotion-prefix)
