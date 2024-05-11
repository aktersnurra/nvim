;; Formatting

(fn init []
  (vim.keymap.set [:n :v] :<leader>e
                  (lambda []
                    (let [conform (require :conform)]
                      (conform.format {:lsp_fallback true :async true})))
                  {:desc :Format}))

(local opts {:formatters {:fnlfmt {:command :fnlfmt
                                   :args [:--fix :$FILENAME]
                                   :stdin false}}
             :formatters_by_ft {:* [:codespell]
                                :_ [:trim_whitespace :trim_newlines]
                                :css [:stylelint]
                                :fennel [:fnlfmt]
                                :haskell [:fourmolu]
                                :html [:prettierd]
                                :http [:jq]
                                :json [:jq]
                                :lua [:stylua]
                                :markdown [:prettierd]
                                :ocaml [:ocamlformat]
                                :python [:ruff_format :ruff_fix]
                                :rust [:rustfmt]
                                :sh [:shfmt :shellharden]
                                :sql [:pg_format :sqlfluff]
                                :toml [:taplo]
                                :yaml [:yamlfmt]}})

{1 :stevearc/conform.nvim : init : opts :event [:BufReadPost :BufNewFile]}
