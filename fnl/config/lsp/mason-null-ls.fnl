;; Ensure that tools needed for null-ls are installed.
(module config.mason-null-ls {autoload {:util :config.util}})

(def- opts {:ensure_installed [:flake8
                               :golangci-lint
                               :cpplint
                               :gitlint
                               :jsonlint
                               :yamllint
                               :black
                               :fnlfmt
                               :fourmolu
                               :gofmt
                               :goimports
                               :prettier
                               :rustfmt
                               :stylua
                               :shellcheck
                               :sqlfluff
                               :hadolint
                               :terraform-fmt
                               :shfmt]
            :auto_update true
            :automatic_installation true})

(util.setup :mason-null-ls opts)
