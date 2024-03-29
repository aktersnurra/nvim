;; Configuration for completion plugin.

(local dependencies [:hrsh7th/cmp-buffer
                     :onsails/lspkind-nvim
                     :hrsh7th/cmp-nvim-lsp
                     :hrsh7th/cmp-cmdline
                     :petertriho/cmp-git
                     :L3MON4D3/LuaSnip
                     :rafamadriz/friendly-snippets
                     :hrsh7th/cmp-path
                     :saadparwaiz1/cmp_luasnip
                     :f3fora/cmp-spell])

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
                :mapping (cmp.mapping.preset.insert {:<c-k> (cmp.mapping.select_prev_item)
                                                     :<c-j> (cmp.mapping.select_next_item)
                                                     :<c-b> (cmp.mapping (cmp.mapping.scroll_docs -1)
                                                                         [:i
                                                                          :c])
                                                     :<c-f> (cmp.mapping (cmp.mapping.scroll_docs 1)
                                                                         [:i
                                                                          :c])
                                                     :<c-space> (cmp.mapping (cmp.mapping.complete)
                                                                             [:i
                                                                              :c])
                                                     :<c-e> (cmp.mapping {:i (cmp.mapping.abort)
                                                                          :c (cmp.mapping.close)})
                                                     :<c-y> (cmp.mapping.confirm {:select true})})
                :sources [{:name :nvim_lsp
                           :group_index 1
                           :keyword_length 3
                           :max_item_count 32}
                          {:name :buffer :group_index 2}
                          {:name :spell :group_index 3}
                          {:name :nvim_lua}
                          {:name :luasnip}
                          {:name :orgmode}
                          {:name :neorg}
                          {:name :path :keyword_length 6}
                          {:name :vim-dadbod-completion}
                          {:name :git}]
                :formatting {:format (lspkind.cmp_format {:with_text true
                                                          :menu {:buffer ""
                                                                 :nvim_lsp ""
                                                                 :nvim_lua ""
                                                                 :path ""
                                                                 :luasnip ""}})}
                :window {:documentation {:border ["╭"
                                                  "─"
                                                  "╮"
                                                  "│"
                                                  "╯"
                                                  "─"
                                                  "╰"
                                                  "│"]}
                         :completion {:scrollbar false}}
                :confirm_opts {:behavior cmp.ConfirmBehavior.Replace
                               :select false}
                :performance {:debounce 200
                              :throttle 250
                              :fetching_timeout 80
                              :max_view_entries 16}
                :experimental {:ghost_text false :native_menu false}})
    (cmp.setup.cmdline "/"
                       {:mapping (cmp.mapping.preset.cmdline)
                        :sources [{:name :buffer}]})
    (cmp.setup.cmdline ":"
                       {:mapping (cmp.mapping.preset.cmdline)
                        :sources [{:name :path}
                                  {:name :cmdline
                                   :option {:ignore_cmds [:Man "!"]}}]})))

{1 :hrsh7th/nvim-cmp : dependencies :event :InsertEnter : config}
