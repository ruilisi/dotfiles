" Set the shell to bash so we inherit its path, to make sure
" we inherit its path. This affects :Rtags finding the right
" path to homebrewed ctags rather than the XCode version of ctags
if has("unix")
  let s:uname = system("uname -s")
  if s:uname =~ "Darwin"
		set shell=/usr/local/bin/zsh
  else
		set shell=/usr/bin/zsh
  endif
elseif has('win32')
endif
