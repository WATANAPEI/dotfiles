"" LanguageClient-neovim settings
" Required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_serverCommands = {
    \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
    \ 'typescript': ['/usr/local/bin/javascript-typescript-stdio'],
    \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
    \ 'ruby': ['~/.gem/bin/solargraph', 'stdio'],
    \ 'rust': ['rustup', 'run', 'stable', 'rls'],
    \ 'python': ['~/.local/bin/pyls'],
    \ }
let g:LanguageClient_changeThrottle = 0.1

augroup LanguageClient_config
    autocmd!
    autocmd User LanguageClientStarted setlocal signcolumn=yes
    autocmd User LanguageClientStopped setlocal signcolumn=auto
augroup END

let g:LanguageClient_autoStart = 1

nnoremap <silent> <space>ld :call LanguageClient#textDocument_definition({'gotoCmd': 'split'})<CR>
nnoremap <silent> <space>lr :call LanguageClient#textDocument_rename()<CR>
nnoremap <silent> <space>lf :call LanguageClient#textDocument_formatting()<CR>
nnoremap <silent> <space>lt :call LanguageClient#textDocument_typeDefinition()<CR>
nnoremap <silent> <space>lx :call LanguageClient#textDocument_references()<CR>
nnoremap <silent> <space>la :call LanguageClient#workspace_applyEdit()<CR>
nnoremap <silent> <space>lc :call LanguageClient#textDocument_completion()<CR>
nnoremap <silent> <space>lh :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> <space>ls :call LanguageClient#textDocument_documentSymbol()<CR>
nnoremap <silent> <space>lm :call LanguageClient#textDocument_contextMenu()<CR>

