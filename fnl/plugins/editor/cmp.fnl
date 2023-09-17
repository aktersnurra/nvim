;; Configuration for completion plugin.

(fn setup []
  (let [cmp (require :cmp)
        lspkind (require :lspkind)
        luasnip (require :luasnip)
        luasnip-vscode (require :luasnip.loaders.from_vscode)]
    (luasnip-vscode.lazy_load)
    (lspkind.init)
    (cmp.setup {:snippet {:expand (fn [args]
                                    (luasnip.lsp_expand args.body))}
                :completion {:completopt "menu,menuone,noinsert"}
                :mapping (cmp.mapping.preset.insert {:<C-k> (cmp.mapping.select_prev_item)
                                                     :<C-j> (cmp.mapping.select_next_item)
                                                     :<C-b> (cmp.mapping (cmp.mapping.scroll_docs -1)
                                                                         [:i
                                                                          :c])
                                                     :<C-f> (cmp.mapping (cmp.mapping.scroll_docs 1)
                                                                         [:i
                                                                          :c])
                                                     :<C-space> (cmp.mapping (cmp.mapping.complete)
                                                                             [:i
                                                                              :c])
                                                     :<C-e> (cmp.mapping {:i (cmp.mapping.abort)
                                                                          :c (cmp.mapping.close)})
                                                     :<CR> (cmp.mapping.confirm {:select true})
                                                     :<CR> (cmp.mapping.confirm {:select true})})
                :sources [{:name :nvim_lsp}
                          {:name :nvim_lua}
                          {:name :luasnip}
                          {:name :spell}
                          {:name :orgmode}
                          {:name :buffer :keyword_length 4}
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
                                                  "│"]}}
                :confirm_opts {:behavior cmp.ConfirmBehavior.Replace
                               :select false}
                :experimental {:ghost_text false :native_menu false}})))

{1 :hrsh7th/nvim-cmp
 :dependencies [:hrsh7th/cmp-buffer
                :onsails/lspkind-nvim
                :hrsh7th/cmp-nvim-lsp
                :hrsh7th/cmp-cmdline
                :petertriho/cmp-git
                :L3MON4D3/LuaSnip
                :rafamadriz/friendly-snippets
                :hrsh7th/cmp-path
                :saadparwaiz1/cmp_luasnip
                :f3fora/cmp-spell]
 :event :InsertEnter
 :config (fn []
           (setup))}
