#!/bin/bash

set -ev

if [ "$TRAVIS_BRANCH" == "master" ] && [ "$TRAVIS_PULL_REQUEST" == "false" ]; then
    git remote set-branches --add origin develop;
    git fetch origin develop;

    git checkout develop;

    git merge master;

    if [[ ("$?" -ne "0") ]]; then
        git merge --abort;
        git reset --hard;

        curl -H "Authorization: token ${GITHUB_TOKEN}" -X POST -d '{"title":"Upstream merge conflict", "base":"develop", "head":"master"}' "https://api.github.com/repos/${TRAVIS_REPO_SLUG}/pulls";
    else
        git push "https://${GITHUB_TOKEN}@${GITHUB_REPO}" develop;
    fi

    git checkout master;
fi
