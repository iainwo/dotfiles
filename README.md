# dotfiles

Scripts and configurations for bootstrapping a new nix environment.

![Terminal](./assets/terminal.png)

___

To install run:

1. Run
```bash
curl -s https://raw.githubusercontent.com/iainwo/dotfiles/main/bootstrap.sh | bash
```
2. Exit and re-enter SSH connection or Shell
3. <kbd>prefix</kbd>–<kbd>I</kbd> # to install tmux plugins
4. <kbd>prefix</kbd>–<kbd>U</kbd> # to update tmux plugins
___

Manual:

- `Ctrl-Space` is the tmux prefix
- `Ctrl-Space` + `|` to tmux vsplit 
- `Ctrl-Space` + `_` to tmux hsplit 
- `v`/`vi`/`vim`/`nvim` to open neovim
- use `extract` bash function to unpack/extract any archives (.tar, .tar.gz, etc.)

Programs Installed:

- git
- zsh
  - prezto
- tmux
  - tmux plugin manager
  - tmux yank for copy from tmux buffers to system clipboard
- neovim

___

TODO:

- [x] config tmux
- [x] config tmux plugin manager
- [ ] config neovim
- [ ] zsh auto suggestions
- [ ] tmuxp
- [ ] zsh jump table to popular directories
