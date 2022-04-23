;; Treesitter is a tool for building syntax trees for source files.
;; In the neovim context it helps with better coloring.
(module config.treesitter {autoload {util util}})

(let [treesitter (util.load-plugin :nvim-treesitter.configs)]
  (treesitter.setup
    {:ensure_installed [:c
                        :rust
                        :lua
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
     :highlight {:enable true
                 :disable [:org]
                 :additional_vim_regex_highlighting [:org]}
     :context_commentstring {:enable true :enable_autocmd false}
     :indent {:enable true :disable [:yaml :python :css]}
     :playground {:enable true}}))
