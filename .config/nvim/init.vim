"dein configuration 20190404
"ref: https://sy-base.com/myrobotics/vim/dein/
if &compatible
  set nocompatible               " Be iMproved
endif

" set the dein install directory
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" check the installation of dein
" if not, download and install
if &runtimepath !~# '/dein.vim'
    if !isdirectory(s:dein_repo_dir)
        execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
    endif
    execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " Let dein manage dein
  " call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

  " toml file
  let g:rc_dir = expand('~/.config/nvim') "dein.toml and dein_lazy.toml
  let s:toml = g:rc_dir . '/dein.toml'
  " let s:lazy_toml = g:rc_dir . '/dein_lazy.toml' "comment out when you use lazy file
  "
  " Add or remove your plugins here like this:
  "call dein#add('Shougo/neosnippet.vim')
  "call dein#add('Shougo/neosnippet-snippets')

  " load toml file
  call dein#load_toml(s:toml, {'lazy': 0})
  " call dein#load_toml(s:lazy_toml, {'lazy':1}) "comment out when you use lazy file
  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

" check plugin installations
if dein#check_install()
  call dein#install()
endif

"*****************************************************************************
"" Basic Setup
"*****************************************************************************"
"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set ttyfast

"" Map leader to ,
let mapleader="\<Space>"

"" Enable hidden buffers
set hidden

"*****************************************************************************
"" Visual Settings
"*****************************************************************************
syntax on
set ruler
set number

"" NERDTree configuration
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 50
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
nnoremap <silent> <F2> :NERDTreeFind<CR>
nnoremap <silent> <F3> :NERDTreeToggle<CR>

"*****************************************************************************
"" Mappings
"*****************************************************************************

"" Split
noremap <Leader>v :<C-u>split<CR>
noremap <Leader>m :<C-u>vsplit<CR>

noremap YY "+y<CR>
noremap <leader>p "+gP<CR>
noremap XX "+x<CR>

"" Buffer nav
noremap <leader>z :bp<CR>
noremap <leader>q :bp<CR>
noremap <leader>x :bn<CR>
noremap <leader>w :bn<CR>

"" Close buffer
noremap <leader>c :bd<CR>

"" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>

"" Switching windows
noremap <leader>j <C-w>j
noremap <leader>k <C-w>k
noremap <leader>l <C-w>l
noremap <leader>h <C-w>h
set history=200
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

"" NERDTree settings
"" nnoremap <silent><C-e> :NERDTreeToggle<CR>
" auto launch
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let NERDTreeShowHidden = 1

"" open directory with active file
"" ref: practical vim TIP 41
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

"" unite.vim and neomru.vim settiongs
"" refs: https://qiita.com/ykyk1218/items/ab1c89c4eb6a2f90333a
noremap <C-U><C-F> :Unite -buffer-name=file file<CR> 
noremap <C-U><C-R> :Unite file_mru<CR> 

au FileType unite nnoremap <silent> <buffer> <expr> <C-i> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-i> unite#do_action('split')

"" escape when ESC key typed twice
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q

"" not put into yunk when you type 'x'
"" ref: https://qiita.com/ykyk1218/items/ab1c89c4eb6a2f90333a
noremap PP "0p
noremap x "_x

inoremap <C-e> <Esc>$a
inoremap <C-a> <Esc>^i
noremap <C-e> <Esc>$a
noremap <C-a> <Esc>^i

"" winresize settings
"" map <Space>e to launch resize mode
let g:winresizer_start_key = '<Leader>e'

"" move current dir automatically
set autochdir

"" python setting for interpolation
let g:python3_host_prog = '/usr/bin/python3'
let g:python_host_prog = '/usr/bin/python2'

"" Use deoplete.
let g:deoplete#enable_at_startup = 1

set laststatus=2

"" ale_settings
let g:lightline = {
  \'active': {
  \  'left': [
  \    ['mode', 'paste'],
  \    ['readonly', 'filename', 'modified', 'ale'],
  \  ]
  \},
  \'component_function': {
  \  'ale': 'ALEGetStatusLine'
  \}
  \ }

"" filetype settings
autocmd FileType html setlocal expandtab sw=2 ts=2 sts=2
autocmd FileType javascript setlocal expandtab sw=4 ts=4 sts=4
autocmd FileType python setlocal expandtab sw=4 ts=4 sts=4
autocmd FileType ruby setlocal expandtab sw=2 ts=2 sts=2
autocmd FileType css setlocal expandtab sw=2 ts=2 sts=2
