;; Formatting

(fn init []
  (vim.keymap.set [:n :v] :<leader>e
                  (lambda []
                    (let [conform (require :conform)]
                      (conform.format {:lsp_fallback true :async true})))
                  {:desc :Format}))

(fn config []
  (let [conform (require :conform)]
    (conform.setup {:formatters {:fnlfmt {:command :fnlfmt
                                          :args [:--fix :$FILENAME]
                                          :stdin false}}
                    :formatters_by_ft {:* [:codespell
                                           :trim_whitespace
                                           :trim_newlines]
                                       :css [:stylelint]
                                       :fennel [:fnlfmt]
                                       :haskell [:fourmolu]
                                       :html [:djlint]
                                       :json [:jq]
                                       :lua [:stylua]
                                       :markdown [:cbfmt]
                                       :ocaml [:ocamlformat]
                                       :org [:cbfmt]
                                       :python [:ruff_format]
                                       :rust [:rustfmt]
                                       :sh [:shfmt :shellharden]
                                       :sql [:pg_format :sqlfluff]
                                       :toml [:taplo]
                                       :yaml [:yamlfmt]}})))

{1 :stevearc/conform.nvim : init : config :event [:BufReadPost :BufNewFile]}
