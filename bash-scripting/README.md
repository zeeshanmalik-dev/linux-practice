# Bash Scripting

Scripts for the CoderCo Bash module. Each one has comments explaining what it does.

## Scripts

- **1-calculator.sh** - asks for two numbers and prints the result of add, subtract, multiply and divide. Checks for division by zero first so it doesn't crash.
- **2-file-operations.sh** - creates a folder called bash_demo, makes demo.txt inside it with today's date written in, then prints the file.
- **3-file-checker.sh** - asks for a filename, checks it exists, then tells you if it's readable, writable and executable.
- **4-backup.sh** - asks for a source folder, makes a backup folder with a timestamp in the name, copies all the .txt files into it and shows how many it copied.

## What I learned

- `$(( ))` does maths in Bash, but only with whole numbers
- Always check things exist before using them (`-e`, `-f`, `-d`), otherwise scripts fail in confusing ways
- Quote your variables like `"$var"` so filenames with spaces don't break things
- `$(date +...)` is useful for putting timestamps in filenames
- A script that validates input and exits early with a clear error is much easier to trust

## A challenge I ran into

While building a backup script with rotation (keep only the last 5 backups), I ran it 5 times quickly and the backup count didn't go up. The folder names used the time down to the second, so runs in the same second got the same name and overwrote each other. I fixed it by adding `sleep 2` between runs to test it properly. Lesson: timestamps to the second aren't unique if a script runs faster than that.

## Why Bash matters in DevOps

Most servers run Linux, and Bash is how you automate things on them. Backups, deployments, monitoring and CI/CD pipelines all use shell scripts at some point, so being comfortable with it makes the later tools easier to understand.
