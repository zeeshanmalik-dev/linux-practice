# Bash Notes

## What I Learned

### Introduction to Bash Scripting

Bash is a command-line shell used to interact with a computer.

A Bash script is a file containing commands that can be run automatically.

Bash scripting can be used to:

* automate repetitive tasks
* manage files and systems
* install software
* reduce repeated manual commands

### Shebang

A Bash script normally starts with:

```bash
#!/bin/bash
```

This tells the computer to run the script using Bash.

### Running a Bash Script

Make the script executable:

```bash
chmod +x script.sh
```

Run the script:

```bash
./script.sh
```

### Key Advice

Start with simple scripts, use clear variable names and test scripts regularly.

### Comments

* Comments explain code and are not executed.
* A comment starts with `#`.
* Comments can temporarily stop a command from running.

```bash
# Prints a greeting
echo "Hello World"
```

### Running Scripts from Anywhere

* The shell searches directories listed in the `$PATH` variable.
* Scripts placed in a PATH directory can run using only their name.
* Check the PATH with:

```bash
echo "$PATH"
```

### Variables

* Variables store values.
* Do not use spaces around the `=` sign.
* Use `$` to access the stored value.

```bash
name="Zeeshan"
echo "Hello, $name"
```

### Parameters

* Parameters are values passed after the script name.
* `$1`, `$2` and `$3` access them by position.
* `$@` accesses all parameters.

```bash
./script.sh hello world
```

### Greeting Script Practice

My `greet.sh` script can receive a name in two ways.

#### Command-line argument

```bash
./greet.sh Ahmed
```

`Ahmed` becomes the first argument, stored in `$1`.

#### Asking for input

When no argument is provided, the script uses:

```bash
read -p "Enter your name: " name
```

This asks the user for a name and stores it in the `name` variable.

### Extra Practice: Conditions

An `if` statement lets the script make a decision.

```bash
if [ -z "$1" ]; then
    read -p "Enter your name: " name
else
    name="$1"
fi

echo "Hello $name"
```

* `-z "$1"` checks whether the first argument is empty.
* `then` runs when the condition is true.
* `else` runs when the condition is false.
* `fi` ends the condition.

