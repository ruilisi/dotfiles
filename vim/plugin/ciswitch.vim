if !has('ruby')
      echo "Error: Required vim compiled with +ruby"
      finish
endif

if exists('g:loaded_ruby_fix_plugin')
      finish
endif
let g:loaded_ruby_fix_plugin = 1

command! -nargs=0 L call Switch()

function! Switch()
ruby<<EOF
buf = VIM::Buffer.current
route = buf.name
if (route.end_with? "component.js") || (route.end_with? "index.js")
  target = route.include?("component.js") ? route.sub("component.js", "index.js") : route.sub("index.js", "component.js")
  if FileTest::exist?(target)
    Vim::command("e #{target}")
  else
    print "Target file does not exist!"
  end
else
  print "The current file is incorrect!"
end
EOF
endfunctio
