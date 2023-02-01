# skovhus/setup

My macOS development setup... dotfiles, config, preferences, apps. Everything 🐙


## Setting it all up

I always configure a new machine by:

1) configure up [SSH and Github](https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh)
2) open the Terminal and install developer tools required for git by running `git -v`
3) clone this repository: `mkdir git && cd git && git clone git@github.com:skovhus/setup.git && cd setup`
4) run the install script: `bash install.sh` (if it fails, follow the intructions and run it again)
5) ☕️
6) follow the last manual setup instructions printed after running `install.sh`
7) verify and fix any brew issues: `brew doctor`
8) restart


## Inspiration

Bit and pieces stolen from
- [sorenvind/dev-env](https://github.com/sorenvind/dev-env)
- [mads-hartmann/dotfiles](https://github.com/mads-hartmann/dotfiles)
