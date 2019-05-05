# Makes git auto completion faster favouring for local completions
__git_files () {
    _wanted files expl 'local files' _files
}
alias gfR='gf origin master; gwR origin/master'
alias gpb='git push origin "$(git-branch-current 2> /dev/null):build"'
alias gitUserRallet="git config user.name rallets;git config user.email rallet@rallets.com"
alias gfs="gs;gfr;gsp"
