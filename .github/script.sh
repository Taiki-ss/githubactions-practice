#!/bin/sh

MERGE_COMMIT_MESSAGE=$(curl -s -H "Authorization: token ${{ GITHUB_TOKEN }}" https://api.github.com/repos/${{ REPOSITORY }}/commits/${{ MERGE_COMMIT_SHA }} | jq -r .commit.message)

echo "$MERGE_COMMIT_MESSAGE"