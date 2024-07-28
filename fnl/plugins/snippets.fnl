;; Snippets functionality.

(local dependencies [:rafamadriz/friendly-snippets])

(λ add-snippets [name]
  (let [snippets (require (.. :plugins.snippets. name))]
    (snippets.add-snippets)))

(local {: apply-to-files} (require :util.load))

(λ config []
  (let [ls (require :luasnip)
        luasnip-vscode (require :luasnip.loaders.from_vscode)]
    (luasnip-vscode.lazy_load)
    (apply-to-files :/fnl/plugins/snippets add-snippets)
    (ls.config.set_config {:history false
                           :updateevents "TextChanged,TextChangedI"})
    (vim.keymap.set [:i :s] :<c-u>
                    (λ []
                      (when (ls.expand_or_jumpable)
                        (ls.expand_or_jump))) {:silent true})
    (vim.keymap.set [:i :s] :<c-l>
                    (λ []
                      (when (ls.jumpable -1)
                        (ls.jump -1))
                      {:silent true}))
    (vim.keymap.set [:i] :<c-j>
                    (λ []
                      (when (ls.choice_active)
                        (ls.change_choice 1)))
                    {:silent true})))

{1 :L3MON4D3/LuaSnip :event :InsertEnter : config : dependencies}
