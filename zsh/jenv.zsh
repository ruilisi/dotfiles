export PATH="/Users/czwu/.jenv/shims:${PATH}"
source "/usr/local/Cellar/jenv/0.4.4/libexec/libexec/../completions/jenv.zsh"
jenv rehash 2>/dev/null
export JENV_LOADED=1
unset JAVA_HOME
jenv() {
    typeset command
    command="$1"
    if [ "$#" -gt 0  ]; then
      shift
    fi

    case "$command" in
      enable-plugin|rehash|shell|shell-options)
        eval `jenv "sh-$command" "$@"`;;
      *)
        command jenv "$command" "$@";;
    esac
}
