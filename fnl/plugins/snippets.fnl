;; Snippets functionality.

(local dependencies [:rafamadriz/friendly-snippets])

(λ add-snippets [name]
  (let [snippets (require (.. :plugins.snippets. name))]
    (snippets.add-snippets)))

(λ config []
  (let [ls (require :luasnip)
        luasnip-vscode (require :luasnip.loaders.from_vscode)]
    (luasnip-vscode.lazy_load)
    (each [fname type (vim.fs.dir (.. (vim.fn.stdpath :config)
                                      :/fnl/plugins/snippets))]
      (when (= type :file)
        (add-snippets (fname:match "^(.*)%.fnl$"))))
    (ls.config.set_config {:history true
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
