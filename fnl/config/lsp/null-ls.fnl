;; Adds LSP diagnostics and formatting.
(module config.lsp.null-ls {autoload {:util :config.util}})

(let [null-ls (util.prequire :null-ls)]
  (let [formatting null-ls.builtins.formatting
        diagnostics null-ls.builtins.diagnostics]
    (null-ls.setup {:debug false
                    :sources [diagnostics.flake8
                              diagnostics.golangci_lint
                              diagnostics.jsonlint
                              diagnostics.shellcheck
                              diagnostics.sqlfluff
                              diagnostics.gitlint
                              diagnostics.hadolint
                              diagnostics.cpplint
                              diagnostics.yamllint
                              (formatting.black.with {:extra_args [:--fast]})
                              formatting.fnlfmt
                              formatting.fourmolu
                              formatting.gofmt
                              formatting.goimports
                              (formatting.prettier.with {:extra_args [:--no-semi
                                                                      :--single-quote
                                                                      :--jsx-single-quote]})
                              formatting.rustfmt
                              formatting.shfmt
                              formatting.sqlfluff
                              formatting.stylua
                              formatting.terraform_fmt]})))
