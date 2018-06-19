#!/bin/bash

if [ "$TRAVIS_BRANCH" == "master" ] && [ "$TRAVIS_PULL_REQUEST" == "false" ]; then
  git remote set-branches --add origin develop;
  git fetch origin develop;

  git checkout develop;

  git merge master;

  if [[ ("$?" -ne "0") ]]; then
    git merge --abort;
    git reset --hard;
    git checkout master;

    CONFLICT_BRANCH_NAME=merge-conflict-$(date | md5sum | head -c 6);

    git checkout -b $CONFLICT_BRANCH_NAME;
    git push "https://${GITHUB_TOKEN}@${GITHUB_REPO}" $CONFLICT_BRANCH_NAME;

    curl -H "Authorization: token ${GITHUB_TOKEN}" -X POST -d '{"title":"Automatic merge failure", "base":"develop", "head":"'$CONFLICT_BRANCH_NAME'"}' "https://api.github.com/repos/${TRAVIS_REPO_SLUG}/pulls";
  else
    git push "https://${GITHUB_TOKEN}@${GITHUB_REPO}" develop;
  fi

  git checkout master;
fi
