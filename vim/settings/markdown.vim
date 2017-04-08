let g:instant_markdown_slow = 1
let g:instant_markdown_autostart = 1
augroup filetype_markdown
  autocmd!
  autocmd FileType mkd setlocal spell
  autocmd FileType mkd setlocal sw=2 ts=2
  autocmd BufNewFile,BufReadPost *.md set filetype=markdown
  let g:vim_markdown_initial_foldlevel=1
augroup END
