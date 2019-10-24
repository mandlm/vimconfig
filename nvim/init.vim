call plug#begin(stdpath('data') . '/plugged')

Plug 'altercation/vim-colors-solarized'
Plug 'itchyny/lightline.vim'

Plug 'Shougo/vimproc.vim', {'do': 'make'}
Plug 'rhysd/vim-clang-format'

Plug 'derekwyatt/vim-fswitch'

Plug 'tpope/vim-obsession'
Plug 'dhruvasagar/vim-prosession'

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'christoomey/vim-tmux-navigator'

Plug 'mandlm/vim-split-open'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

call plug#end()

" tabwidth
set tabstop=4
set shiftwidth=4

" solarized dark theme
colorscheme solarized
set background=dark

" line numbers
set number

" preview commands
set inccommand=split

" terminal mode options
autocmd TermOpen * startinsert
tnoremap <ESC> <C-\><C-n>

" ctags config
set tags=./tags;
nnoremap <F2> <C-]>

" lightline config
let g:lightline = { 'colorscheme': 'solarized' }

" clang-format
let g:clang_format#auto_format = 1
let g:clang_format#enable_fallback_style = 0

" prosession
let g:prosession_tmux_title = 1
let g:prosession_per_branch = 1

" fzf.vim
nnoremap <C-P> :Files<CR>
nnoremap <C-F> :Rg \b<C-R><C-W>\b<CR>

let g:splitopen_set_fzf_keys = 1

" deoplete
let g:deoplete#enable_at_startup = 1
autocmd CompleteDone * silent! pclose!
call deoplete#custom#source('_', 'matchers', ['matcher_full_fuzzy'])

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" LanguageClient-neovim
set hidden
nnoremap <F5> :call LanguageClient_contextMenu()<CR>
nnoremap <F12> :call LanguageClient#textDocument_definition()<CR>
let g:LanguageClient_serverCommands = {
    \ 'python': ['pyls'],
	\ 'cpp': ['/usr/lib/llvm-7/bin/clangd'],
    \ }

" autoread/checktime timer {{{
set autoread
function! CheckTime(timer)
	checktime
endfunction
let timerChecktime = timer_start(4000, 'CheckTime', {'repeat': -1})
" }}}

