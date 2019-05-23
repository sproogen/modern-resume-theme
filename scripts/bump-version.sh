#!/bin/bash

set -e

if [ "$TRAVIS_BRANCH" == "master" ] && [ "$TRAVIS_PULL_REQUEST" == "false" ]; then
  git config --global user.email ${EMAIL};
  git config --global user.name ${USER};

  git fetch origin;
  git checkout master;

  CURRENT_VERSION=v$(gem bump --pretend --no-commit | awk '{ print $3 }');

  # Only bump the version if the current version already has a tag, if it doesn't exist then the version has been manually updated.
  if [ "$(git tag -l $CURRENT_VERSION)" == "$CURRENT_VERSION" ]; then
    CURRENT_VERSION=$(gem bump --pretend --no-commit | awk '{ print $3 }');
    gem bump --skip-ci;
    NEW_VERSION=$(gem bump --pretend --no-commit | awk '{ print $3 }');
    sed -i -e "s/modern-resume-theme (${CURRENT_VERSION})/modern-resume-theme (${NEW_VERSION})/g" ./Gemfile.lock;
    git add Gemfile.lock;
    git commit --amend --no-edit;
  fi

  gem tag --no-push;
  git push "https://${GITHUB_TOKEN}@${GITHUB_REPO}" master --tags;
fi