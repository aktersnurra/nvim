;; Treesitter parser installation and built-in feature configuration.

(import-macros {: autocmd : keymaps} :macros)

(local parsers [:bash
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
                :markdown_inline
                :ocaml
                :ocaml_interface
                :python
                :rust
                :sql
                :toml
                :unison
                :vim
                :vimdoc
                :xml
                :yaml])

(λ setup-textobjects []
  (let [textobjects (require :nvim-treesitter-textobjects)
        select (require :nvim-treesitter-textobjects.select)
        swap (require :nvim-treesitter-textobjects.swap)
        move (require :nvim-treesitter-textobjects.move)]
    (textobjects.setup {:select {:lookahead true
                                 :selection_modes {"@parameter.outer" :v
                                                   "@function.outer" :V
                                                   "@class.outer" :<c-v>}
                                 :include_surrounding_whitespace true}
                        :move {:set_jumps true}})
    (keymaps [[:x :o]
              :aa
              (λ []
                (select.select_textobject "@parameter.outer" :textobjects))
              {}] [[:x :o]
                                :ia
                                (λ []
                                  (select.select_textobject "@parameter.inner"
                                                            :textobjects))
                                {}]
             [[:x :o]
              :af
              (λ []
                (select.select_textobject "@function.outer" :textobjects))
              {}] [[:x :o]
                               :if
                               (λ []
                                 (select.select_textobject "@function.inner"
                                                           :textobjects))
                               {}]
             [[:x :o]
              :ii
              (λ []
                (select.select_textobject "@conditional.outer" :textobjects))
              {}] [[:x :o]
                               :ai
                               (λ []
                                 (select.select_textobject "@conditional.inner"
                                                           :textobjects))
                               {}]
             [[:x :o]
              :il
              (λ []
                (select.select_textobject "@loop.outer" :textobjects))
              {}] [[:x :o]
                               :al
                               (λ []
                                 (select.select_textobject "@loop.inner"
                                                           :textobjects))
                               {}]
             [[:x :o]
              :ac
              (λ []
                (select.select_textobject "@class.outer" :textobjects))
              {}] [[:x :o]
                               :at
                               (λ []
                                 (select.select_textobject "@comment.outer"
                                                           :textobjects))
                               {}]
             [[:x :o]
              :ic
              (λ []
                (select.select_textobject "@class.inner" :textobjects))
              {}] [[:x :o]
                               :as
                               (λ []
                                 (select.select_textobject "@local.scope"
                                                           :locals))
                               {}] ;; Swap
             [:n
              :<leader>a
              (λ []
                (swap.swap_next "@parameter.inner"))
              {}] [:n
                               :<leader>A
                               (λ []
                                 (swap.swap_previous "@parameter.inner"))
                               {}] ;; Move
             [[:n :x :o]
              "]m"
              (λ []
                (move.goto_next_start "@function.outer" :textobjects))
              {}] [[:n :x :o]
                               "]]"
                               (λ []
                                 (move.goto_next_start "@class.outer"
                                                       :textobjects))
                               {}]
             [[:n :x :o]
              "]o"
              (λ []
                (move.goto_next_start ["@loop.inner" "@loop.outer"]
                                      :textobjects))
              {}] [[:n :x :o]
                               "]s"
                               (λ []
                                 (move.goto_next_start "@local.scope" :locals))
                               {}]
             [[:n :x :o]
              "]z"
              (λ []
                (move.goto_next_start "@fold" :folds))
              {}] [[:n :x :o]
                               "]M"
                               (λ []
                                 (move.goto_next_end "@function.outer"
                                                     :textobjects))
                               {}]
             [[:n :x :o]
              "]["
              (λ []
                (move.goto_next_end "@class.outer" :textobjects))
              {}] [[:n :x :o]
                               "[m"
                               (λ []
                                 (move.goto_previous_start "@function.outer"
                                                           :textobjects))
                               {}]
             [[:n :x :o]
              "[["
              (λ []
                (move.goto_previous_start "@class.outer" :textobjects))
              {}] [[:n :x :o]
                               "[M"
                               (λ []
                                 (move.goto_previous_end "@function.outer"
                                                         :textobjects))
                               {}]
             [[:n :x :o]
              "[]"
              (λ []
                (move.goto_previous_end "@class.outer" :textobjects))
              {}] [[:n :x :o]
                               "]i"
                               (λ []
                                 (move.goto_next "@conditional.outer"
                                                 :textobjects))
                               {}]
             [[:n :x :o]
              "[i"
              (λ []
                (move.goto_previous "@conditional.outer" :textobjects))
              {}])))

(λ config []
  (let [treesitter (require :nvim-treesitter)]
    (treesitter.install parsers))
  (autocmd :FileType
           {:callback (λ [args]
                        (pcall vim.treesitter.start args.buf)
                        (tset vim.bo args.buf :indentexpr
                              "v:lua.require'nvim-treesitter'.indentexpr()"))})
  (setup-textobjects))

{1 :nvim-treesitter/nvim-treesitter
 :branch :main
 :dependencies [{1 :nvim-treesitter/nvim-treesitter-textobjects :branch :main}]
 :build ":TSUpdate"
 :event [:VeryLazy]
 : config}
