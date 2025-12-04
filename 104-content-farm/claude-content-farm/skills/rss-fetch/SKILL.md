---
name: rss-fetch
description: Fetch and parse RSS feeds from popular tech news sources. Use this skill when the user wants to gather news articles for content creation.
---

# RSS Feed Fetcher

This skill fetches and parses RSS feeds from multiple tech news sources, extracting article titles, descriptions, links, and publication dates.

## When to Use

Use this skill when:
- Starting the content creation workflow
- Need to gather recent news articles on a topic
- Want to find trending stories for blog inspiration

## How to Use

Execute the script located at `skills/rss-fetch/scripts/rss-fetch.sh`:

```bash
rss-fetch.sh
```

## Included RSS Sources

The script fetches from these pre-configured sources:
- **Hacker News** - Tech community discussions and links
- **TechCrunch** - Startup and technology news
- **Wired** - Technology, science, and culture
- **Ars Technica** - Technology and science reporting
- **The Verge** - Technology, science, art, and culture

## Output

Results are saved to `/tmp/rss/feeds.json` with this structure:

```json
{
  "fetched_at": "2024-01-15T10:30:00Z",
  "sources": ["hnrss.org", "techcrunch.com", ...],
  "articles": [
    {
      "title": "Article Title",
      "description": "Article summary...",
      "link": "https://...",
      "pubDate": "2024-01-15T09:00:00Z",
      "source": "techcrunch.com"
    }
  ]
}
```

## Guidelines

1. Run this skill at the beginning of the content creation workflow
2. After fetching, analyze the articles to find relevant topics
3. Use the article links as sources for your generated content
4. Filter articles based on the user's specified topic/keywords
