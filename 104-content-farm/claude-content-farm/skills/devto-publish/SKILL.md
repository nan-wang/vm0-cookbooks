---
name: devto-publish
description: Publish articles to Dev.to. Use this skill when the article is ready and user wants to publish.
---

# Dev.to Publisher

This skill publishes articles to Dev.to using their official API.

## When to Use

Use this skill when:
- Article content is finalized
- User confirms they want to publish

## Prerequisites

The `DEVTO_API_KEY` environment variable must be set with your Dev.to API key.

To get your API key:
1. Go to https://dev.to/settings/extensions
2. Scroll to "DEV Community API Keys"
3. Enter a description and click "Generate API Key"
4. Copy the key

## How to Use

```bash
devto-publish.sh <article_file> [--title "Title"] [--tags "tag1,tag2,tag3"] [--published true|false] [--image url]
```

### Parameters

| Parameter | Required | Default | Description |
|-----------|----------|---------|-------------|
| article_file | Yes | - | Path to markdown file |
| --title | No | From file | Article title (overrides H1 in file) |
| --tags | No | - | Comma-separated tags (max 4) |
| --published | No | false | Set to `true` to publish immediately |
| --image | No | - | Cover image URL |

### Examples

```bash
# Save as draft (safe default)
devto-publish.sh /home/user/workspace/output/article.md --tags "ai,technology"

# Publish with cover image
devto-publish.sh /home/user/workspace/output/article.md --tags "ai,tech,automation" --image "https://example.com/image.png"

# Publish immediately
devto-publish.sh /home/user/workspace/output/article.md --title "My Article" --tags "tech,ai" --published true
```

## Output

Returns the Dev.to article URL on success.

Response saved to `/tmp/devto/publish_response.json`:
```json
{
  "id": 123456,
  "title": "Article Title",
  "url": "https://dev.to/username/article-slug",
  "published": false
}
```

## Guidelines

1. Always publish with `--published false` first (draft) to review on Dev.to
2. Dev.to supports up to 4 tags per post
3. Tags should be lowercase, no spaces
4. Cover images must be URLs (use image-gen skill's fal.ai URL, or upload elsewhere first)
5. Markdown is fully supported including code blocks with syntax highlighting
