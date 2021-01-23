---
Version: 0.0
---

# Cron Job Repository
<!-- Find More Badges Here: https://shields.io/ -->

[![GitHub License](https://img.shields.io/github/license/devlinjunker/dev.junk.cron?color=blue)](https://github.com/devlinjunker/dev.junk.cron/blob/develop/LICENSE) [![GitHub last commit](https://img.shields.io/github/last-commit/devlinjunker/dev.junk.cron)](https://github.com/devlinjunker/dev.junk.cron/commits/main)
[![GitHub issues](https://img.shields.io/github/issues/devlinjunker/dev.junk.cron)](https://github.com/devlinjunker/dev.junk.cron/issues)

<!--
TODO: Make these visible
[![GitHub priority issues](https://img.shields.io/github/issues/devlinjunker/dev.junk.cron/-priority?color=red&label=priority%20issues)](https://github.com/devlinjunker/dev.junk.cron/issues?q=is%3Aopen+is%3Aissue+label%3A-priority)
[![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/devlinjunker/dev.junk.cron)](https://github.com/devlinjunker/dev.junk.cron/releases)
[![CII Best Practices Summary](https://img.shields.io/cii/summary/4558?label=core-infrastructure)](https://bestpractices.coreinfrastructure.org/en/projects/4558)  
-->

## Intro
<!-- Quick Description, could match Github repo description or have a little more info-->

This is an repository for exploring and storing cron job shell scripts. 

It is based off of the [CII 100% Example](https://github.com/devlinjunker/example.cii) to encourage Passing Status of the [Core Infrastructure Initiative Criteria]


## Dependencies/Frameworks
<!-- List the frameworks, libraries, and tools the project uses: -->

- [Bash] - For running Shell Scripts
- [Git-mkver] - Binary that helps with determining next semantic version based on Git Tags
- [BATS] - Automated Test Suite for Bash Scripts
- [ShellCheck] - Linting Tool for Bash Scripts
- [Bulldozer] - Github Application to Auto Squash and Merge feature PRs
- [PR Landmine Action] - Mutation Testing Pull Requests

## Quick Setup/Run
<!-- This section should try to quickly explain how to setup the project and start using it (server/app/demo/template) - ideally in list format -->

 - TODO After we figure out how to setup/run scripts with cron jobs
 
### Add Code
 - [ ] Create branch matching style `<prefix>/<hyphenated-description>`
 - [ ] Add changes to branch
 - [ ] Before push, if hooks are installed, should do the following (otherwise manual):
    - [ ] Run bash linting with `./scripts/bin/lint.sh`
    - [ ] Run all unit tests with `./scripts/bin/test.sh`
 - [ ] Create Pull Request against `develop`


### Create Release
See full details in the Github Semver Project [wiki](https://github.com/devlinjunker/template.github.semver/wiki/Release)
 - **Must be after `feature/*` or `feat/*` branch is merged**
 - [ ] Initiate `release-cut` GitHub Action
 - [ ] Merge the created `release-*` PR to `main` to start release
    - **Avoid `squash and merge`**


## Links

- [Code of Conduct]
- [Contributing Guide]
- [Security Policy]
<!--
- [Wiki]
  - [FAQ]
  - [README Pages]
- External
  - [Core Infrastructure Initiative Criteria]
  - [BATS]
  - [ShellCheck]
  - [PR Landmine Action]
-->

## Contributors

- [Devlin Junker (Me!)](mailto:devlinjunker@gmail.com)



[License]: LICENSE
[Security Policy]: SECURITY.md
[Code of Conduct]: CODE_OF_CONDUCT.md
[Contributing Guide]: CONTRIBUTING.md
[Git Hooks]: scripts/hooks#git-hook-scripts
[Github Workflows]: .github/workflows#github-workflows
[Wiki]: https://github.com/devlinjunker/dev.junk.cron/wiki
[FAQ]: https://github.com/devlinjunker/dev.junk.cron/wiki/!-FAQ
[README Pages]: https://github.com/devlinjunker/dev.junk.cron/wiki/.README-(synced)
[Core Infrastructure Initiative Criteria]: https://bestpractices.coreinfrastructure.org/en/criteria/0
[Github Actions]: https://docs.github.com/en/free-pro-team@latest/actions
[Bash]: https://tldp.org/LDP/abs/html/
[Git-mkver]: https://idc101.github.io/git-mkver/
[BATS]: https://bats-core.readthedocs.io/
[ShellCheck]: https://www.shellcheck.net/
[Bulldozer]: https://github.com/palantir/bulldozer
[PR Landmine Action]: https://github.com/tylermurry/github-pr-landmine
