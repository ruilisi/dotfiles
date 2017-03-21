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

function ss_connect () {
  (killall sslocal 2>&1) >/dev/null
  IP=$(getIP $1)
  SERVER_PORT=${2:-443}
  METHOD=${4:-'aes-256-cfb'}
  if [ "$3" != "" ]; then
    SERVER_PASS=$3
  else
    SERVER_PASS=$SS_PASS
  fi
  cat > /tmp/config.json << EOT
  {
    "server" : "$IP",
    "server_port": $SERVER_PORT,
    "local_port": 1080,
    "password" : "$SERVER_PASS",
    "timeout": 600,
    "method" : "$METHOD"
  }
EOT
  shadowsocks-local -c /tmp/config.json
}
#A=("one" "two" "three four")
#if [ $(contains "${A[@]}" "one") == "y" ]; then
  #echo "contains one"
#fi
#if [ $(contains "${A[@]}" "three") == "y" ]; then
  #echo "contains three"
#fi

function cp_container() {
  sourceName=$1
  targetName=$2
  cp $sourceName $targetName -r
  cd $targetName
  mv ${sourceName}.scss ${targetName}.scss
  mv ${sourceName}.js ${targetName}.js
  cd ..
}
function sync(){
  server=$1
  branch=$2
  if [ "$branch" = "" ]; then
    branch=master
  fi
  git checkout $branch
  git add .; gca! --no-edit;
  gpu $branch --force;
  ssh $server "cd /root/No.497-H5-yuejian; git checkout -f $branch; git fetch upstream $branch; git reset upstream/$branch --hard;"
}
function test_proxy() {
  curl www.google.com
}
function set_proxy() {
  export all_proxy=http://127.0.0.1:8118/
  # export https_proxy=socks5://127.0.0.1:1080/
  # export http_proxy=socks5://127.0.0.1:1080/
}
function set_ss_proxy() {
  export https_proxy=socks5://127.0.0.1:1080/
  export http_proxy=socks5://127.0.0.1:1080/
}
function unset_proxy() {
  unset all_proxy
}
function install_jsctags {
  npm install jsctags -g
  # https://github.com/mozilla/doctorjs/issues/52
  # gsed -i '51i tags: [],' ./node_modules/jsctags/jsctags/ctags/index.js
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
function recursive_replace {
  if [ "$#" -ne 3 ]; then
    echo "recursive_replace \"FILE_PATTERN\" BEFORE AFTER"
    return
  fi
	find . -type f -name $1 -print0 | xargs -0 sed -i "s/$2/$3/g"
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
