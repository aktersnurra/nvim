;; Adds LSP diagnostics and formatting.
(module config.lsp.null-ls {autoload {util config.util}})

(def- mason-opts {:ensure_installed nil
                  :automatic_installation true
                  :automatic_setup false})

(let [null-ls (util.prequire :null-ls)
      mason-null-ls (util.prequire :mason-null-ls)]
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
                              formatting.terraform_fmt]}))
  (mason-null-ls.setup mason-opts))
