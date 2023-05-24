#!/bin/sh

LAST_COMMENT_URL=$(curl -s -H "Authorization: token $GITHUB_TOKEN" $COMMENTS_URL | jq -r '.[-1].url')

if [[ ! -z "$LAST_COMMENT_URL" ]]; then
    LAST_COMMENT_BODY=$(curl -s -H "Authorization: token $GITHUB_TOKEN" $LAST_COMMENT_URL | jq -r '.body')
    echo "Last merge comment: $LAST_COMMENT_BODY"
fi