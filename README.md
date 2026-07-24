# GitHub Practice: Worker Generator

A bash script that generates batches of worker text files with sequential IDs, picking up where the last batch left off.

## Technologies used

- **Bash** — the script itself (`#!/bin/bash`)
- **Core Unix utilities**:
  - `mkdir` — create the `workers/` directory
  - `ls` — list existing worker files
  - `sed` — extract the numeric ID from filenames via regex
  - `sort` — sort numbers to find the highest existing ID
  - `tail` — grab the last (highest) value from the sorted list
  - `cat` (with a heredoc) — write each worker file's contents

No external dependencies or packages required — it runs anywhere with a standard bash/Unix environment (Linux, macOS, WSL, etc.).

## What it does

1. **Creates a `workers/` directory** (if it doesn't already exist) and moves into it.
2. **Finds the highest existing worker number** by scanning for files named `workerN.txt`, extracting the number `N` with `sed`, and sorting numerically to get the largest one.
3. **Defaults to 0** if no worker files exist yet (so the first batch starts at 1).
4. **Generates the next 35 files**, numbered from `max_num + 1` to `max_num + 35`. Each file looks like:
   ```
   Employee ID: <number>
   Status: Active
   ```
5. **Prints a summary**: the range of files just created, and the total count of worker files now in the directory.

## Usage

Make the script executable (chmod), then run it

```bash
chmod +x worker_generator.sh
./worker_generator.sh
```

Run it again to generate the next batch of 35 — it automatically continues from the last worker number used.

## Example

First run (empty `workers/` folder):
```
Created worker files from worker1.txt to worker35.txt
Total worker files:
35
```

Second run:
```
Created worker files from worker36.txt to worker70.txt
Total worker files:
70
```

## Skills Demonstrated

- Bash scripting
- Linux file management
- Variables
- Loops
- Automation
- Sequential file creation
- Basic scripting logic

## Notes / things to watch for

- **Batch size (35)** is hardcoded via `end=$((max_num + 35))`. Change the `35` if you want a different batch size.
- **File format** for each worker is defined in the `cat > worker${i}.txt << EOF ... EOF` block — edit the content between `EOF` markers to change what's written to each file.
- The `ls worker*.txt` calls assume you're running this from a location where `workers/` is writable and that no unrelated files match the `workerN.txt` pattern.
