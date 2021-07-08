call plug#begin(stdpath('data') . '/plugged')

Plug 'altercation/vim-colors-solarized'
Plug 'itchyny/lightline.vim'

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

Plug 'tpope/vim-dispatch'

Plug 'RRethy/vim-illuminate'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'

Plug 'Lenovsky/nuake'

Plug 'junegunn/vim-peekaboo'

Plug 'alfredodeza/pytest.vim'

Plug 'cespare/vim-toml'

Plug 'vimwiki/vimwiki'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'HerringtonDarkholme/yats.vim'

Plug 'git@gitlab.softwareparadies.de:IDE/swp-vim.git'

call plug#end()

" tabwidth
set tabstop=4
set shiftwidth=4

" indent with spaces
set expandtab

" scroll offset
set scrolloff=4

" presistent undo
set undofile

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
nnoremap <C-G> :Rg<CR>
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

augroup close_preview
	autocmd InsertLeave * silent! pclose!
augroup end

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
	autocmd Filetype cpp,python,javascript,javascriptreact,typescript,typescriptreact set colorcolumn=101
augroup end

" vimwiki
let g:vimwiki_list = [
	\ {'name': 'personal', 'path': '~/vimwiki/personal'},
	\ {'name': 'swp', 'path': '~/vimwiki/swp'}
	\ ]

let g:vimwiki_table_mappings = 0
let g:vimwiki_global_ext = 0

" coc 
set updatetime=300

let g:coc_global_extensions = [
	\ 'coc-clangd',
	\ 'coc-cmake',
	\ 'coc-eslint',
	\ 'coc-html',
	\ 'coc-json',
	\ 'coc-python',
	\ 'coc-rust-analyzer',
	\ 'coc-sh',
	\ 'coc-toml',
	\ 'coc-tsserver',
	\ 'coc-vimlsp',
	\ 'coc-yaml',
	\ ]

nnoremap <silent> K :call CocAction('doHover')<CR>

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> ga <Plug>(coc-codeaction)
nmap <silent> <leader>rn <Plug>(coc-rename)

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

inoremap <silent><expr> <S-Tab>
      \ pumvisible() ? "\<C-p>" :
      \ <SID>check_back_space() ? "\<S-Tab>" :
      \ coc#refresh()

