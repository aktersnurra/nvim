;; Adds LSP diagnostics and formatting.
(module config.lsp.null-ls
  {autoload {util util}})

(let [null-ls (util.load-plugin :null-ls)]
  (let [formatting (null_ls.builtins.formatting) 
        diagnostics (null_ls.builtins.diagnostics)])
  (null-ls.setup
    {:debug false
     :sources [
       (diagnostics.flake8)
       (diagnostics.golangci_lint)
       (diagnostics.jsonlint)
       (diagnostics.shellcheck)
       (diagnostics.yamllint)
       (formatting.black.with { extra_args [ "--fast" ] })
       (formatting.erlfmt)
       (formatting.fourmolu)
       (formatting.gofmt)
       (formatting.goimports)
       (formatting.nixfmt)
       (formatting.prettier.with {
         extra_args [ "--no-semi" "--single-quote" "--jsx-single-quote" ]
       })
       (formatting.rustfmt)
       (formatting.shfmt)
       (formatting.sqlformat)
       (formatting.stylua)
       (formatting.terraform_fmt)]}))
