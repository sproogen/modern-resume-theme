#!/bin/bash

set -ev

if [ "$TRAVIS_BRANCH" == "master" ] && [ "$TRAVIS_PULL_REQUEST" == "false" ]; then
  gem install gem-release --pre;

  git config --global user.email ${EMAIL};
  git config --global user.name ${USER};

  git checkout master;

  gem bump --skip-ci;
  gem tag --no-push;

  git push "https://${GITHUB_TOKEN}@${GITHUB_REPO}" master --tags;
fi
