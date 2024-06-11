# nvim

My neovim rice.

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

## Treesitter 

Install treesitter cli with if treesitter seems broken:

```sh
cargo install tree-sitter-cli
```

## Vale

1. Create a `.vale.ini` file in the project
2. Run `vale sync` with the vale located in `mason/packages/vale`

## Clear lua Cache

```fnl
(let [cache-api (require :hotpot.api.cache)]
  (cache-api.clear-cache))
```

Select and run `:Fnl`
