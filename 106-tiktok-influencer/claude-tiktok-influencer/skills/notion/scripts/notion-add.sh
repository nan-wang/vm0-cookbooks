#!/bin/bash

# Notion - Add Page to Database
# Usage: ./notion-add.sh "database_id" "profile_id" "username" "url" "description" "followers"

set -e

DATABASE_ID="$1"
PROFILE_ID="$2"
USERNAME="$3"
URL="$4"
DESCRIPTION="$5"
FOLLOWERS="$6"

if [ -z "$NOTION_API_KEY" ]; then
    echo "Error: NOTION_API_KEY environment variable is not set"
    exit 1
fi

if [ -z "$DATABASE_ID" ] || [ -z "$PROFILE_ID" ]; then
    echo "Usage: ./notion-add.sh \"database_id\" \"profile_id\" \"username\" \"url\" \"description\" \"followers\""
    exit 1
fi

# Convert followers to number (remove commas, K, M suffixes)
FOLLOWERS_NUM=$(echo "$FOLLOWERS" | sed 's/,//g' | sed 's/K/*1000/' | sed 's/M/*1000000/' | bc 2>/dev/null || echo "0")

echo "Adding influencer to Notion: $USERNAME"

# Create page
RESPONSE=$(curl -s -X POST "https://api.notion.com/v1/pages" \
    -H "Authorization: Bearer $NOTION_API_KEY" \
    -H "Content-Type: application/json" \
    -H "Notion-Version: 2022-06-28" \
    -d "{
        \"parent\": {\"database_id\": \"$DATABASE_ID\"},
        \"properties\": {
            \"Profile ID\": {
                \"title\": [{\"text\": {\"content\": \"$PROFILE_ID\"}}]
            },
            \"Username\": {
                \"rich_text\": [{\"text\": {\"content\": \"$USERNAME\"}}]
            },
            \"URL\": {
                \"url\": \"$URL\"
            },
            \"Description\": {
                \"rich_text\": [{\"text\": {\"content\": \"$(echo "$DESCRIPTION" | head -c 2000)\"}}]
            },
            \"Followers\": {
                \"number\": $FOLLOWERS_NUM
            }
        }
    }")

# Check result
PAGE_ID=$(echo "$RESPONSE" | jq -r '.id // empty')

if [ ! -z "$PAGE_ID" ]; then
    echo "Successfully added page: $PAGE_ID"
    echo "$PAGE_ID"
else
    ERROR=$(echo "$RESPONSE" | jq -r '.message // .error // "Unknown error"')
    echo "Error adding page: $ERROR"
    echo "Response: $RESPONSE"
    exit 1
fi
