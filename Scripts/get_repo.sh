#! /bin/sh

mkdir -p $PROJECT_PATH
echo "## Attempting to to get rep"
git clone -b $BRANCH $GIT_REPO $PROJECT_PATH
