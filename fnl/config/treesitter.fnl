;; Treesitter is a tool for building syntax trees for source files.
;; In the neovim context it helps with better coloring.

(local opts {:ensure_installed [:c
                                :rust
                                :lua
                                :hcl
                                :org
                                :haskell
                                :python
                                :fennel
                                :make
                                :go
                                :ocaml
                                :erlang
                                :vim
                                :yaml
                                :html
                                :toml
                                :dockerfile
                                :markdown
                                :latex]
             :sync_install false
             :ignore_install [""]
             :autopairs {:enable true}
             :highlight {:enable true :disable [:org]}
             :context_commentstring {:enable true :enable_autocmd false}
             :indent {:enable true :disable [:yaml :python :css]}
             :playground {:enable true}})

(fn setup []
  (let [treesitter (require :nvim-treesitter.configs)]
    (treesitter.setup opts)))

{1 :nvim-treesitter/nvim-treesitter
 :build ":TSUpdate"
 :event :BufReadPost
 :config (fn []
           (setup))}
