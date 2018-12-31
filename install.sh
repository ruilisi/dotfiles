#!/bin/sh

exists () {
  which $1 &> /dev/null; echo $?
}

declare -a tools=("zsh" "git" "rake")

for tool in "${tools[@]}"; do
  if [ `exists $tool` != "0" ]; then
    if [ "$(uname)" = "Darwin" ]; then
      brew install $tool
    elif [ "$(expr substr $(uname -s) 1 5)" = "Linux" ]; then
      apt $tool -y
    fi
  fi
done

if [ `exists fc-cache` != "0" ]; then
  if [ "$(uname)" = "Darwin" ]; then
    brew install fontconfig
  elif [ "$(expr substr $(uname -s) 1 5)" = "Linux" ]; then
    apt fc-cache -y
  fi
fi

if [ ! -d "$HOME/.yadr" ]; then
    echo "Installing YADR for the first time"
    git clone --depth=1 https://github.com/rallets-network/dotfiles.git "$HOME/.yadr"
    cd "$HOME/.yadr"
    [ "$1" = "ask" ] && export ASK="true"
    rake install
else
    echo "YADR is already installed"
fi
