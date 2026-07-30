# Process Management

## Background Process Exercise

I started a long-running process in the background using:

sleep 300 &

The ampersand allowed the command to run in the background while I continued using the terminal.

I saved and displayed the process ID using:

PID=$!
echo "The process PID is: $PID"

I checked that the process was running using:

ps -p "$PID" -o pid,stat,command

I also viewed the background jobs in my terminal using:

jobs -l

I stopped the process using:

kill "$PID"

The kill command sends a signal to terminate the process with the specified PID.

## What I Learned

I learned how to start a process in the background, locate its process ID, check its status and terminate it safely.

