Some files are maintained manually:

    code --list-extensions | sort --ignore-case > apps/vs-code/extensions.list

    brew list --cask -1 | sort --ignore-case > brew-casks.list

    brew leaves | sort --ignore-case > brew-packages.list
