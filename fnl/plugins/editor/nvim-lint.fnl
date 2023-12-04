;; Linting

(fn init []
  (let [lint-augroup (vim.api.nvim_create_augroup :lint {:clear true})
        lint (require :lint)]
    (vim.api.nvim_create_autocmd [:BufEnter :BufWritePost :InsertLeave]
                                 {:group lint-augroup
                                  :callback (lambda []
                                              (lint.try_lint))})))

(fn config []
  (let [lint (require :lint)]
    (set lint.linters_by_ft {:zsh [:zsh]
                             :* [:codespell :write_good]
                             :fennel [:fennel]
                             :yaml [:yamllint]
                             :python [:ruff]
                             :lua [:selene]
                             :gitcommit [:gitlint]
                             :docker [:hadolint]
                             :haskell [:hlint]
                             :json [:jsonlint]
                             :sh [:shellcheck]
                             :sql [:sqlfluff]})))

{1 :mfussenegger/nvim-lint : init : config :event [:BufReadPost :BufNewFile]}
