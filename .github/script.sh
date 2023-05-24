#!/bin/sh

DOCBASE_POST_ID=2958885

MERGE_COMMIT_MESSAGE=$(curl -s -H "Authorization: token $GITHUB_TOKEN" https://api.github.com/repos/$REPOSITORY/commits/$MERGE_COMMIT_SHA | jq -r .commit.message)

echo "merge comment '$MERGE_COMMIT_MESSAGE'"

DOCBASE_BODY=$(curl -s -H "X-DocBaseToken: $DOCBASE_API_KEY" https://api.docbase.io/teams/$DOCBASE_TEAMS/posts/$DOCBASE_POST_ID | jq -r .body)

curl \
  -H "X-DocBaseToken: $DOCBASE_API_KEY" \
  -H 'Content-Type: application/json' \
  -X PATCH \
  -d "{
         \"body\": \"$DOCBASE_BODY \n $MERGE_COMMIT_MESSAGE\"
      }" \
  https://api.docbase.io/teams/$DOCBASE_TEAMS/posts/$DOCBASE_POST_ID