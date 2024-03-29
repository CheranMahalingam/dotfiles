#!/bin/bash

info() {
  printf "\033[00;34m%s\033[0m\n" "$@"
}

sync() {
  info "Syncing..."

  git pull origin main
}

install_nvim() {
  info "Installing neovim..."

  # Install neovim from a tarball
  wget https://github.com/neovim/neovim/releases/download/v0.9.0/nvim-linux64.tar.gz
  tar xzvf nvim-linux64.tar.gz
  rm nvim-linux64.tar.gz

  mkdir -p ~/.local/share
  mv nvim-linux64 ~/.local/share/nvim-linux64
  ln -sf ~/.local/share/nvim-linux64/bin/nvim ~/.local/bin/nvim
}

install_tmux() {
  info "Installing tmux..."

  sudo apt-get install -y tmux
  # Install tmux plugin manager
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
}

install_zsh() {
  info "Installing zsh..."

  sudo apt-get install -y zsh
  # Install ohmyzsh
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  # Script overwrites existing .zshrc file, so we replace with old .zshrc
  rm ~/.zshrc
  mv ~/.zshrc.pre-oh-my-zsh ~/.zshrc

  # Install zsh-autosuggestion plugin
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
}

# ohmyzsh must be installed first
install_fzf() {
  info "Installing fzf..."

  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install -all

  # Install fzf-tab zsh plugin
  git clone https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab
}

reload_config() {
  info "Reloading..."

  tmux source ~/.tmux.conf
  source ~/.zshrc
}

all() {
  sync
  install_nvim
  install_tmux
  install_zsh
  install_fzf
  reload_config
}

help() {
  echo "Usage: $(basename "$0") [options]" >&2
  echo
  echo "   -s, --sync            Synchronize dotfiles from remote"
  echo "   -f, --fzf             Install fzf"
  echo "   -n, --neovim          Install neovim"
  echo "   -t, --tmux            Install tmux"
  echo "   -z, --zsh             Install zsh"
  echo "   -a, --all             Does all of the above"
  echo
  exit 1
}

if [ $# -eq 0 ]; then
  help
else
  for i in "$@"
  do
    case $i in
      -s|--sync)
        sync
        shift
        ;;
      -f|--fzf)
        install_fzf
        reload_config
        shift
        ;;
      -n|--neovim|--nvim)
        install_nvim
        reload_config
        shift
        ;;
      -t|--tmux)
        install_tmux
        reload_config
        shift
        ;;
      -z|--zsh)
        install_zsh
        reload_config
        shift
        ;;
      -a|--all)
        all
        shift
        ;;
      *)
        help
        shift
        ;;
    esac
  done
fi

