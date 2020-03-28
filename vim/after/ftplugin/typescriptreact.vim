function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <buffer> <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <buffer> <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" ctrl-space
inoremap <buffer> <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" if has('patch8.1.1068')
"   " Use `complete_info` if your (Neo)Vim version supports it.
"   inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
" else
"   imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" endif

" Symbol renaming.
nmap <buffer> <leader>rn <Plug>(coc-rename)

" GoTo code navigation.
nmap <buffer> <silent> gd <Plug>(coc-definition)
" nmap <buffer> <silent> gy <Plug>(TsuquyomiSignatureHelp)
nmap <buffer> <silent> gi <Plug>(coc-implementation)
nmap <buffer> <silent> gr <Plug>(coc-references)

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
setlocal signcolumn=yes
setlocal hidden
setlocal updatetime=300
setlocal cmdheight=2
setlocal shortmess+=c

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
