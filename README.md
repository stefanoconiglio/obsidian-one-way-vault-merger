# One-way Obsidian vault merger
A simple bash script to merge and move the content (.md, .png, .jpg, and .jpeg) of a given folder (folder A) to another given folder (folder B).
Typical use: merging a vault on the smartphone with one's main vault on the PC.
**CAVEAT**: One should empty their smartphone vault, as the code peforms a "blind" merge that would append an .md file below another one even if the two where identical!

In more detail:
- every .png, .jpg, and .jpeg file in folder A is renamed by pre-pending a unique time-dependent identifier (*) to it to avoid conflits (which may arise if a file with the same name is already present in folder B)
- every .png, .jpg, and .jpeg file in folder A is moved to folder B
- every occurrence of the .png, .jpg, and .jpeg file in the .md files in folder A is updated to its new uniquified (**) name
- the content of pair .md file contained in folder A that is also contained in folder B is appended to its twin in folder B and the .md file removed from folder A
- every .md file that is only contained in folder A is moved to folder B.

(*) The unique identifier is the numemr of seconds since 1970-01-01 00:00:00 UTC.
(**) Uniquify is not a word, I know ;)

# Usage
```bash
./owovm.sh folderA folderB
```
The script comes with a testing script called `test.sh`.
