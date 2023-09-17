;; Treesitter is a tool for building syntax trees for source files.
;; In the neovim context it helps with better coloring.

(local opts
       {:ensure_installed [:c
                           :dockerfile
                           :erlang
                           :fennel
                           :go
                           :haskell
                           :hcl
                           :html
                           :latex
                           :lua
                           :make
                           :markdown
                           :ocaml
                           :org
                           :python
                           :rust
                           :sql
                           :toml
                           :vim
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
                                         :ac "@class.outer"
                                         :ic {:query "@class.inner"
                                              :desc "Select inner part of a class region"}
                                         :as {:query "@scope"
                                              :query_group :locals
                                              :desc "Select language scope"}}
                               :selection_modes {"@parameter.outer" :v
                                                 "@function.outer" :V
                                                 "@class.outer" :<c-v>}
                               :include_surrounding_whitespace true}}})

(fn setup []
  (let [treesitter (require :nvim-treesitter.configs)]
    (treesitter.setup opts)))

{1 :nvim-treesitter/nvim-treesitter
 :dependencies [{1 :nvim-treesitter/nvim-treesitter-textobjects}]
 :build ":TSUpdate"
 :event :VeryLazy
 :config (fn []
           (setup))}
