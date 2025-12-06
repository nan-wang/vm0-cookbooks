---
name: notion
description: Add and update data in Notion database. Use this skill to store influencer data and analysis results.
---

# Notion Skill

This skill allows you to add and update pages in a Notion database.

## When to Use

Use this skill when the user wants to:
- Store influencer data in Notion
- Update analysis results in a Notion database
- Query existing data from Notion

## Setup Requirements

1. Create a Notion Integration: https://www.notion.so/my-integrations
2. Copy the Integration Token (starts with `ntn_` or `secret_`)
3. Create a database in Notion with the required columns
4. Share the database with your integration (click "..." → "Add connections")

## Database Structure

Create a Notion database with these properties:

| Property | Type |
|----------|------|
| Profile ID | Title |
| Username | Text |
| URL | URL |
| Description | Text |
| Followers | Number |
| Collaboration | Select (options: "Highly Relevant", "Not Relevant") |
| Analysis | Text |

## How to Use

### Add a Page (New Influencer)

```bash
$CLAUDE_CONFIG_DIR/skills/notion/scripts/notion-add.sh "database_id" "profile_id" "username" "url" "description" "followers"
```

### Update a Page (Add Analysis)

```bash
$CLAUDE_CONFIG_DIR/skills/notion/scripts/notion-update.sh "page_id" "collaboration" "analysis"
```

### Query Database

```bash
$CLAUDE_CONFIG_DIR/skills/notion/scripts/notion-query.sh "database_id"
```

## Environment Variables

- `NOTION_API_KEY`: Your Notion Integration Token

## Examples

```bash
# Add new influencer
notion-add.sh "abc123" "12345" "@fitness_guru" "https://tiktok.com/@fitness_guru" "Personal trainer" "150000"

# Update with analysis
notion-update.sh "page-id-xxx" "Highly Relevant" "Great fit for fitness brand with engaged audience"

# Query all entries
notion-query.sh "abc123"
```
