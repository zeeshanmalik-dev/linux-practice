# OverTheWire Bandit Progress

## Level 0 -> Level 1
* **Command Used:** `cat readme`
* **Explanation:** Used `cat` to read the text inside the `readme` file sitting in the home folder.
* **Key Takeaway:** `cat` outputs the full text of a file straight to your terminal.
## Level 1 -> Level 2
* **Command Used:** `cat ./-`
* **Explanation:** Used `./-` so `cat` treats `-` as a file path instead of waiting for standard input.
* **Key Takeaway:** Put `./` in front of filenames that start with a dash so Linux doesn't mistake them for command options or stdin.
## Level 2 -> Level 3
* **Command Used:** `cat ./"--spaces in this filename--"`
* **Explanation:** Used `./` and quotes because the filename starts with dashes and contains spaces.
* **Key Takeaway:** Prefix filenames starting with dashes with `./` so Linux doesn't interpret them as command options.
## Level 3 -> Level 4
* **Command Used:** `cd inhere && ls -la && cat ...Hiding-From-You`
* **Explanation:** Navigated into `inhere`, listed hidden files with `ls -la`, and read `...Hiding-From-You` with `cat`.
* **Key Takeaway:** Files starting with a dot `.` are hidden in Linux; use `ls -a` or `ls -la` to find their exact names.
## Level 4 -> Level 5
* **Command Used:** `cd inhere && file ./-* && cat ./-file07`
* **Explanation:** Used `file` to inspect the contents of all files starting with `-` and find the human-readable ASCII file, then read it with `cat`.
* **Key Takeaway:** The `file` command checks the data type of a file without opening it, making it easy to spot readable text among binary files.
## Level 5 -> Level 6
* **Command Used:** `cd inhere && find . -type f -size 1033c ! -executable -exec cat {} +`
* **Explanation:** Used `find` to locate a file by specific criteria (file type, size of 1033 bytes, non-executable) and read its contents.
* **Key Takeaway:** `find` allows searching files across subdirectories using properties like `-size`, `-type`, and permissions. 
## Level 6 -> Level 7
* **Command Used:** `find / -user bandit7 -group bandit6 -size 33c 2>/dev/null`
* **Explanation:** Searched the entire root filesystem (`/`) for a 33-byte file owned by user `bandit7` and group `bandit6`, discarding permission errors with `2>/dev/null`.
* **Key Takeaway:** Use `-user` and `-group` flags with `find` to filter by ownership, and append `2>/dev/null` to mute error messages in search output.
## Level 7 -> Level 8
* **Command Used:** `grep "millionth" data.txt`
* **Explanation:** Used `grep` to search `data.txt` and extract the line containing the word `millionth`.
* **Key Takeaway:** `grep` scans text files line-by-line to find specific keywords or string patterns.
## Level 8 -> Level 9
* **Command Used:** `sort data.txt | uniq -u`
* **Explanation:** Sorted `data.txt` so duplicate lines were adjacent, then piped the output to `uniq -u` to extract the single unique line.
* **Key Takeaway:** `uniq` only detects adjacent duplicate lines, so input must be sorted with `sort` first. 
## Level 9 -> Level 10
* **Command Used:** `strings data.txt | grep "="`
* **Explanation:** Extracted human-readable text strings from `data.txt` using `strings` and filtered for lines containing `=` with `grep`.
* **Key Takeaway:** Use `strings` to pull printable characters out of binary or mixed-data files before piping to text filters like `grep`. 
## Level 10 -> Level 11
* **Command Used:** `base64 -d data.txt`
* **Explanation:** Used `base64 -d` to decode the base64-encoded string stored inside `data.txt`.
* **Key Takeaway:** Base64 is a common encoding scheme used to represent binary data as ASCII text; use `base64 -d` to decode it back. 
## Level 11 -> Level 12
* **Command Used:** `tr 'A-Za-z' 'N-ZA-Mn-za-m' < data.txt`
* **Explanation:** Used `tr` to substitute characters using a 13-character shift (ROT13) to reveal the plain text password.
* **Key Takeaway:** `tr` performs character-by-character translation, useful for simple substitution ciphers like ROT13. 
## Level 12 -> Level 13
* **Command Used:** `mkdir /tmp/mybandit12 && cp data.txt /tmp/mybandit12/ && cd /tmp/mybandit12 && file`, `xxd -r`, `gzip -d`, `bzip2 -d`, `tar xf`
* **Explanation:** Created a temporary working directory in `/tmp` for write permissions, then iteratively inspected nested archive layers using `file` and unpacked each layer with its corresponding decompression tool down to the final ASCII text password file.
* **Key Takeaway:** When dealing with multi-layered nested archives, use `/tmp` for workspace and run the `file` command iteratively to identify each format before applying the matching extraction utility.
## Level 15 -> Level 16
* **Command Used:** `openssl s_client -connect localhost:30001 -ign_eof`
* **Explanation:** Connected to a local SSL/TLS port using OpenSSL, submitted the current level password, and retrieved the password for Level 16.
* **Key Takeaway:** `openssl s_client` allows you to establish encrypted TLS connections to local or remote ports to interact with secure services.
## Level 16 -> Level 17
* **Command Used:** `nmap -p 31000-32000 localhost` and `openssl s_client -connect localhost:31790 -ign_eof`
* **Explanation:** Scanned the local port range using `nmap` to locate open services, then used `openssl s_client` to connect to the correct SSL port, submitted the Level 16 password, and retrieved the private SSH key for Level 17.
* **Key Takeaway:** When facing a range of unknown open ports, use `nmap` to map them out and probe individual services to find the correct application endpoint.
## Level 17 -> Level 18
* **Command Used:** `diff passwords.old passwords.new`
* **Explanation:** Compared two files line-by-line to identify what changed or was added, revealing the password for the next level hidden within the differences.
* **Key Takeaway:** The `diff` utility is a fast and efficient way to spot discrepancies between two similar text files.
## Level 18 -> Level 19
* **Command Used:** `scp bandit18@bandit.labs.overthewire.org:readme .`
* **Explanation:** Used Secure Copy to pull the `readme` file from the remote server to a local machine without spawning an interactive shell, bypassing the forced logout restriction in the user's shell configuration.
* **Key Takeaway:** File transfer protocols like `scp` can be used to retrieve data when standard interactive terminal access is restricted.
## Level 19 -> Level 20
* **Command Used:** `./bandit20-do cat /etc/bandit_pass/bandit20`
* **Explanation:** Executed a set-user-ID (SUID) binary that temporarily grants elevated execution privileges to read the protected password file for Level 20.
* **Key Takeaway:** SUID binaries allow users to execute programs with the file owner's permissions, which can be leveraged if the binary allows running commands.
## Level 20 -> Level 21
* **Command Used:** `echo "PASSWORD" | nc -l -p 1234 &` and `./suconnect 1234`
* **Explanation:** Set up a netcat listener in the background to feed the current password into a local port when the `suconnect` binary connected, verifying the match and outputting the password for Level 21.
* **Key Takeaway:** Network utilities like `nc` (netcat) can simulate server responses or handle local socket communication for binaries that expect network-based authentication.
