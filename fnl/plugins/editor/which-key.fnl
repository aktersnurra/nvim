;; Which-key provides a pop-up menu for some key mappings.

(local opts {:plugins {:marks true
                       :registers true
                       :spelling {:enabled true :suggestions 20}
                       :presets {:operators false
                                 :motions false
                                 :text_objects false
                                 :windows true
                                 :nav true
                                 :z true
                                 :g true}}
             :icons {:breadcrumb "»" :separator " " :group "+"}
             :popup_mappings {:scroll_down :<c-d> :scroll_up :<c-u>}
             :window {:border :rounded :position :bottom :winblend 0}
             :layout {:height {:min 4 :max 25}
                      :width {:min 20 :max 50}
                      :spacing 3
                      :align :left}
             :hidden [:<silent> :<cmd> :<Cmd> :<CR> :call :lua "^:" "^ "]
             :show_help true
             :triggers :auto
             :disable {:filetypes [:netrw]}
             :triggers_blacklist {:i [:j :k] :v [:j :k]}})

(local groups {:mode [:n :v]
               :<leader>g {:name :+git}
               :<leader>j {:name :+diagnostics}
               :<leader>f {:name :+find}
               :<leader>l {:name :+lsp}
               :<leader>r {:name :+replace}
               :<leader>s {:name :+session}})

(fn setup []
  (let [which-key (require :which-key)]
    (which-key.setup opts)
    (which-key.register groups)))

{1 :folke/which-key.nvim
 :event :VeryLazy
 :config (fn []
           (setup))}
