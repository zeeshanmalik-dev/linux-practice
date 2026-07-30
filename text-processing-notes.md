# Text Processing

## Practice File

I created a sample log file to practise Linux text-processing commands:

printf 'ERROR: Login failed\nINFO: User logged in\nWARNING: Disk space low\nERROR: Connection failed\nINFO: Service started\n' > system-log.txt

## Grep

I searched for lines containing the word ERROR using:

grep "ERROR" system-log.txt

I counted the number of matching lines using:

grep "ERROR" system-log.txt | wc -l

The grep command searches files for text patterns, while wc -l counts the number of matching lines.

## Awk

I printed the first field from every line using:

awk '{print $1}' system-log.txt

For the assignment challenge, I listed users whose login shell is /bin/bash using:

awk -F: '$7 == "/bin/bash" {print $1}' /etc/passwd

The -F: option tells awk that each field is separated by a colon. The command checks whether the seventh field is /bin/bash and then prints the username from the first field.

## Sed

I replaced the word ERROR with FAILURE in the displayed output using:

sed 's/ERROR/FAILURE/g' system-log.txt

The sed command searches for ERROR and replaces every occurrence with FAILURE. As I did not use the -i option, it did not permanently change the file.

## Piping

I combined grep and awk using:

grep "ERROR" system-log.txt | awk '{print $2, $3}'

The pipe symbol sends the output of grep into awk for further processing.

## What I Learned

I learned how to use grep to search text, awk to select and process fields, sed to replace text and pipes to combine commands.

