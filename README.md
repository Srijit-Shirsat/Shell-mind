# ShellMind

ShellMind is an AI-powered Linux terminal assistant built entirely with Bash. It helps users analyze Linux errors, understand terminal issues, and generate Linux commands using natural language through an interactive command-line interface.

The project combines traditional shell scripting with modern Large Language Models (LLMs) to simplify Linux troubleshooting directly from the terminal.

> **Status:** Under Active Development

---

## Overview

ShellMind is designed to make working with Linux easier by allowing users to interact with an AI assistant without leaving the terminal. Instead of manually searching documentation or forums, users can describe problems in natural language and receive AI-generated guidance.

The project also serves as a practical implementation of Bash scripting, Linux automation, REST APIs, JSON handling, and modular shell application design.

---

## Features

- AI-powered Linux error analysis
- Generate Linux commands using natural language
- Execute generated commands directly from the terminal
- Adaptive execution for single or multiple generated commands
- Automatic AI error analysis after command execution failure
- Dangerous command detection before execution
- Persistent command execution history
- Export AI analysis reports
- Modular Bash architecture
- Configuration management
- Gemini API integration
- JSON parsing using `jq`
- Interactive terminal interface

---

# Demo Workflow

```text
                User Input
                     │
                     ▼
        Natural Language Request
                     │
                     ▼
              Gemini API
                     │
                     ▼
          AI Generated Command(s)
                     │
                     ▼
      Single Command? ─────── No ──────────► User Selects Command
             │
            Yes
             │
             ▼
      Execute Command
             │
      ┌──────┴──────┐
      │             │
   Success       Failure
      │             │
      ▼             ▼
 Return to      Analyze Error?
 Main Menu          │
                    ▼
              AI Error Analysis
                    │
                    ▼
           Export Report (Optional)
```

---

## Tech Stack

| Technology | Purpose |
|------------|---------|
| Bash | Core application |
| Linux | Development environment |
| Gemini API | AI responses |
| curl | REST API communication |
| jq | JSON parsing |
| Git | Version control |

---

## Project Structure

```text
ShellMind/
│
├── config/
│
├── logs/
│   └── history.log
│
├── reports/
│
├── modules/
│   ├── ai_client.sh
│   ├── fix_errors.sh
│   ├── generate_command.sh
│   ├── prompts.sh
│   └── safety.sh
│
├── utils/
│
├── shellmind.sh
│
└── README.md
```

---

# Implemented Features

## Analyze Error

- Accepts Linux or shell errors
- Sends errors to Gemini AI
- Provides:
  - Root Cause
  - Detailed Explanation
  - Suggested Solution
  - Linux Commands
  - Prevention Tips
- Optional report export

---

## Generate Command

Users describe a task in natural language.

Example:

```
Create a directory named projects
```

ShellMind generates:

```
mkdir projects
```

along with:

- Explanation
- Example usage
- Additional notes

---

## Adaptive Command Execution

ShellMind automatically handles both situations:

### Single command

```
mkdir projects
```

Immediately available for execution.

### Multiple commands

```
1. tee
2. >
```

The user selects which command to execute.

---

## Automatic Error Analysis

If an executed command fails:

```
cp abc.txt backup/
```

ShellMind automatically asks:

```
Do you want ShellMind to analyze this error? (Y/n)
```

No manual copy-pasting is required.

## Command History

Every executed command is logged automatically.

Stored information includes:

- Timestamp
- User request
- Generated command
- Exit status
- Command output or error

---

## AI Report Export

Users can save AI-generated troubleshooting reports.

Example:

```
reports/
└── report_2026-07-25_22-15-30.txt
```

Each report contains:

- Original Error
- Cause
- Explanation
- Solution
- Suggested Commands
- Prevention Tips

---

# Learning Objectives

ShellMind was built to gain practical experience with:

- Advanced Bash scripting
- Linux automation
- REST API integration
- JSON request/response handling
- Modular software architecture
- CLI application development
- AI integration into system tools
- Error handling and logging
- Secure command execution

---

# Current Progress

| Module | Status |
|---------|--------|
| Interactive Menu | ✅ Completed |
| Modular Architecture | ✅ Completed |
| Gemini API Integration | ✅ Completed |
| Analyze Error | ✅ Completed |
| Generate Command | ✅ Completed |
| Automatic Command Execution | ✅ Completed |
| Automatic AI Error Analysis | ✅ Completed |
| Dangerous Command Detection | ✅ Completed |
| Command Execution Logging | ✅ Completed |
| AI Report Export | ✅ Completed |
| Configuration Management | ✅ Completed |
| Colored Terminal UI | 🚧 Planned |
| Session History | 🚧 Planned |
| Multiple AI Providers | 🚧 Planned |
| Unit Testing | 🚧 Planned |

---

## Why ShellMind?

ShellMind was created as a learning project to explore how modern AI models can be integrated into traditional Linux command-line tools. The project focuses on writing maintainable Bash scripts while implementing real-world concepts such as API communication, JSON processing, modular architecture, and automation.

---

## Contributing

Contributions, suggestions, and improvements are always welcome.

If you would like to contribute:

1. Fork the repository.
2. Create a new feature branch.
3. Commit your changes.
4. Open a Pull Request.

---

## License

This project is licensed under the MIT License.
