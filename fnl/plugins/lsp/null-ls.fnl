;; Adds LSP diagnostics and formatting.

(local mason-opts {:ensure_installed nil
                   :automatic_installation true
                   :automatic_setup false})

(fn config []
  (let [null-ls (require :null-ls)
        mason-null-ls (require :mason-null-ls)]
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
                                formatting.ocamlformat
                                formatting.prettierd
                                formatting.ruff
                                formatting.rustfmt
                                formatting.shellharden
                                formatting.shfmt
                                formatting.sqlfluff
                                formatting.stylua
                                formatting.terraform_fmt]}))
    (mason-null-ls.setup mason-opts)))

{1 :jose-elias-alvarez/null-ls.nvim
 :dependencies [:mason.nvim
                :jayp0521/mason-null-ls.nvim
                :nvim-lua/plenary.nvim]
 :event :BufReadPost
 : config}
