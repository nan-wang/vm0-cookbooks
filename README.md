# vm0-cookbooks

A collection of VM0 Agent examples.

## Installation

```bash
pnpm install -g @vm0/cli
```

## Quick Start

```bash
vm0 auth login
cd 101-intro
vm0 cook "echo hello world to readme.md"
```

## Commands

### cook - One-Click Run

The simplest way to run an agent. Automatically handles volume/artifact and executes:

```bash
vm0 cook "your prompt"
```

### build & run - Step-by-Step

```bash
vm0 build vm0.yaml                                    # build configuration
vm0 run <agent-name> --artifact-name <name> "prompt"  # run agent
```

### volume - Manage Agent Config

Volumes store agent's CLAUDE.md and skills:

```bash
vm0 volume init    # initialize
vm0 volume push    # upload to cloud
vm0 volume pull    # download to local
```

### artifact - Manage Work Products

Artifacts store files produced by agent runs:

```bash
vm0 artifact init    # initialize
vm0 artifact push    # upload to cloud
vm0 artifact pull    # download to local
```

### secret - Manage Secrets

```bash
vm0 secret set <name> <value>    # set a secret
vm0 secret list                  # list all secrets
vm0 secret delete <name>         # delete a secret
```

## Creating Your Own Agent

See [vm0-guide.md](docs/vm0-guide.md)
