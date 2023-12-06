# nvim

My neovim rice in fennel.

# Dependencies

```
neovim = nightly
```

# Structure

```
.
└── fnl
    ├── plugins             # Plugin configs.
    │   └── lsp             # LSP related configs.
    └── settings            # Neovim settings.
```

## Vale

1. Create a `.vale.ini` file in the project
2. Run `vale sync` with the vale located in `mason/packages/vale`
