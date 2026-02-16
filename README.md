# Dotfiles

Personal shell configuration for macOS.

---

## Structure

```text
dotfiles/
├── fish/
├── zsh/
├── git/
├── iterm2/
└── install.sh
```

---

## Shells

### Fish

Primary interactive shell.

Config location:

```text
~/.config/fish/config.fish
```

Plugins managed via `fish_plugins`.

`fish_variables` is **not versioned**.

---

### Zsh

Secondary shell.

Includes:

- completion
- autosuggestions
- syntax highlighting
- zoxide
- powerlevel10k

---

## Installation

Clone repository:

```bash
git clone git@github.com:haspadar/dotfiles.git ~/Projects/dotfiles
cd ~/Projects/dotfiles
./install.sh
```

Restart shell after linking.

---

## iTerm2

Profiles exported as JSON.

Import via:

Settings → Profiles → Other Actions → Import JSON Profiles

---

## Git

Global git config linked from:

```text
dotfiles/git/.gitconfig
```