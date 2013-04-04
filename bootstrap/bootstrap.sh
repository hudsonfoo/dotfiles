#!/bin/bash
# Bootstrap a clean environment with dependencies
set -e

THIS_DIR=$(cd `dirname "$0"`; pwd)
OS=`uname`

run_cmd() {
    printf "\033[0;1;37m-> \033[0;1;34m"
    echo $@
    printf "\033[0m"
    $@
}

case "$OS" in
    Linux) . $THIS_DIR/bootstrap_linux.sh;;
    Darwin) . $THIS_DIR/bootstrap_osx.sh;;
    *) echo "Unknown OS: $OS"; exit 1;;
esac

run_cmd git submodule update --init

echo "pip requires sudo"
run_cmd curl https://raw.github.com/pypa/pip/master/contrib/get-pip.py -o /tmp/get-pip.py
run_cmd sudo python /tmp/get-pip.py

echo "virtualenv and virtualenvwrapper require sudo"
run_cmd sudo pip install virtualenv virtualenvwrapper

echo "gem requires sudo"
run_cmd sudo gem install rake
run_cmd rake

echo "############################################################"
echo "# bootstrap complete. re-login for changes to take effect. #"
echo "############################################################"
