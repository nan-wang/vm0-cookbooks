---
name: image-gen
description: Generate images using fal.ai Nano Banana Pro API. Use this skill when you need to create a featured image for blog content.
---

# Image Generator (Nano Banana Pro)

This skill generates high-quality images using the fal.ai Nano Banana Pro API (powered by Google Gemini 3 Pro Image).

## When to Use

Use this skill when:
- Creating a featured image for a blog post
- Need a visual representation of the article topic
- Want to generate custom illustrations for content

## Prerequisites

The `FAL_KEY` environment variable must be set with your fal.ai API key.

## How to Use

Execute the script with a prompt describing the desired image:

```bash
image-gen.sh "prompt" [aspect_ratio] [resolution]
```

### Parameters

| Parameter | Required | Default | Description |
|-----------|----------|---------|-------------|
| prompt | Yes | - | Text description of the image to generate |
| aspect_ratio | No | 16:9 | Image aspect ratio (1:1, 16:9, 4:3, 9:16, etc.) |
| resolution | No | 1K | Image resolution (1K, 2K, 4K) |

### Examples

```bash
# Generate a blog header image
image-gen.sh "A futuristic cityscape with AI robots, digital art style, vibrant colors"

# Generate a square image for social media
image-gen.sh "Modern tech startup office with developers" "1:1"

# Generate a high-resolution vertical image
image-gen.sh "Abstract neural network visualization" "9:16" "2K"
```

## Output

- Images are saved to `/tmp/images/generated_[timestamp].png`
- The script outputs the file path upon completion
- Image URL from fal.ai is also displayed

## Response Format

The fal.ai API returns:
```json
{
  "images": [{
    "url": "https://storage.googleapis.com/...",
    "width": 1920,
    "height": 1080,
    "content_type": "image/png"
  }]
}
```

## Guidelines

1. Use descriptive prompts for best results
2. Include style hints like "digital art", "photorealistic", "minimalist"
3. Specify colors and mood when relevant
4. For blog headers, use 16:9 aspect ratio
5. 1K resolution is usually sufficient for web use
6. Add "professional", "clean", "modern" for business content

## Pricing

- 1K resolution: ~$0.15 per image
- 2K resolution: ~$0.15 per image
- 4K resolution: ~$0.30 per image
