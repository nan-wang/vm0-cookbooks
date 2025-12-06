---
name: brightdata-tiktok
description: Scrape TikTok influencer profiles using Bright Data API. Use this skill when the user wants to discover TikTok influencers by keyword.
---

# Bright Data TikTok Scraper

This skill allows you to discover TikTok influencers using Bright Data's web scraping API.

## When to Use

Use this skill when the user:
- Wants to find TikTok influencers in a specific niche
- Needs to discover content creators for collaboration
- Asks for TikTok profiles related to a keyword

## How to Use

### Step 1: Trigger the Scrape

```bash
$CLAUDE_CONFIG_DIR/skills/brightdata-tiktok/scripts/trigger-scrape.sh "search_keyword"
```

This triggers Bright Data to scrape TikTok for the given keyword. It returns a `snapshot_id` that you'll use to fetch results.

**Example:**
```bash
$CLAUDE_CONFIG_DIR/skills/brightdata-tiktok/scripts/trigger-scrape.sh "fitness trainer"
```

### Step 2: Wait for Scraping to Complete

Bright Data needs time to scrape TikTok. Wait approximately 2-3 minutes before fetching results.

### Step 3: Fetch Results

```bash
$CLAUDE_CONFIG_DIR/skills/brightdata-tiktok/scripts/get-snapshot.sh "snapshot_id"
```

**Example:**
```bash
$CLAUDE_CONFIG_DIR/skills/brightdata-tiktok/scripts/get-snapshot.sh "abc123xyz"
```

## Prerequisites

The `BRIGHTDATA_API_KEY` environment variable must be set:

```bash
vm0 secret set BRIGHTDATA_API_KEY "your_api_key"
```

## Output

Results are saved to `/tmp/data/tiktok_[timestamp].json`

Each profile includes:
- `profile_id`: Unique TikTok profile ID
- `profile_username`: TikTok username
- `profile_url`: Direct link to the profile
- `profile_followers`: Number of followers
- `description`: Profile/video description
- `url`: Video URL

## Guidelines

1. Start with broad keywords, then narrow down if needed
2. The API limits results to 5 profiles per search by default
3. If the snapshot is not ready, wait and retry
4. Always check for errors in the API response

## Error Handling

- **"running" status**: Snapshot is still being prepared, wait and retry
- **401 error**: Check if BRIGHTDATA_API_KEY is set correctly
- **Empty results**: Try a different or broader keyword
