#!/bin/bash

set -ev

if [ $TRAVIS_BRANCH == 'develop' ]; then
  git config --global user.email ${EMAIL}
  git config --global user.name ${USER}

  gem bump --skip-ci --tag

  git push "https://${GH_TOKEN}@${GH_REPO}" develop --tags > /dev/null 2>&1
fi