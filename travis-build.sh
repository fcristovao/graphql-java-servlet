#!/bin/bash
set -ev

if [ "${TRAVIS_PULL_REQUEST}" = "false" ] && [ "${TRAVIS_BRANCH}" = "master" ] && [ "${RELEASE}" = "true" ]; then
    echo "Deploying release to Bintray"
    ./gradlew clean assemble release -Prelease.useAutomaticVersion=true && ./gradlew check --info && ./gradlew bintrayUpload -x check --info
fi
