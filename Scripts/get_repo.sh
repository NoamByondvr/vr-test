#! /bin/sh

mkdir -p $PROJECT_PATH
echo "## Attempting to to get rep"

git config --global http.postBuffer 1048576000
git clone -b $BRANCH $GIT_REPO $PROJECT_PATH
