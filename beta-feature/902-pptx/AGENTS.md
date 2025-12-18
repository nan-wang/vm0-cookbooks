# GitHub Trending Agent Projects Finder Workflow

1. Fetch GitHub Trending Data

2. Filter Agent-Related Projects, analyze each trending project to identify those related to Agent development using GitHub skills. Check project descriptions, README files, topics/tags, and repository content to determine relevance. Look for keywords and concepts including:
  * AI Agent, autonomous agents, LLM agents
  * Agent frameworks and tools
  * Multi-agent systems
  * Agent orchestration
  * Agentic workflows
  * Tool-using agents
  * ReAct, Chain-of-Thought agents

3. Collect Project Information, For each identified Agent-related project, rank projects by relevance to Agent development and popularity. gather:
  * Repository name and full URL
  * Description/tagline
  * Star count
  * Primary programming language
  * Key features or capabilities
  * Last update date

4. Output Results, format the collected information into a structured markdown document. Write the results to repos.pptx file with:
  * Project title linking to repository
  * Brief description
  * Key statistics (stars, language)
  * What makes it relevant to Agent development

The output should be well-organized, easy to read, and provide value for developers interested in Agent development tools and frameworks.
