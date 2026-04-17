# nvim

My neovim rice. Written in [Fennel](https://fennel-lang.org/) via
[Hotpot](https://github.com/rktjmp/hotpot.nvim).

## Dependencies

- Neovim nightly (0.13+)
- [Cargo](https://rustup.rs/) (builds `fff.nvim` and `tree-sitter-cli`)

## Structure

```
.
├── init.lua                 # Bootstrap Hotpot
└── fnl
    ├── config.fnl           # Plugin loader (lazy.nvim)
    ├── macros.fnlm          # Compile-time Fennel macros
    ├── plugins/             # Plugin specs
    │   ├── lsp/             # LSP servers, diagnostics, keymaps
    │   └── snippets/        # LuaSnip snippet files
    └── settings/            # Options, keymaps, autocmds, terminal
```

## Hotpot

Hotpot compiles Fennel to Lua on the fly and caches the result.

**Macro files** must use the `.fnlm` extension and return a table of exported
macros. Consumers use `(import-macros {: name} :macros)`.

### Sync after external edits

Hotpot watches `BufWritePost` inside Neovim. Edits made outside Neovim
(terminal, CI, Claude Code) won't trigger recompilation. Run:

```vim
:Hotpot sync
```

### Clear compiled cache

If things get weird, nuke the cache:

```vim
:Hotpot clear-cache
```

Or from Fennel:

```fennel
(let [cache-api (require :hotpot.api.cache)]
  (cache-api.clear-cache))
```

## Treesitter

Uses `nvim-treesitter` on the `main` branch (parser-only). Highlighting and
indentation use Neovim's built-in `vim.treesitter` APIs.

Install the treesitter CLI if parser compilation fails:

```sh
cargo install tree-sitter-cli
```

## fff.nvim

Fuzzy finder built from source. If the build fails, make sure `cargo` is
available and up to date (`rustup update`).
