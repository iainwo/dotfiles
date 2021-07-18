# dotfiles

Scripts and configurations for bootstrapping a new nix environment.

![Terminal](./assets/terminal.png)

___

To install run:

1. Run
```bash
curl -s https://raw.githubusercontent.com/iainwo/dotfiles/main/bootstrap.sh | PROFILE=devel bash
```
These other installation profiles are available:
- blog
- devel
- minimal
2. Exit and re-enter SSH connection or Shell

___

Manual:

- `Ctrl-Space` is the tmux prefix
- `Ctrl-Space` + `|` to tmux vsplit 
- `Ctrl-Space` + `_` to tmux hsplit 
- `v`/`vi`/`vim`/`nvim` to open neovim
- use `extract` bash function to unpack/extract any archives (.tar, .tar.gz, etc.)

Upgrading Plugins:

1. <kbd>prefix</kbd>–<kbd>I</kbd> # to install tmux plugins
2. <kbd>prefix</kbd>–<kbd>U</kbd> # to update tmux plugins
3. nvim
  1. :PlugInstall # to install neovim plugins
  2. :PlugUpdate
  3. :PlugClean # remove plugins
  4. :PlugStatus
  5. :PlugUpgrade # upgrade vim-plug

Programs Installed:

- git
- zsh
  - prezto
- tmux
  - tmux plugin manager
  - tmux yank for copy from tmux buffers to system clipboard
- neovim
  - vim plug
- conda

___

TODO:

- [x] config tmux
- [x] config tmux plugin manager
- [x] config neovim
- [ ] zsh auto suggestions
- [ ] tmuxp
- [ ] zsh jump table to popular directories
- [ ] backup and restore functionality?
- [ ] update functionality (or docs)?
