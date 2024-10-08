;; Treesitter is a tool for building syntax trees for source files.
;; In the neovim context it helps with better coloring.

(local opts
       {:ensure_installed [:bash
                           :c
                           :comment
                           :dockerfile
                           :elixir
                           :erlang
                           :fennel
                           :graphql
                           :haskell
                           :hcl
                           :html
                           :http
                           :json
                           :latex
                           :lua
                           :make
                           :markdown
                           :ocaml
                           :python
                           :rust
                           :sql
                           :toml
                           :vim
                           :vimdoc
                           :xml
                           :yaml]
        :sync_install false
        :ignore_install [""]
        :autopairs {:enable true}
        :highlight {:enable true :additional_vim_regex_highlighting [:org]}
        :context_commentstring {:enable true :enable_autocmd false}
        :indent {:enable true :disable [:yaml :python :css]}
        :playground {:enable true}
        :textobjects {:select {:enable true
                               :lookahead true
                               :keymaps {:aa "@parameter.outer"
                                         :ia "@parameter.inner"
                                         :af "@function.outer"
                                         :if "@function.inner"
                                         :ii "@conditional.outer"
                                         :ai "@conditional.inner"
                                         :il "@loop.outer"
                                         :al "@loop.inner"
                                         :ac "@class.outer"
                                         :at "@comment.outer"
                                         :ic {:query "@class.inner"
                                              :desc "Select inner part of a class region"}
                                         :as {:query "@scope"
                                              :query_group :locals
                                              :desc "Select language scope"}}
                               :selection_modes {"@parameter.outer" :v
                                                 "@function.outer" :V
                                                 "@class.outer" :<c-v>}
                               :include_surrounding_whitespace true}
                      :swap {:enable true
                             :swap_next {:<leader>a "@parameter.inner"}
                             :swap_previous {:<leader>A "@parameter.inner"}}
                      :move {:enable true
                             :set_jumps true
                             :goto_next_start {"]m" "@function.outer"
                                               "]]" {:query "@class.outer"
                                                     :desc "Next class start"}
                                               "]o" "@loop.*"
                                               "]s" {:query "@scope"
                                                     :query_group :locals
                                                     :desc "Next scope"}
                                               "]z" {:query "@fold"
                                                     :query_group :folds
                                                     :desc "Next fold"}}
                             :goto_next_end {"]M" "@function.outer"
                                             "][" "@class.outer"}
                             :goto_previous_start {"[m" "@function.outer"
                                                   "[[" "@class.outer"}
                             :goto_previous_end {"[M" "@function.outer"
                                                 "[]" "@class.outer"}
                             :goto_next {"]i" "@conditional.outer"}
                             :goto_previous {"[i" "@conditional.outer"}}
                      :lsp_interop {:enable true
                                    :border :single
                                    :floating_preview_opts {}
                                    :peek_definition_code {:md "@function.outer"
                                                           :mD "@class.outer"}}}})

(λ config []
  (let [treesitter (require :nvim-treesitter.configs)]
    (treesitter.setup opts)))

{1 :nvim-treesitter/nvim-treesitter
 :dependencies [{1 :nvim-treesitter/nvim-treesitter-textobjects :lazy true}]
 :build ":TSUpdate"
 :event [:VeryLazy]
 : config}
