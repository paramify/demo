# Quick Start Guide

Get up and running in 2 minutes!

## Installation

```bash
git clone https://github.com/paramify/demo.git
cd demo/vuln-fetcher
chmod +x install.sh
./install.sh
```

Follow the prompts to enter your API credentials.

## Usage

```bash
./run.sh
```

That's it! The interactive menu will guide you through importing scans.

## Need Help?

- **Full documentation**: See [README.md](README.md)
- **Developer docs**: See [CLAUDE.md](CLAUDE.md)
- **Troubleshooting**: Check README.md "Troubleshooting" section

## Common Commands

```bash
./run.sh                    # Interactive menu
./run.sh import             # Import from Nessus
./run.sh import-github      # Import from GitHub
./run.sh list-scans         # List Nessus scans
./run.sh list-assessments   # List Paramify assessments
./run.sh --help             # Show all options
```
