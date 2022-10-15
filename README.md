# nvim

My neovim config written in fennel.

# Dependencies

```
neovim = nightly
```

# Sync

Sync plugins (experimental):

`./sync.sh`

# Structure

```
.
└── fnl
    ├── config              # Plugin configs.
    │   └── lsp             # LSP related configs.
    │       └── settings    # Server specific settings.
    ├── plugins.fnl         # Table of all plugins.
    └── settings            # Neovim settings.
```
