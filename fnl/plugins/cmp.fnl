;; Configuration for completion plugin.

(local dependencies [:L3MON4D3/LuaSnip
                     :f3fora/cmp-spell
                     :hrsh7th/cmp-buffer
                     :hrsh7th/cmp-cmdline
                     :hrsh7th/cmp-path
                     :onsails/lspkind.nvim
                     :saadparwaiz1/cmp_luasnip])

(λ config []
  (let [cmp (require :cmp)
        lspkind (require :lspkind)]
    (lspkind.init)
    (cmp.setup {:snippet {:expand (λ [args]
                                    (let [luasnip (require :luasnip)]
                                      (luasnip.lsp_expand args.body)))}
                :completion {:completopt "menu,menuone,noinsert"}
                :mapping (cmp.mapping.preset.insert {:<c-n> (cmp.mapping.select_prev_item {:behavior cmp.SelectBehavior.Insert})
                                                     :<c-e> (cmp.mapping.select_next_item {:behavior cmp.SelectBehavior.Insert})
                                                     :<c-y> (cmp.mapping (cmp.mapping.confirm {:behavior cmp.SelectBehavior.Insert
                                                                                               :select true}
                                                                                              [:i
                                                                                               :c]))})
                :sources [{:name :nvim_lsp
                           :group_index 1
                           :keyword_length 3
                           :max_item_count 32}
                          {:name :buffer :group_index 2}
                          {:name :spell :group_index 3}
                          {:name :nvim_lua}
                          {:name :luasnip :group_index 1 :keyword_length 1}
                          {:name :path :keyword_length 6}]
                :performance {:debounce 200
                              :throttle 250
                              :fetching_timeout 80
                              :max_view_entries 16}})
    (cmp.setup.filetype [:org :orgagenda]
                        {:sources [{:name :orgmode :group_index 1}
                                   {:name :buffer :group_index 2}
                                   {:name :luasnip
                                    :group_index 1
                                    :keyword_length 1}
                                   {:name :spell :group_index 3}]})
    (cmp.setup.filetype [:sql]
                        {:sources [{:name :vim-dadbod-completion
                                    :group_index 1}
                                   {:name :buffer :group_index 2}
                                   {:name :luasnip
                                    :group_index 1
                                    :keyword_length 1}
                                   {:name :spell :group_index 3}]})
    (cmp.setup.cmdline "/"
                       {:mapping (cmp.mapping.preset.cmdline)
                        :sources [{:name :buffer}]})
    (cmp.setup.cmdline ":"
                       {:mapping (cmp.mapping.preset.cmdline)
                        :sources [{:name :path}
                                  {:name :cmdline
                                   :option {:ignore_cmds [:Man "!"]}}]})))

{1 :iguanacucumber/magazine.nvim
 :name :nvim-cmp
 : dependencies
 :event :InsertEnter
 : config}
