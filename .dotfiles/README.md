# Dotfiles
My collection of config files tested primarily on WSL2 and Ubuntu systems

## Installation
1. Clone the dotfiles repository.
```
$ cd ~
$ git clone https://github.com/CheranMahalingam/dotfiles.git
$ cd dotfiles
```
2. Sync config files.
```
$ rsync --recursive --verbose --exclude '.git' tmpdotfiles/ $HOME/
$ rm -r tmpdotfiles
```
3. Use the bootstrap script to install/setup necessary packages.
```
$ ./bootstrap.sh
Usage: bootstrap.sh [options]

   -s, --sync            Synchronize dotfiles from remote
   -f, --fzf             Install fzf
   -n, --neovim          Install neovim
   -t, --tmux            Install tmux
   -z, --zsh             Install zsh
   -a, --all             Does all of the above
```
4. Create a `.gitconfig.local` file to input git credentials.
```
[user]
  email = ...
  name = ...
```

