# Permissions and Ownership

## Executable Script

I created a Bash script and made it executable using:

printf '#!/bin/bash\necho "Hello DevOps"\n' > hello.sh
chmod +x hello.sh
./hello.sh

The chmod +x command added executable permission to the script.

## Permissions Challenge

I created a file that I can read and write, while other users can only read, using:

touch private-notes.txt
chmod 644 private-notes.txt
ls -l private-notes.txt

Permission 644 means:

* Owner: read and write
* Group: read only
* Others: read only

