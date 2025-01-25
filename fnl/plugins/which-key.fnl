;; Which-key provides a pop-up menu for some key mappings.

(local icons (require :settings.icons))

(local opts {:plugins {:marks true
                       :registers true
                       :spelling {:enabled true :suggestions 20}
                       :presets {:operators true
                                 :motions true
                                 :text_objects true
                                 :windows true
                                 :nav true
                                 :z true
                                 :g true}}
             :icons {:breadcrumb (. icons :guillemet)
                     :separator (.. (. icons :small-arrow-right) " ")
                     :group "+"
                     :colors false
                     :keys {:Up (.. (. icons :arrow-up) " ")
                            :Down (.. (. icons :arrow-down) " ")
                            :Left (.. (. icons :arrow-left) " ")
                            :Right (.. (. icons :arrow-right) " ")
                            :C (.. (. icons :up-caret) " ")
                            :M (.. (. icons :meta) " ")
                            :D (.. (. icons :openbased) " ")
                            :S (.. (. icons :shift) " ")
                            :CR (.. (. icons :cr) " ")
                            :Esc (.. (. icons :esc) " ")
                            :NL (.. (. icons :cr) " ")
                            :BS (.. (. icons :bs) " ")
                            :Space "  "
                            :Tab (.. (. icons :tab) " ")}}
             :layout {:height {:min 4 :max 25}
                      :width {:min 20 :max 50}
                      :spacing 3
                      :align :left}
             :show_help true
             :disable {:filetypes [:netrw]}})

(local groups [{:mode [:n :v]
                1 {1 :<leader>d :group :+diff}
                2 {1 :<leader>f :group :+find}
                3 {1 :<leader>g :group :+git}
                4 {1 :<leader>i :group :+db}
                5 {1 :<leader>j :group :+diagnostics}
                6 {1 :<leader>l :group :+lsp}
                7 {1 :<leader>o :group :+orgmode}
                8 {1 :<leader>r :group :+replace}
                9 {1 :<leader>s :group :+session}
                10 {1 :<leader>w :group :+worktree}}])

(λ config []
  (let [which-key (require :which-key)]
    (which-key.setup opts)
    (which-key.add groups)))

{1 :folke/which-key.nvim
 :event :VeryLazy
 : config
 :dependencies :nvim-tree/nvim-web-devicons}
