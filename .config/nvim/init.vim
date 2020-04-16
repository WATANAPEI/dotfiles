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

"" Close window
noremap <leader>c :clo<CR>

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

"" open directory with active file
"" ref: practical vim TIP 41
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

"" unite.vim and neomru.vim settiongs
"" refs: https://qiita.com/ykyk1218/items/ab1c89c4eb6a2f90333a
noremap <C-U><C-F> :Unite -buffer-name=file file<CR> 
noremap <C-U><C-R> :Unite file_mru<CR> 
noremap <C-U><C-B> :Unite buffer<CR> 

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

"" tell ale the c++ compile option
let g:ale_cpp_gcc_options="-std=c++1z -Wall -l /usr/local/include -I/usr/local/src/date/include/date -I/usr/local/src/curl/include -I/usr/local/src/pngwriter/src -I/usr/local/src/freetype-2.10.1/include -I/usr/local/src/asio-1.12.2/include -I/usr/local/src/pdfwriter -I/home/baystars/src/llvm/llvm-project/llvm/include"
"" disable ale_completion
let g:ale_completion_enabled=0
"" default tabspace setting
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

"" filetype settings
autocmd BufRead,BufNewFile *.ts set filetype=typescript
autocmd BufRead,BufNewFile *.tsx set filetype=typescript
autocmd BufRead,BufNewFile *.jsx set filetype=javascript
autocmd BufRead,BufNewFile *.json set filetype=javascript
autocmd BufRead,BufNewFile *.html.erb set filetype=html
autocmd FileType html setlocal expandtab sw=2 ts=2 sts=2
autocmd FileType javascript setlocal expandtab sw=2 ts=2 sts=2
autocmd FileType typescript setlocal expandtab sw=2 ts=2 sts=2
autocmd FileType python setlocal expandtab sw=4 ts=4 sts=4
autocmd FileType ruby setlocal expandtab sw=2 ts=2 sts=2
autocmd FileType css setlocal expandtab sw=2 ts=2 sts=2

" open nvim config file
nnoremap <F5> :<C-u>vsplit $MYVIMRC<CR>

" shortcut for vimgrep incre & decre
nnoremap [Q :<C-u>cfirst<CR>
nnoremap ]Q :<C-u>clast<CR>

noremap <leader>[ :cprevious<CR>
noremap <leader>] :cnext<CR>

" open new window automatically when vimgrep, grep
autocmd QuickFixCmdPost *grep* cwindow

" fugitive shortcut
nmap [figitive] <Nop>
map <leader>g [figitive]
nmap <silent> [figitive]s :<C-u>Gstatus<CR>
nmap <silent> [figitive]d :<C-u>Gdiff<CR>
nmap <silent> [figitive]b :<C-u>Gblame<CR>
nmap <silent> [figitive]l :<C-u>Glog<CR>

" move corsole during insert mode
ino <C-l> <Right>
ino <C-g> <Left>

" add fzf settings
set runtimepath+=~/.fzf

" type "jj" means ESC
inoremap jj <ESC>

" add ruby host prog location
let g:ruby_host_prog = '~/.gem/bin/neovim-ruby-host'

" syntastic settings
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_javascript_checkers = ['eslint']
"let g:syntastic_typescript_checkers = ['eslint']

" solarized settings
" https://qiita.com/nilllm/items/c16519d7c8db35de7514
" let g:solarized_termcolors=256
" syntax enable
" set background=dark
" colorscheme solarized

" set command window size
:set cmdheight=2

" yank shortcut
vnoremap y : '<,'>y+"

command W : write
command Q : quit

" clipboard share for ubuntu
set clipboard+=unnamedplus
