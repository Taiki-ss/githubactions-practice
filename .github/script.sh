#!/bin/sh

LAST_COMMENT_URL=$(curl -s -H "Authorization: token $GITHUB_TOKEN" $COMMENTS_URL | jq -r '.[-1].url')

MERGE_COMMIT_MESSAGE=$(curl -s -H "Authorization: token ${{ GITHUB_TOKEN }}" https://api.github.com/repos/${{ REPOSITORY }}/commits/${{ MERGE_COMMIT_SHA }} | jq -r .commit.message)

if [[ ! -z "$MERGE_COMMIT_MESSAGE" ]]; then
    echo "Last merge comment: $MERGE_COMMIT_MESSAGE"
fi