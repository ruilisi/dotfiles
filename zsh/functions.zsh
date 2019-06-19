function secure_source () {
  if [ -e $1 ]; then
    source $1
  fi
}
function contains() {
  local n=$#
  local value=${!n}
  for ((i=1;i < $#;i++)) {
    if [ "${!i}" == "${value}" ]; then
      echo "y"
      return 0
    fi
  }
  echo "n"
  return 1
}

function getIP () {
  echo $(grep $1 ~/.ssh/config -A 1 | tail -1 | tr -s ' ' | cut -d ' ' -f 3)
}

function getServerName () {
  echo $(grep $1 ~/.ssh/config -B 1 | head -1 | tr -s ' ' | cut -d ' ' -f 3)
}

function ssh_exec_by_file () {
  ssh -t $1 "bash -s" -- < $2
}

function cp_container() {
  sourceName=$1
  targetName=$2
  cp $sourceName $targetName -r
  cd $targetName
  mv ${sourceName}.scss ${targetName}.scss
  mv ${sourceName}.js ${targetName}.js
  cd ..
}
function set_proxy() {
  export http_proxy=http://127.0.0.1:8119;export https_proxy=http://127.0.0.1:8119;
}
function set_ss_proxy() {
  export https_proxy=socks5://127.0.0.1:1080/
  export http_proxy=socks5://127.0.0.1:1080/
}
function unset_proxy() {
  unset all_proxy
}
function post {
  curl -H "Content-Type: application/json" -X POST -d $1 $2
}
function git-set-remote {
  git remote rm origin
  git remote rm upstream
  git remote add origin $1
  git remote add upstream $1
}
function search_installed_packages {
  dpkg --get-selections | grep $1
}
function delete_packages {
  sudo apt remove `_search_installed_packages $1 | cut -f 1 | tr "\n" " "`
}
function gem_source_to_taobao {
  gem source -r https://rubygems.org/
  gem source -a https://ruby.taobao.org
}

function set_anonymous {
  git filter-branch --env-filter '
  if [ "$GIT_AUTHOR_NAME" = "ralletstellar" ]; then \
    export GIT_AUTHOR_NAME="Anonymous" GIT_AUTHOR_EMAIL="anonymous@anonymous.com"; \
  fi
  '
}
function genAndroidKeystore {
keytool -genkey -v -keystore /tmp/.keystore -alias rallets -keyalg RSA -keysize 2048 -validity 10000
}
function delete_except_latest {
  total=`ll | wc -l`
  num_to_delete=$((total-$1))
  ls -t | tail -n $num_to_delete | xargs rm
}
function strip_color() {
  sed "s,$(printf '\033')\\[[0-9;]*[a-zA-Z],,g"
}
function docker_rm_all() {
  docker rm -f `docker ps --no-trunc -aq`
}
function Replace () {
	if [[ "$(uname)" == "Darwin" ]]; then
		if [ "$#" -eq 3 ]; then
			ag $2 -l -G "$1" | xargs sed -i '' s/$2/$3/g
		elif [ "$#" -eq 2 ]; then
			ag $1 -l | xargs sed -i '' s/$1/$2/g
		fi
	elif [[ "$(expr substr $(uname -s) 1 5)" == "Linux" ]]; then
		if [ "$#" -eq 3 ]; then
			ag $2 -l -G $1 | xargs sed -i s/$2/$3/g
		elif [ "$#" -eq 2 ]; then
			ag $1 -l | xargs sed -i s/$1/$2/g
		fi
  fi
}
function git-change-module-remote() {
  git config --file=.gitmodules submodule.$1.url $2
  git config --file=.gitmodules submodule.$1.branch $3
  git submodule sync
  git submodule update --init --recursive --remote
}
function replace() {
  ag -l -G $1 | xargs sed -ri.bak -e "s/$2/$3/g"
}
function markdown-preview() {
  cat $1 | instant-markdown-d > /dev/null 2>&1
}
function swap() {
  if [ $# -ne 2 ]; then
    echo "Usage: swap file1 file2"
  else
    local TMPFILE=$(mktemp)
    mv "$1" $TMPFILE
    mv "$2" "$1"
    mv $TMPFILE "$2"
  fi
}

function init_db() {
  dc exec $1 rails db:drop db:create db:migrate db:seed
}

function gitcopy() {
  n=1
  while getopts "c:n:t:" o; do
    case "${o}" in
      c)
        commit=${OPTARG}
        ;;
      n)
        n=${OPTARG}
        ;;
      t)
        trelloCardName=${OPTARG}
        ;;
      *)
        usage
        ;;
    esac
  done
  prefix=`git remote get-url origin | sed -E 's/git@github.com:/https:\/\/github.com\//g' | sed -E 's/(.*)\.git/\1/'`
  project_name=`echo $prefix | sed -E 's/.*\/(.*)/\1/'`
  commits=`git log $commit --pretty="* [$project_name]($prefix/commit/%H) %an: **%s**" | head -n $n`
  which pbcopy
  if [[ $? == '0' ]]; then
    echo $commits | pbcopy
  fi
  if [[ "$trelloCardName" != '' ]]; then
    ruby ~/Projects/rallets-hub/bin/create_trello_todo_card.rb -n $trelloCardName -d "$commits"
  fi
}

