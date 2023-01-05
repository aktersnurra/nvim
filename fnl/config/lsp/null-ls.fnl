;; Adds LSP diagnostics and formatting.
(module config.lsp.null-ls {autoload {util config.util}})

(let [null-ls (util.prequire :null-ls)]
  (let [formatting null-ls.builtins.formatting
        diagnostics null-ls.builtins.diagnostics]
    (null-ls.setup {:debug false
                    :sources [diagnostics.codespell
                              diagnostics.cpplint
                              diagnostics.gitlint
                              diagnostics.hadolint
                              diagnostics.jsonlint
                              diagnostics.misspell
                              diagnostics.ruff
                              diagnostics.selene
                              diagnostics.shellcheck
                              diagnostics.sqlfluff
                              diagnostics.write_good
                              diagnostics.yamllint
                              formatting.fnlfmt
                              formatting.markdownlint
                              formatting.prettierd
                              formatting.ruff
                              formatting.rustfmt
                              formatting.shellharden
                              formatting.shfmt
                              formatting.sqlfluff
                              formatting.stylua
                              formatting.terraform_fmt]})))
