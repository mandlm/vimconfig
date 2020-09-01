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

Plug 'tpope/vim-dispatch'

Plug 'RRethy/vim-illuminate'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'

Plug 'Lenovsky/nuake'

Plug 'junegunn/vim-peekaboo'

Plug 'psf/black', { 'branch': 'stable' }

Plug 'git@gitlab.softwareparadies.de:IDE/swp-vim.git'

call plug#end()

" tabwidth
set tabstop=4
set shiftwidth=4

" scroll offset
set scrolloff=4

" solarized dark theme
silent! colorscheme solarized
set background=dark

" line numbers
set number

" searching
set ignorecase
set smartcase

" preview commands
set inccommand=split

" set cursorline in active window
augroup CursorLine
  autocmd!
  autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  autocmd WinLeave * setlocal nocursorline
augroup END

" terminal mode options
augroup terminal_mode
	autocmd!
	autocmd TermOpen * startinsert
augroup END

" ctags config
set tags=./tags;
nnoremap <F2> <C-]>

" swp-vim
let g:swpvim_autoformat = 0

" git-gutter 
highlight SignColumn ctermbg=0

" autotag
let g:autotagmaxTagsFileSize = 1024 * 1024 * 128

" lightline config
let g:lightline = { 'colorscheme': 'solarized' }

" clang-format
let g:clang_format#auto_format = 1
let g:clang_format#enable_fallback_style = 0

" prosession
let g:prosession_tmux_title = 1
let g:prosession_per_branch = 1

" fzf.vim
nnoremap <C-P> :GFiles<CR>
nnoremap <C-F> :Rg \b<C-R><C-W>\b<CR>

" vim-illuminate
highlight illuminatedWord ctermbg=23

" split-open
nnoremap <C-S> :Split<CR>
let g:fzf_action = {
	\	'ctrl-s': 'SplitOpen',
	\	'ctrl-t': 'tab drop',
	\	'ctrl-x': 'split',
	\	'ctrl-y': 'vsplit',
	\	}

" deoplete
let g:deoplete#enable_at_startup = 1
silent! call deoplete#custom#source('_', 'matchers', ['matcher_full_fuzzy'])
silent! clas deoplete#custom#option({
	\ 'smart_case': v:true,
	\ })

augroup close_preview
	autocmd InsertLeave * silent! pclose!
augroup end

set completefunc=LanguageClient#complete

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" LanguageClient-neovim
set hidden
nnoremap <F5> :call LanguageClient_contextMenu()<CR>
nnoremap K :call LanguageClient#textDocument_hover()<CR>
nnoremap gd :call LanguageClient#textDocument_definition()<CR>

let g:LanguageClient_serverCommands = {
    \ 'python': ['pyls'],
	\ 'cpp': ['clangd'],
    \ }

" autoread/checktime timer {{{
set autoread
function! CheckTime(timer)
	checktime
endfunction
let timerChecktime = timer_start(4000, 'CheckTime', {'repeat': -1})
" }}}

" nuake console
nnoremap <F4> :Nuake<CR>
inoremap <F4> <C-\><C-n>:Nuake<CR>
tnoremap <F4> <C-\><C-n>:Nuake<CR>

augroup color_column
	autocmd!
	autocmd Filetype cpp,python set colorcolumn=101
augroup end

augroup format_black
	autocmd BufWritePre *.py execute ':Black'
augroup end
