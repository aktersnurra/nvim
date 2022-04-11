;; Configuration for completion plugin.
(module config.cmp {autoload {nvim aniseed.nvim util util}})

(let [cmp (util.load-plugin :cmp)
      lspkind (util.load-plugin :lspkind)
      luasnip (util.load-plugin :luasnip)]
  ;;((require :luasnip/loaders/from_vscode).lazy_load)
  (lspkind.init)
  (cmp.setup {:snippet {:expand (fn [args]
                                  (luasnip.lsp_expand args.body))}
              :mapping {:<C-k> (cmp.mapping.select_prev_item)
                        :<C-j> (cmp.mapping.select_next_item)
                        :<C-b> (cmp.mapping (cmp.mapping.scroll_docs -1)
                                            [:i :c])
                        :<C-f> (cmp.mapping (cmp.mapping.scroll_docs 1) [:i :c])
                        :<C-space> (cmp.mapping (cmp.mapping.complete) [:i :c])
                        :<C-e> (cmp.mapping {:i (cmp.mapping.abort)
                                             :c (cmp.mapping.close)})
                        :<CR> (cmp.mapping.confirm {:select true})
                        :<CR> (cmp.mapping.confirm {:select true})}
              :sources [{:name :nvim_lsp}
                        {:name :nvim_lua}
                        {:name :luasnip}
                        {:name :buffer :keyword_length 4}
                        {:name :path :keyword_length 6}]
              :formatting {:format (lspkind.cmp_format {:with_text true
                                                        :menu {:buffer "[Buf]"
                                                               :nvim_lsp "[LSP]"
                                                               :nvim_lua "[api]"
                                                               :path "[path]"
                                                               :luasnip "[Snip]"}})}
              :documentation {:border ["╭"
                                       "─"
                                       "╮"
                                       "│"
                                       "╯"
                                       "─"
                                       "╰"
                                       "│"]}
              :confirm_opts {:behavior cmp.ConfirmBehavior.Replace
                             :select false}
              :experimental {:ghost_text false :native_menu false}}))
