function! paiyou#after() abort
  let g:ale_fixers = {
        \   'javascript': ['eslint'],
        \   'ruby': ['rubocop'],
        \}
  let g:ale_fix_on_save = 1
  let g:ctrlp_max_files=0
endfunction

" load customized settings

let vimsettings = '~/.yadr/SpaceVim.d/autoload/settings'
let uname = system("uname -s")

for fpath in split(globpath(vimsettings, 'yadr-keymap*.vim'), '\n')
  echom fpath

  if (fpath == expand(vimsettings) . "/yadr-keymap-mac.vim") && uname[:4] ==? "linux"
    continue " skip mac mappings for linux
  endif

  if (fpath == expand(vimsettings) . "/yadr-keymap-linux.vim") && uname[:4] !=? "linux"
    continue " skip linux mappings for mac
  endif

  exe 'source' fpath
endfor
