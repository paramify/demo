# Vuln-Fetcher Tutorial Video Script

**Duration**: ~5-7 minutes
**Target Audience**: Security professionals, compliance teams, IT administrators

---

## Opening (0:00 - 0:30)

**[Screen: Show title card with vuln-fetcher logo/name]**

**Narrator**:
"Hi everyone! Today I'm going to show you how to use vuln-fetcher, a Python CLI tool that makes it incredibly easy to import Nessus vulnerability scans directly into your Paramify assessments. Whether you're running live Nessus scans or storing scan files in GitHub, this tool streamlines your entire vulnerability management workflow."

---

## What is Vuln-Fetcher? (0:30 - 1:00)

**[Screen: Show GitHub repo page - https://github.com/paramify/demo/tree/main/vuln-fetcher]**

**Narrator**:
"Vuln-fetcher is a Python command-line tool that bridges the gap between your vulnerability scanning and compliance workflows. It connects to your Nessus instance, exports scans, and uploads them directly to Paramify assessments. You can also import scan files stored in GitHub repositories - perfect for teams that version control their security artifacts."

**[Screen: Show simple diagram: Nessus → Vuln-Fetcher → Paramify]**

**Narrator**:
"The tool handles all the complexity - API authentication, file format conversions, and proper metadata handling - so you can focus on what matters: securing your infrastructure."

---

## Installation (1:00 - 2:30)

**[Screen: Terminal window, starting in home directory]**

**Narrator**:
"Let's get started with installation. First, clone the repository from GitHub."

**[Type command]**
```bash
git clone https://github.com/paramify/demo.git
cd demo/vuln-fetcher
```

**Narrator**:
"Now we'll create a Python virtual environment to keep our dependencies isolated."

**[Type command]**
```bash
python3 -m venv venv
source venv/bin/activate
```

**[Screen: Show (venv) appears in prompt]**

**Narrator**:
"Notice the 'venv' indicator in your prompt - this means our virtual environment is active. Now let's install the dependencies."

**[Type command]**
```bash
pip install -r requirements.txt
```

**[Screen: Show installation output scrolling]**

**Narrator**:
"Great! Now we need to configure our API credentials. The tool comes with an example configuration file."

**[Type command]**
```bash
cp .env.example .env
```

**[Screen: Open .env file in text editor]**

**Narrator**:
"Open the .env file in your favorite text editor. You'll need to fill in five required values:"

**[Screen: Highlight each field as mentioned]**

**Narrator**:
"First, your Paramify API key and base URL. Then your Nessus instance URL - typically localhost:8834 - and your Nessus API access and secret keys. The GitHub token is optional, only needed if you're importing from private repositories."

**[Screen: Show blurred/redacted credentials being entered]**

**Narrator**:
"I'll skip entering my actual credentials on camera, but you'll paste your real keys here. Save the file, and we're ready to go!"

---

## First Run - Testing Connections (2:30 - 3:30)

**[Screen: Terminal]**

**Narrator**:
"Let's verify our setup by testing our connections. First, let's see if we can connect to Nessus."

**[Type command]**
```bash
./run.sh list-scans
```

**[Screen: Show formatted table of Nessus scans]**

**Narrator**:
"Perfect! We can see all our available Nessus scans with their status. Now let's check our Paramify connection."

**[Type command]**
```bash
./run.sh list-assessments
```

**[Screen: Show formatted table of Paramify assessments]**

**Narrator**:
"Excellent! We can see all our Paramify assessments. Both connections are working, so we're ready to import our first scan."

---

## Demo 1: Importing from Nessus (3:30 - 5:00)

**[Screen: Terminal]**

**Narrator**:
"Now for the main event - let's import a Nessus scan into Paramify. I'll use the interactive menu, which makes this super easy."

**[Type command]**
```bash
./run.sh
```

**[Screen: Show unified menu with 5 options]**

**Narrator**:
"The tool presents a clean menu with all available options. I'll choose option 1 to import from Nessus."

**[Type: 1 and press Enter]**

**[Screen: Show list of scans with numbers]**

**Narrator**:
"Here's where the numbered selection really shines. Instead of copying and pasting long scan IDs, I just enter the number. I'll select scan number 2."

**[Type: 2 and press Enter]**

**[Screen: Show list of assessments]**

**Narrator**:
"Now I select which Paramify assessment to upload to. I'll choose assessment number 1."

**[Type: 1 and press Enter]**

**[Screen: Prompt for effective date]**

**Narrator**:
"The tool asks for an effective date. This is when the scan data should be considered effective in Paramify. I can enter a specific date in YYYY-MM-DD format, or just press Enter to use today's date."

**[Press Enter]**

**[Screen: Show confirmation summary]**

**Narrator**:
"Before doing anything, the tool shows us a summary of what it's about to do. This is our chance to review and make sure everything looks correct. Looks good, so I'll type 'y' to proceed."

**[Type: y and press Enter]**

**[Screen: Show progress messages]**

**Narrator**:
"Watch what happens now. The tool connects to Nessus, requests an export, waits for it to be ready, downloads the scan file, and uploads it to Paramify - all automatically."

**[Screen: Show success message with artifact ID]**

**Narrator**:
"Success! We get back the artifact ID, filename, and effective date. Our scan is now in Paramify and ready for assessment work."

---

## Demo 2: Importing from GitHub (5:00 - 6:00)

**[Screen: Terminal, back at menu]**

**Narrator**:
"The tool can also import scan files stored in GitHub repositories. This is great for teams that store their security artifacts in version control. Let me show you how. I'll choose option 2."

**[Type: 2 and press Enter]**

**[Screen: Prompt for repository]**

**Narrator**:
"I'll enter the GitHub repository URL. You can paste a full URL or just use the owner/repo format."

**[Type: paramify/demo and press Enter]**

**[Screen: Prompt for GitHub token]**

**Narrator**:
"Since this is a public repository, I'll skip the GitHub token by pressing Enter. For private repos, you'd paste your token here."

**[Press Enter]**

**[Screen: Show list of found scan files]**

**Narrator**:
"The tool recursively searches the repository and finds all .nessus and .csv files. I'll select file number 1."

**[Type: 1 and press Enter]**

**[Screen: Show assessment selection and confirmation]**

**Narrator**:
"Just like before, I select an assessment, set the effective date, and confirm. The tool downloads the file from GitHub and uploads it to Paramify."

**[Screen: Show success message]**

**Narrator**:
"Another successful import! This workflow is perfect for importing historical scans or integrating with your existing artifact storage."

---

## Advanced Tips (6:00 - 6:30)

**[Screen: Terminal showing help command]**

**Narrator**:
"A few quick tips before we wrap up. You can bypass the interactive menu by using direct commands."

**[Type command]**
```bash
./run.sh import --scan-id 8 --assessment-id 5b724986-d2ae-4b7b-b7c8-b597d76e65bc --effective-date 2025-02-15
```

**Narrator**:
"This is great for automation and scripting. You can also use the help flag to see all available options."

**[Type command]**
```bash
./run.sh --help
```

**[Screen: Show help output]**

---

## Troubleshooting (6:30 - 7:00)

**[Screen: Show README.md in browser]**

**Narrator**:
"If you run into any issues, the README has a comprehensive troubleshooting section covering common problems like SSL certificate errors, authentication issues, and connection problems."

**[Screen: Scroll through troubleshooting section]**

**Narrator**:
"There's also a CLAUDE.md file with detailed developer documentation if you want to extend the tool or understand how it works under the hood."

---

## Closing (7:00 - 7:30)

**[Screen: Back to GitHub repo page]**

**Narrator**:
"And that's it! Vuln-fetcher makes it incredibly easy to get your Nessus scans into Paramify, whether you're working with live scans or archived files in GitHub. The tool is open source and available at github.com/paramify/demo in the vuln-fetcher folder."

**[Screen: Show final title card with key points]**

**On-screen text**:
- Clone: github.com/paramify/demo
- Install: pip install -r requirements.txt
- Configure: Edit .env file
- Run: ./run.sh

**Narrator**:
"Give it a try, and let us know how it works for your workflow. Thanks for watching!"

**[Fade out]**

---

## B-Roll Suggestions

Throughout the video, consider showing:
- Quick cuts of the tool running
- The Paramify web interface showing imported artifacts
- The Nessus web interface showing scans
- GitHub repository file structure
- Split screen of before/after in Paramify

## Production Notes

1. **Pace**: Keep it moving - each section should flow quickly
2. **Screencasts**: Use a clean terminal with good contrast
3. **Cursor**: Highlight cursor movements so viewers can follow
4. **Pauses**: Brief pause after each command to let viewers read
5. **Music**: Light background music, not too prominent
6. **Captions**: Add captions for accessibility
7. **Actual Credentials**: Always blur/redact API keys and tokens

## Alternative Short Version (2-3 minutes)

If you need a shorter version:
1. Opening (0:00 - 0:20) - What is it?
2. Quick setup (0:20 - 1:00) - Install and configure
3. Single demo (1:00 - 2:00) - Import from Nessus
4. Closing (2:00 - 2:30) - Where to get it

Focus on the core workflow and skip the GitHub import demo.