function h() {
  helm $* --tls
}
function kexec {
  RAN=false
  while getopts ":rp:" opt; do
    case "${opt}" in
      r)
        RAN=true
        ;;
      p)
        PROJECT=$OPTARG
        ;;
      *)
        echo "Usage: cmd [-h]"
        return
        ;;
    esac
  done
  shift $(($OPTIND - 1))

  echo 'waiting...'
  while true; do
    POD_NAME=`k get pods | grep $PROJECT | awk '{print $1}'`
    POD_NAMES=("${(f)POD_NAME}")
    echo ${POD_NAMES[@]}
    OK=true
    for i in $POD_NAMES; do
      READY=`k get pods $i | grep $PROJECT | awk '{print $2}'`
      READYS=("${(@s|/|)READY}")
      STATE=`k get pods $i | grep $PROJECT | awk '{print $3}'`
      if [[ ${READYS[1]} -eq 0 || "${STATE}" -ne "Running" ]]; then
        OK=false
        break
      fi
    done
    if [[ $OK == 'false' ]];then
      sleep 2
      continue
    fi
    if [[ $RAN == 'true' ]];then
      input=`shuf -i 1-${#POD_NAMES[@]} -n 1`
      break
    fi
    if [ ${#POD_NAMES[@]} -eq 1 ];then
      input=1
      break
    elif [ ${#POD_NAMES[@]} -gt 1 ];then
      echo 'Pods:'
      INDEX=1
      for i in $POD_NAMES;do
        echo "[$INDEX] $i"
        let INDEX=${INDEX}+1
      done
      echo "select option to execute: "
      while true;do
        read input
        if [[ $input -gt 0 && $input -le ${#POD_NAMES[@]} ]];then
          break
        else
          echo 'invalid option...'
        fi
      done
      break
    fi
  done
  echo "executing pod $POD_NAMES[$input]..."
  kubectl exec -it $POD_NAMES[$input] $@
}

function klogs {
  TEXT=$1
  POD_NAME=`k get pods | grep $TEXT | awk '{print $1}'`
  kubectl logs -f $POD_NAME
}

function rgm {
  args=("${(@s/,/)1}")
  regex=${(j:.*\n.*:)args}
  echo "Rip Search with $regex..."
  rg -U $regex
}

function dc {
  if [ -e ./docker-compose-dev.yml ]; then
    docker_file_path=./docker-compose-dev.yml
  else
    docker_file_path=~/Projects/rallets-hub/docker-compose-dev.yml
  fi
  docker-compose -f $docker_file_path $@
}
