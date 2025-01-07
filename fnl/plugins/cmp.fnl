;; Configuration for completion plugin.

(local opts {:keymap {:preset :default}
             :appearance {:use_nvim_cmp_as_default false
                          :nerd_font_variant :mono}
             :completion {:menu {:scrollbar false :border :none}
                          :documentation {:window {:border :none
                                                   :scrollbar false}}}
             :signature {:enabled false :window {:scrollbar false}}
             :sources {:default [:lsp :path :snippets :buffer :luasnip :dadbod]
                       :providers {:lsp {:name :LSP
                                         :module :blink.cmp.sources.lsp
                                         :fallbacks [:snippets
                                                     :luasnip
                                                     :buffer]
                                         :score_offset 96}
                                   :luasnip {:name :Luasnip
                                             :module :blink.cmp.sources.luasnip
                                             :min_keyword_length 2
                                             :fallbacks [:snippets]
                                             :score_offset 90}
                                   :dadbod {:name :Dadbod
                                            :module :vim_dadbod_completion.blink
                                            :score_offset 88}}}
             :snippets {:expand (λ [snippet]
                                  (let [luasnip (require :luasnip)]
                                    (luasnip.lsp_expand snippet)))
                        :active (fn [filter]
                                  (let [luasnip (require :luasnip)]
                                    (when (and filter filter.direction)
                                      (luasnip.jumpable filter.direction))
                                    (luasnip.in_snippet)))
                        :jump (λ [direction]
                                (let [luasnip (require :luasnip)]
                                  (luasnip.jump direction)))}})

(local dependencies [:rafamadriz/friendly-snippets
                     {1 :L3MON4D3/LuaSnip :version :v2.*}])

{1 :saghen/blink.cmp :version "*" : dependencies :event :InsertEnter : opts}
