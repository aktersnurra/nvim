;; Formatting

(λ init []
  (vim.keymap.set [:n :v] :<leader>e
                  (λ []
                    (let [conform (require :conform)]
                      (conform.format {:lsp_fallback true :async true})))
                  {:desc :Format}))

(local opts {:formatters {:fnlfmt {:command :fnlfmt
                                   :args [:--fix :$FILENAME]
                                   :stdin false}}
             :formatters_by_ft {:* [:codespell]
                                :_ [:trim_whitespace :trim_newlines]
                                :css [:stylelint]
                                :elixir [:mix]
                                :fennel [:fnlfmt]
                                :haskell [:fourmolu]
                                :html [:prettierd]
                                :http [:jq]
                                :json [:jq]
                                :lua [:stylua]
                                :markdown [:prettierd]
                                :ocaml [:ocamlformat]
                                :python [:ruff_format :ruff_fix :ruff_organize_imports]
                                :rust [:rustfmt]
                                :sh [:shfmt :shellharden]
                                :sql [:pg_format]
                                :toml [:taplo]
                                :yaml [:yamlfmt]}})

{1 :stevearc/conform.nvim : init : opts :event [:BufReadPost :BufNewFile]}
