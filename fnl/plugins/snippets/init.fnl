;; Snippets functionality.

(local dependencies [:rafamadriz/friendly-snippets])

(fn add-snippets []
  (let [org (require :plugins.snippets.org)
        workflow (require :plugins.snippets.workflow)]
    (org.add-snippets)
    (workflow.add-snippets)))

(fn config []
  (let [ls (require :luasnip)
        luasnip-vscode (require :luasnip.loaders.from_vscode)]
    (luasnip-vscode.lazy_load)
    (add-snippets)
    (ls.config.set_config {:history false
                           :updateevents "TextChanged,TextChangedI"})
    (vim.keymap.set [:i :s] :<c-k>
                    (lambda []
                      (when (ls.expand_or_jumpable)
                        (ls.expand_or_jump))) {:silent true})
    (vim.keymap.set [:i :s] :<c-j>
                    (lambda []
                      (when (ls.jumpable -1)
                        (ls.jump -1))
                      {:silent true}))
    (vim.keymap.set [:i] :<c-l>
                    (lambda []
                      (when (ls.choice_active)
                        (ls.change_choice 1)))
                    {:silent true})))

{1 :L3MON4D3/LuaSnip :event :InsertEnter : config : dependencies}
