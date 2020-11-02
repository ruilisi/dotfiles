function! paiyou#before() abort
  set virtualedit=onemore             " Allow for cursor beyond last character
  set splitright

  " open a NERDTree automatically when vim starts up if no files were specified
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
  " }}}

  let g:neoformat_javascript_jsbeautify = {
        \ 'exe': 'js-beautify',
        \ 'stdin': 1,
        \ }
  let g:neoformat_typescript_prettier = {
        \ 'exe': 'prettier',
        \ 'args': ['--stdin', '--stdin-filepath', '"%:p"', '--parser', 'typescript'],
        \ 'stdin': 1
        \ }
  let g:neoformat_enabled_typescript = ['tsfmt', 'prettier']


  " show all uncompliable symbols
  set listchars=tab:>-,trail:~,extends:>,precedes:<
  set list


  " javascript
  let g:tern#command = ["tern"]
  let g:tern#arguments = ["--persistent"]

  let g:spacevim_custom_plugins = [
        \ ['peitalin/vim-jsx-typescript'],
        \ ['leafgarland/typescript-vim'],
        \ ]

  " typescript
  let g:tagbar_type_typescript = {
        \ 'ctagstype': 'typescript',
        \ 'kinds': [
        \ 'c:classes',
        \ 'n:modules',
        \ 'f:functions',
        \ 'v:variables',
        \ 'v:varlambdas',
        \ 'm:members',
        \ 'i:interfaces',
        \ 'e:enums',
        \ 's:statics',
        \ ]
        \ }


  " disable ctags
  let g:gutentags_ctags_exclude = [ "*.js", "*.jsx", "*.ts", "*.tsx", "*.css", "build", "vendor", ".git", "node_modules", "*.vim/bundle/*", "out" ]
endfunction

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

for fpath in split(globpath(vimsettings, '*.vim'), '\n')
  if (fpath == expand(vimsettings) . "/yadr-keymap-mac.vim") && uname[:4] ==? "linux"
    continue " skip mac mappings for linux
  endif

  if (fpath == expand(vimsettings) . "/yadr-keymap-linux.vim") && uname[:4] !=? "linux"
    continue " skip linux mappings for mac
  endif

  exe 'source' fpath
endfor
