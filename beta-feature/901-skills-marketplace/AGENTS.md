# GitHub Trending Agent Projects Finder Workflow

This workflow finds Agent development related projects from today's GitHub trending repositories and outputs them to repos.md.

## Stage 1: Fetch GitHub Trending Data
Search for today's GitHub trending repositories. Access GitHub trending page or use GitHub API to get the list of popular projects from the current day.

## Stage 2: Filter Agent-Related Projects
Analyze each trending project to identify those related to Agent development using GitHub skills. Look for keywords and concepts including:
- AI Agent, autonomous agents, LLM agents
- Agent frameworks and tools
- Multi-agent systems
- Agent orchestration
- Agentic workflows
- Tool-using agents
- ReAct, Chain-of-Thought agents

Check project descriptions, README files, topics/tags, and repository content to determine relevance.

## Stage 3: Collect Project Information
For each identified Agent-related project, gather:
- Repository name and full URL
- Description/tagline
- Star count
- Primary programming language
- Key features or capabilities
- Last update date

Rank projects by relevance to Agent development and popularity.

## Stage 4: Output Results
Format the collected information into a structured markdown document. Write the results to repos.md file with:
- Project title linking to repository
- Brief description
- Key statistics (stars, language)
- What makes it relevant to Agent development

The output should be well-organized, easy to read, and provide value for developers interested in Agent development tools and frameworks.
