# vm0-cookbooks

A collection of VM0 Agent examples.

## Installation

```bash
npm install -g @vm0/cli
```

## Quick Start

```bash
vm0 auth login
cd 101-intro
vm0 cook "echo hello world to readme.md"
```

## Setup Secrets

All cookbooks require Claude Code authentication. Set up the required secrets:

```bash
# Generate Claude Code OAuth token
claude setup-token

# Set the token as a secret (copy the token from claude setup-token output)
vm0 secret set CLAUDE_CODE_OAUTH_TOKEN <your-token>

# For cookbooks with additional API requirements, set those secrets too
# Example for 103-fetch-stores:
vm0 secret set DUMPLING_AI_API_KEY <your-api-key>

# Example for 104-content-farm:
vm0 secret set FAL_KEY <your-fal-key>
vm0 secret set DEVTO_API_KEY <your-devto-key>
```

Each cookbook may require different API keys. Check the `vm0.yaml` file in each cookbook directory to see which secrets are needed.

## Setup and Run

### Automatic Setup

The simplest way to run an agent. Automatically handles volume and artifact setup:

```bash
cd 101-intro
vm0 cook                  # auto setup
```

### Manual Setup (Step by Step)

Navigate to the example directory:

```bash
cd 101-intro
```

Prepare a volume for CLAUDE.md:

```bash
cd claude-files
vm0 volume init    # Initialize volume
vm0 volume push    # Upload to cloud
cd ..
```

Prepare an artifact for the workspace:

```bash
mkdir artifact
cd artifact
vm0 artifact init    # Initialize artifact
vm0 artifact push    # Upload to cloud
cd ..
```

### Compose and Run

```bash
vm0 compose vm0.yaml
vm0 run intro --artifact-name artifact "echo hello world to readme.md"
```

### Pull the result

```bash
cd my-artifact
vm0 artifact pull
cat readme.md
```

## Creating Your Own Agent

See [vm0-guide.md](docs/vm0-guide.md)
