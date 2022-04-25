# Dependencies

```
neovim >= 0.7
neovim-web-devicons-git
xsel
fzf
fnm and node for lsp
```

# Install

Wonky non-deterministic performance currently.

`./install`

# Structure

```
.
└── fnl
    ├── config              # Plugin configs.
    │   └── lsp             # LSP related configs.
    │       └── settings    # Server specific settings.
    ├── install.lua         # Packer installer.
    ├── plugins.lua         # Table of all plugins.
    └── settings            # Neovim settings.
```
