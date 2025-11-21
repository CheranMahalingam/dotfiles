{ config, pkgs, ... }:

{
  home.username = "cheranm";
  home.homeDirectory = "/home/cheranm";

  home.stateVersion = "25.05";

  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')

    pkgs.neovim
    pkgs.gnumake # Required by neovim
    pkgs.gcc15

    pkgs.bat
    pkgs.eza
    pkgs.fd
    pkgs.fzf
    pkgs.git
    pkgs.htop
    pkgs.hyperfine
    pkgs.jq
    pkgs.ripgrep
    pkgs.xclip
    pkgs.yq
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/cheranm/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.fish = {
    enable = true;
    shellAbbrs = {
      find = "fd";
      grep = "rg";
      la = "eza -al";
      ls = "eza";
      tree = "eza -T";
      xmap = "xargs -n1";
    };

    loginShellInit = ''
      if test -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.fish'
        . /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.fish
      end
    '';
  };
  programs.eza.enableFishIntegration = true;
  programs.fzf.enableFishIntegration = true;
  programs.git-worktree-switcher.enableFishIntegration = true;

  programs.git = {
    enable = true;
    userName = "CheranMahalingam";
    userEmail = "cheranm@outlook.com";
    extraConfig = {
      core.editor = "vim";
      merge.conflictstyle = "zdiff3";
      push.default = "current";
      submodule.recurse = true;
    };
    ignores = [
      ".cache"
      "compile_commands.json"
      "compile_flags.txt"

      ".direnv"
      ".envrc"
    ];

    delta.enable = true;
    delta.options = {
      navigate = true;
      dark = true;
      line-numbers = true;
      side-by-side = true;
      true-color = "always";
    };
  };
}
