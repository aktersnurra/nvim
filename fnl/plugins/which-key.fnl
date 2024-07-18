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
                     :separator (.. (. icons :small-right-arrow) " ")
                     :group "+"
                     :colors false
                     :keys {:Up (.. (. icons :up-arrow) " ")
                            :Down (.. (. icons :down-arrow) " ")
                            :Left (.. (. icons :left-arrow) " ")
                            :Right (.. (. icons :right-arrow) " ")
                            :C (.. (. icons :up-caret) " ")
                            :M (.. (. icons :meta) " ")
                            :D (.. (. icons :openbased) " ")
                            :S (.. (. icons :shift) " ")
                            :CR (.. (. icons :cr) " ")
                            :Esc (.. (. icons :esc) " ")
                            :NL (.. (. icons :cr) " ")
                            :BS (.. (. icons :bs) " ")
                            :Space (.. (. icons :space) " ")
                            :Tab (.. (. icons :tab) " ")}}
             :layout {:height {:min 4 :max 25}
                      :width {:min 20 :max 50}
                      :spacing 3
                      :align :left}
             :show_help true
             :disable {:filetypes [:netrw]}})

(local groups [{:mode [:n :v]
                1 {1 :<leader>d :group :+db}
                2 {1 :<leader>f :group :+find}
                3 {1 :<leader>g :group :+git}
                4 {1 :<leader>i :group :+diffview}
                5 {1 :<leader>j :group :+diagnostics}
                6 {1 :<leader>l :group :+lsp}
                7 {1 :<leader>o :group :+orgmode}
                8 {1 :<leader>r :group :+replace}
                9 {1 :<leader>s :group :+session}
                10 {1 :<leader>w :group :+worktree}}])

(fn config []
  (let [which-key (require :which-key)]
    (which-key.setup opts)
    (which-key.add groups)))

{1 :folke/which-key.nvim
 :event :VeryLazy
 : config
 :dependencies :nvim-tree/nvim-web-devicons}
