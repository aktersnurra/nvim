;; Linting

(λ callback []
  (let [lint (require :lint)]
    (lint.try_lint)))

(λ init []
  (let [lint-augroup (vim.api.nvim_create_augroup :lint {:clear true})]
    (vim.api.nvim_create_autocmd [:BufEnter
                                  :BufWritePost
                                  :InsertLeave
                                  :TextChangedI]
                                 {:group lint-augroup : callback})))

(λ config []
  (let [lint (require :lint)]
    (set lint.linters_by_ft {:* [:codespell :write_good]
                             :dockerfile [:hadolint]
                             :fennel [:fennel]
                             :gitcommit [:gitlint :codespell]
                             :haskell [:hlint]
                             :json [:jsonlint]
                             :lua [:selene]
                             :python [:ruff]
                             :sh [:shellcheck]
                             :sql [:sqlfluff]
                             :yaml [:yamllint]
                             :zsh [:zsh]})))

{1 :mfussenegger/nvim-lint : init : config :event [:BufReadPost :BufNewFile]}
