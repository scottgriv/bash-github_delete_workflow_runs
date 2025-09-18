<!-- Begin README -->

<div align="center">
    <a href="https://github.com/scottgriv/bash-github_delete_workflow_runs" target="_blank">
        <img src="./docs/images/icon.png" width="150" height="150"/>
    </a>
</div>
<br>
<p align="center">
    <a href="https://www.gnu.org/software/bash/manual/bash.html"><img src="https://img.shields.io/badge/Bash-5.2.0-4EAA25?style=for-the-badge&logo=gnubash" alt="Bash Badge" /></a>
    <br>
    <a href="https://github.com/scottgriv"><img src="https://img.shields.io/badge/github-follow_me-181717?style=for-the-badge&logo=github&color=181717" alt="GitHub Badge" /></a>
    <a href="mailto:scott.grivner@gmail.com"><img src="https://img.shields.io/badge/gmail-contact_me-EA4335?style=for-the-badge&logo=gmail" alt="Email Badge" /></a>
    <a href="https://www.buymeacoffee.com/scottgriv"><img src="https://img.shields.io/badge/buy_me_a_coffee-support_me-FFDD00?style=for-the-badge&logo=buymeacoffee&color=FFDD00" alt="BuyMeACoffee Badge" /></a>
    <br>
    <a href="https://prgportfolio.com" target="_blank"><img src="https://img.shields.io/badge/PRG-Bronze Project-CD7F32?style=for-the-badge&logo=data:image/svg%2bxml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBzdGFuZGFsb25lPSJubyI/Pgo8IURPQ1RZUEUgc3ZnIFBVQkxJQyAiLS8vVzNDLy9EVEQgU1ZHIDIwMDEwOTA0Ly9FTiIKICJodHRwOi8vd3d3LnczLm9yZy9UUi8yMDAxL1JFQy1TVkctMjAwMTA5MDQvRFREL3N2ZzEwLmR0ZCI+CjxzdmcgdmVyc2lvbj0iMS4wIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciCiB3aWR0aD0iMjYuMDAwMDAwcHQiIGhlaWdodD0iMzQuMDAwMDAwcHQiIHZpZXdCb3g9IjAgMCAyNi4wMDAwMDAgMzQuMDAwMDAwIgogcHJlc2VydmVBc3BlY3RSYXRpbz0ieE1pZFlNaWQgbWVldCI+Cgo8ZyB0cmFuc2Zvcm09InRyYW5zbGF0ZSgwLjAwMDAwMCwzNC4wMDAwMDApIHNjYWxlKDAuMTAwMDAwLC0wLjEwMDAwMCkiCmZpbGw9IiNDRDdGMzIiIHN0cm9rZT0ibm9uZSI+CjxwYXRoIGQ9Ik0xMiAzMjggYy04IC04IC0xMiAtNTEgLTEyIC0xMzUgMCAtMTA5IDIgLTEyNSAxOSAtMTQwIDQyIC0zOCA0OAotNDIgNTkgLTMxIDcgNyAxNyA2IDMxIC0xIDEzIC03IDIxIC04IDIxIC0yIDAgNiAyOCAxMSA2MyAxMyBsNjIgMyAwIDE1MCAwCjE1MCAtMTE1IDMgYy04MSAyIC0xMTkgLTEgLTEyOCAtMTB6IG0xMDIgLTc0IGMtNiAtMzMgLTUgLTM2IDE3IC0zMiAxOCAyIDIzCjggMjEgMjUgLTMgMjQgMTUgNDAgMzAgMjUgMTQgLTE0IC0xNyAtNTkgLTQ4IC02NiAtMjAgLTUgLTIzIC0xMSAtMTggLTMyIDYKLTIxIDMgLTI1IC0xMSAtMjIgLTE2IDIgLTE4IDEzIC0xOCA2NiAxIDc3IDAgNzIgMTggNzIgMTMgMCAxNSAtNyA5IC0zNnoKbTExNiAtMTY5IGMwIC0yMyAtMyAtMjUgLTQ5IC0yNSAtNDAgMCAtNTAgMyAtNTQgMjAgLTMgMTQgLTE0IDIwIC0zMiAyMCAtMTgKMCAtMjkgLTYgLTMyIC0yMCAtNyAtMjUgLTIzIC0yNiAtMjMgLTIgMCAyOSA4IDMyIDEwMiAzMiA4NyAwIDg4IDAgODggLTI1eiIvPgo8L2c+Cjwvc3ZnPgo=" alt="Bronze" /></a>
