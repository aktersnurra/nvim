;; Treesitter parser installation and built-in feature configuration.

(import-macros {: autocmd : ts-selects : ts-swaps : ts-moves} :macros)

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

;; fnlfmt: skip
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
    (ts-selects [:aa "@parameter.outer"] [:ia "@parameter.inner"]
                [:af "@function.outer"] [:if "@function.inner"]
                [:ii "@conditional.outer"] [:ai "@conditional.inner"]
                [:il "@loop.outer"] [:al "@loop.inner"] [:ac "@class.outer"]
                [:at "@comment.outer"] [:ic "@class.inner"]
                [:as "@local.scope" :locals]
                [:ar "@return.outer"]
                [:ir "@return.inner"]
                [:a= "@assignment.outer"]
                [:i= "@assignment.inner"])
    (ts-swaps [:<leader>a swap.swap_next "@parameter.inner"]
              [:<leader>A swap.swap_previous "@parameter.inner"])
    (ts-moves ["]m" move.goto_next_start "@function.outer"]
              ["]]" move.goto_next_start "@class.outer"]
              ["]o" move.goto_next_start ["@loop.inner" "@loop.outer"]]
              ["]s" move.goto_next_start "@local.scope" :locals]
              ["]z" move.goto_next_start "@fold" :folds]
              ["]M" move.goto_next_end "@function.outer"]
              ["][" move.goto_next_end "@class.outer"]
              ["[m" move.goto_previous_start "@function.outer"]
              ["[[" move.goto_previous_start "@class.outer"]
              ["[M" move.goto_previous_end "@function.outer"]
              ["[]" move.goto_previous_end "@class.outer"]
              ["]i" move.goto_next "@conditional.outer"]
              ["[i" move.goto_previous "@conditional.outer"]
              ["]a" move.goto_next_start "@parameter.outer"]
              ["[a" move.goto_previous_start "@parameter.outer"])))

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
