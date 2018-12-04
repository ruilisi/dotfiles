function! FixEsLint()
  silent !clear
  execute "!" . "yarn eslint --fix " . bufname("%")
  execute "e!"
endfunction

au FileType javascript nmap <leader>e :call FixEsLint()<cr>
