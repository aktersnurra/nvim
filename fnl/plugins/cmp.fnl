;; Configuration for completion plugin.

(local dependencies [:L3MON4D3/LuaSnip
                     :f3fora/cmp-spell
                     :hrsh7th/cmp-buffer
                     :hrsh7th/cmp-cmdline
                     :hrsh7th/cmp-path
                     :onsails/lspkind.nvim
                     :rafamadriz/friendly-snippets
                     :saadparwaiz1/cmp_luasnip])

(fn config []
  (let [cmp (require :cmp)
        lspkind (require :lspkind)
        luasnip (require :luasnip)
        luasnip-vscode (require :luasnip.loaders.from_vscode)]
    (luasnip-vscode.lazy_load)
    (lspkind.init)
    (cmp.setup {:snippet {:expand (fn [args]
                                    (luasnip.lsp_expand args.body))}
                :completion {:completopt "menu,menuone,noinsert"}
                :mapping (cmp.mapping.preset.insert {:<c-k> (cmp.mapping.select_prev_item {:behavior cmp.SelectBehavior.Insert})
                                                     :<c-j> (cmp.mapping.select_next_item {:behavior cmp.SelectBehavior.Insert})
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
                          {:name :luasnip}
                          {:name :path :keyword_length 6}]
                :performance {:debounce 200
                              :throttle 250
                              :fetching_timeout 80
                              :max_view_entries 16}})
    (cmp.setup.filetype [:org :orgagenda]
                        {:sources [{:name :orgmode :group_index 1}
                                   {:name :buffer :group_index 2}
                                   {:name :spell :group_index 3}]})
    (cmp.setup.filetype [:sql]
                        {:sources [{:name :vim-dadbod-completion
                                    :group_index 1}
                                   {:name :buffer :group_index 2}
                                   {:name :spell :group_index 3}]})
    (cmp.setup.cmdline "/"
                       {:mapping (cmp.mapping.preset.cmdline)
                        :sources [{:name :buffer}]})
    (cmp.setup.cmdline ":"
                       {:mapping (cmp.mapping.preset.cmdline)
                        :sources [{:name :path}
                                  {:name :cmdline
                                   :option {:ignore_cmds [:Man "!"]}}]})))

{1 :hrsh7th/nvim-cmp : dependencies :event :InsertEnter : config}
