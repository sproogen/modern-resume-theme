#!/bin/bash

set -e

if [ "$TRAVIS_BRANCH" == "master" ] && [ "$TRAVIS_PULL_REQUEST" == "false" ]; then
  git config --global user.email ${EMAIL};
  git config --global user.name ${USER};

  git fetch origin;
  git checkout master;

  CURRENT_VERSION=v$(gem bump --pretend --no-commit | awk '{ print $3 }');

  # Only bump the tag if the current version already has a tag, if it doesn't exist then the version has been manually updated.
  if [ "$(git tag -l $CURRENT_VERSION)" == "$CURRENT_VERSION" ]; then
    gem bump --skip-ci;
  fi

  gem tag --no-push;
  git push "https://${GITHUB_TOKEN}@${GITHUB_REPO}" master --tags;
fi