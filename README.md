# Config

My neovim config written in fennel.

# Dependencies

```
neovim >= 0.7
neovim-web-devicons-git
xsel
fzf
fnm and node for lsp
```

# Sync

Sync plugins:

`./sync.sh`

# Structure

```
.
└── fnl
    ├── config              # Plugin configs.
    │   └── lsp             # LSP related configs.
    │       └── settings    # Server specific settings.
    ├── util.fnl            # Packer installer and config loader.
    ├── plugins.fnl         # Table of all plugins.
    └── settings            # Neovim settings.
```