</p>

---------------

<h1 align="center">GitHub CLI - Delete GitHub Actions Workflow Runs</h1>

Have you ever wanted to clean-up and delete past GitHub Actions Workflow Runs/Logs but did not want to click on each run individually to delete it?

Well, save some time and utilize GitHub CLI to mass delete all GitHub Actions workflow runs for a specific repository!

---------------

## Table of Contents

- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [Resources](#resources)
- [License](#license)
- [Credits](#credits)

## Features

This repository contains a Bash file `delete_workflow_runs.sh`, which will delete **ALL** workflow runs for a specific repository when executed.

## Installation

1. **Install GitHub CLI (gh):** This tool allows you to interact with GitHub from the command line. You can install it using Homebrew on your Mac with the command ```brew install gh```.

2. **jq Tool:** This is a command-line JSON processor that the script uses to parse JSON data. Install it on your Mac using Homebrew with the command ```brew install jq```.

3. **GitHub Authentication:** To use the GitHub CLI (gh), you need to be authenticated. You don't necessarily need an API key; instead, you authenticate your GitHub CLI installation with your GitHub account. Once installed, you can authenticate by running ```gh auth login``` and following the prompts.

4. **Create the File:** Use a text editor to create a new file with the script inside it.

5. **Make It Executable:** Before you can run your Bash script, you need to make it executable. You can do this from the terminal with the following command:

```bash
chmod +x delete_workflow_runs.sh
```

After setting up these prerequisites, you can run your script. Here's the script for reference:

```bash
gh api --paginate /repos/username/reponame/actions/runs | \
jq -r '.workflow_runs[] | [.id] | @tsv' | \
while read -r value; do 
    echo "Deleting $value"
    gh api -X DELETE "/repos/username/reponame/actions/runs/$value"
done
```

> [!IMPORTANT]
> Remember to replace ```username``` and ```reponame``` with your GitHub username and the repository name, respectively.

## Usage

**This script works by:** 
- Using the GitHub CLI to fetch a list of workflow runs for a specific repository.
- Piping the output to jq to extract the run IDs.
- Looping over each ID and using the GitHub CLI to delete the corresponding workflow run.

**Pagination**
- By default, the script is only deleting 25 workflow runs at a time, this is likely due to the GitHub API's pagination feature. 
- The GitHub API, like many APIs, uses pagination to limit the number of items returned in a single response. This is done to manage load on the server and to ensure faster response times. 
- The GitHub CLI (gh) simplifies pagination with the ```--paginate``` flag which is written into the script. With the ```--paginate``` flag, the script will loop through each page of the API response until there are no more pages left.

**Running the Script:** Once the script is executable, you can run it from the terminal in the directory where the script is located:

```bash
./delete_workflow_runs.sh
```

## Resources

- [GitHub CLI Tool](https://cli.github.com/)
- [Mass deletion of GitHub Actions workflow runs (a blog post that inspired me to tackle this problem)](https://qmacro.org/blog/posts/2021/03/26/mass-deletion-of-github-actions-workflow-runs/)
- [Bash Reference Manual](https://www.gnu.org/software/bash/manual/bash.html)
- [Bash Guide for Beginners](https://tldp.org/LDP/Bash-Beginners-Guide/html/index.html)
- [Bash Scripting Tutorial](https://ryanstutorials.net/bash-scripting-tutorial/)
- [Bash Scripting Cheatsheet](https://devhints.io/bash)

## License

This project is released under the terms of **The Unlicense**, which allows you to use, modify, and distribute the code as you see fit. 
- [The Unlicense](https://choosealicense.com/licenses/unlicense/) removes traditional copyright restrictions, giving you the freedom to use the code in any way you choose.
- For more details, see the [LICENSE](LICENSE) file in this repository.

## Credits

**Author:** [Scott Grivner](https://github.com/scottgriv) <br>
**Email:** [scott.grivner@gmail.com](mailto:scott.grivner@gmail.com) <br>
**Website:** [linktr.ee/scottgriv](https://www.linktr.ee/scottgriv) <br>
**Reference:** [Main Branch](https://github.com/scottgriv/bash-github_delete_workflow_runs) <br>

---------------

<div align="center">
    <a href="https://linktr.ee/scottgriv" target="_blank">
        <img src="./docs/images/footer.png" width="100" height="100"/>
    </a>
</div>

<!-- End README -->