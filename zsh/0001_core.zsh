trim() {
  local var
  if (( $# == 0 )) ; then
    var=$(</dev/stdin)
  else
    var="$*"
  fi

  # remove leading whitespace characters
  var="${var#"${var%%[![:space:]]*}"}"
  # remove trailing whitespace characters
  var="${var%"${var##*[![:space:]]}"}"
  printf '%s' "$var"
}
