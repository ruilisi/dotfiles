if [[ "$(uname)" != "Darwin" ]]; then
  return
fi

alias list_identities='security find-identity -v -p codesigning'
