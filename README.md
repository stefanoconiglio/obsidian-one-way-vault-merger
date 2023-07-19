# Obsidian One-way vault merger (OOWVM)
A simple bash script to merge and move the content (.md, .png, .jpg, and .jpeg) of a given folder (folder A) to another given folder (folder B) designed to merging an Obsidian vault on the smartphone with one's main Obsidian vault on the PC.

**CAVEAT**: One should empty their smartphone vault, as the code peforms a "blind" merge that would append an .md file below another one even if the two where identical!

In more detail:
- every .png, .jpg, and .jpeg file in folder A is renamed by pre-pending a unique time-dependent identifier (*) to it to avoid conflits (which may arise if a file with the same name is already present in folder B)
- every .png, .jpg, and .jpeg file in folder A is moved to folder B within the $MEDIA subfolder (which should match the "Attachment folder path" under "Options -> Files & Links" in Obsidian)
- every occurrence of the .png, .jpg, and .jpeg file in the .md files in folder A is updated to its new uniquified (**) name
- the content of each .md file contained in folder A that is also contained in folder B is appended to its twin in folder B and the .md file removed from folder A
- files whose name matches the format `yyyy-mm-dd.md` are treated as "daily notes" and merged&moved to the $DAILYNOTES folder (which should match the "New file location" that is set under "Core plugins -> Daily notes" in Obsidian.
- every .md file that is only contained in folder A is moved to folder B.

The script comes with a testing script called `oowvm-run-test.sh`, to be primed by running `oowvm-setup-test.sh`.

(*) The unique identifier is the number of seconds since 1970-01-01 00:00:00 UTC.
(**) Uniquify is not a word, I know ;)

# Usage
```bash
chmod +x oowvm.sh
./oowvm.sh folderA folderB
```
If you're an iPhone user and use iCloud, what you want to do is: 1) compress your iCould vault from your iPhone; 2) download it to your PC from this [url](https://www.icloud.com/iclouddrive); 3) decompress the zipped vault; 4) run my bash script.

You can download the magnificent Obsidian [here](https://obsidian.md).
