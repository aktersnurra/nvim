;; Configuration for completion plugin.
(module config.cmp {autoload {nvim aniseed.nvim util config.util}})

(let [cmp (util.prequire :cmp)
      lspkind (util.prequire :lspkind)
      luasnip (util.prequire :luasnip)
      luasnip-vscode (require :luasnip/loaders/from_vscode)]
  (luasnip-vscode.lazy_load)
  (lspkind.init)
  (cmp.setup {:snippet {:expand (fn [args]
                                  (luasnip.lsp_expand args.body))}
              :mapping (cmp.mapping.preset.insert {:<C-k> (cmp.mapping.select_prev_item)
                                                   :<C-j> (cmp.mapping.select_next_item)
                                                   :<C-b> (cmp.mapping (cmp.mapping.scroll_docs -1)
                                                                       [:i :c])
                                                   :<C-f> (cmp.mapping (cmp.mapping.scroll_docs 1)
                                                                       [:i :c])
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
                        {:name :path :keyword_length 6}]
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
              :experimental {:ghost_text false :native_menu false}}))
