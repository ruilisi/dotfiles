let javascript_enable_domhtmlcss = 0
let javascript_ignore_javaScriptdoc = 0
let g:javascript_conceal=0
let b:javascript_fold=1

function! IndexComponentSwitch()
  let b:filename=expand('%')
  if b:filename =~ 'index\.js$'
    execute 'edit' substitute(b:filename, "index.js", "component.js", "")
  else
    execute 'edit' substitute(b:filename, "component.js", "index.js", "")
  endif
endfunction

au FileType javascript nmap <leader>s :call IndexComponentSwitch()<cr>
