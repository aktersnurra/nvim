;; Ensure that tools needed for null-ls are installed.
(module config.mason-null-ls {autoload {util config.util}})

(def- opts {:ensure_installed [:black
                               :cpplint
                               :flake8
                               :fnlfmt
                               :fourmolu
                               :gitlint
                               :hadolint
                               :jsonlint
                               :prettier
                               :rustfmt
                               :shellcheck
                               :shfmt
                               :sqlfluff
                               :stylua
                               :terraform-fmt
                               :yamllint]

            :auto_update true
            :automatic_installation true})

(util.setup :mason-null-ls opts)
