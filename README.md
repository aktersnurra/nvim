# My Neovim Config

Based on the neovim config by [ChristianChiarulli](https://github.com/LunarVim/Neovim-from-scratch/tree/03-plugins).

# Dependencies

```
neovim >= 6.0.0
neovim-web-devicons-git
xsel
fzf
fnm and node for lsp
```

# Structure

```
.
└── lua
    ├── config              # Plugin configs.
    │   └── lsp             # LSP related configs.
    │       └── settings    # Server specific settings.
    ├── install.lua         # Packer installer.
    ├── plugins.lua         # Table of all plugins.
    └── settings            # Neovim settings.
```

## TODO
-[ ] autocmd
-[ ] cmp check if anything is missing
