;; Ensure that tools needed for null-ls are installed.
(module config.mason-null-ls {autoload {: util}})

(def- opts {:ensure_installed {:flake8 :golangci-lint
                              :jsonlint :yamllint
                              :black :fnlfmt
                              :fourmolu :gofmt
                              :goimports :prettier
                              :rustfmt :stylua
                              :shellcheck :sqlformat
                              :terraform-fmt :shfmt}
            :auto_update true
            :automatic_installation true})

(util.use-config :mason-null-ls opts)
(let [mason-null-ls (require :mason-null-ls)]
  (mason-null-ls.check_install true))
