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
             :icons {:breadcrumb "»" :separator "" :group "+"}
             :popup_mappings {:scroll_down :<c-d> :scroll_up :<c-u>}
             :window {:border :rounded :position :bottom :winblend 0}
             :layout {:height {:min 4 :max 25}
                      :width {:min 20 :max 50}
                      :spacing 3
                      :align :left}
             :ignore_missing true
             :hidden [:<silent> :<cmd> :<Cmd> :<CR> :call :lua "^:" "^ "]
             :show_help true
             :triggers :auto
             :disable {:filetypes [:netrw]}
             :triggers_blacklist {:i [:j :k] :v [:j :k]}})

(local mopts {:mode :n
              :prefix :m
              :buffer nil
              :silent true
              :noremap true
              :nowait true})

(local mmappings {:a [:<cmd>HarpoonAdd<cr> :Harpoon]
                  :d [:<cmd>DiffviewFileHistory<cr> :DiffviewFileHistory]
                  :f [:<cmd>FindFiles<cr> "Find files"]
                  :g ["<cmd>Telescope live_grep theme=dropdown<cr>"
                      "Find text"]
                  :n [:<cmd>Neogit<cr> :Neogit]
                  :p [:<cmd>SaveSession<cr> "Save Session"]
                  :q ["<cmd>Gitsigns diffthis HEAD<cr>" "Gitsigns diff"]
                  :r [:<cmd>HarpoonUI<cr> "Harpoon UI"]
                  :s [:<cmd>HarpoonPrev<cr> "Harpoon Prev"]
                  :t [:<cmd>HarpoonNext<cr> "Harpoon Next"]
                  :v ["<cmd>lua vim.lsp.buf.rename()<cr>" :Rename]
                  :x ["<cmd>DiffviewOpen -uno<cr>" :DiffviewOpen]
                  :z [:<cmd>DiffviewClose<cr> :DiffviewClose]})

(local nopts {:mode :n
              :prefix :<leader>
              :buffer nil
              :silent true
              :noremap true
              :nowait true})

(local find
       {:name :find
        :C ["<cmd>Telescope commands theme=dropdown<cr>" :Commands]
        :H ["<cmd>Telescope highlights<cr>" :Highlights]
        :R ["<cmd>Telescope registers theme=dropdown<cr>" :Registers]
        :S ["<cmd>Telescope grep_string theme=dropdown<cr>" "Find String"]
        :b ["<cmd>Telescope git_branches theme=dropdown<cr>" "Checkout branch"]
        :c ["<cmd>Telescope colorscheme theme=dropdown<cr>" :Colorscheme]
        :f [:<cmd>FindFiles<cr> "Find files"]
        :h ["<cmd>Telescope help_tags theme=dropdown<cr>" :Help]
        :k ["<cmd>Telescope keymaps theme=dropdown<cr>" :Keymaps]
        :l ["<cmd>Telescope resume theme=dropdown<cr>" "Last Search"]
        :p ["<cmd>Telescope projects theme=dropdown<cr>" "Find project"]
        :r ["<cmd>Telescope oldfiles theme=dropdown<cr>" "Recent File"]
        :s [:<cmd>SearchSession<cr> "Find Session"]
        :t ["<cmd>Telescope live_grep theme=dropdown<cr>" "Find text"]})

(local diagnostics {:name :diagnostics
                    :t [:<cmd>TroubleToggle<cr> :Trouble]
                    :g ["<cmd>Telescope diagnostics theme=dropdown<cr>"
                        "Telescope diagnostics"]})

(local git {:name :git
            :R ["<cmd>lua require 'gitsigns'.reset_buffer()<cr>"
                "Reset Buffer"]
            :b ["<cmd>Telescope git_branches theme=dropdown<cr>"
                "Checkout branch"]
            :c ["<cmd>Telescope git_commits theme=dropdown<cr>"
                "Checkout commit"]
            :d ["<cmd>Gitsigns diffthis HEAD<cr>" :Diff]
            :j ["<cmd>lua require 'gitsigns'.next_hunk()<cr>" "Next Hunk"]
            :k ["<cmd>lua require 'gitsigns'.prev_hunk()<cr>" "Prev Hunk"]
            :l ["<cmd>lua require 'gitsigns'.blame_line()<cr>" :Blame]
            :o ["<cmd>Telescope git_status theme=dropdown<cr>"
                "Open changed file"]
            :p ["<cmd>lua require 'gitsigns'.preview_hunk()<cr>"
                "Preview Hunk"]
            :r ["<cmd>lua require 'gitsigns'.reset_hunk()<cr>" "Reset Hunk"]
            :s ["<cmd>lua require 'gitsigns'.stage_hunk()<cr>" "Stage Hunk"]
            :u ["<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>"
                "Undo Stage Hunk"]})

(local lsp
       {:name :lsp
        :S ["<cmd>Telescope lsp_dynamic_workspace_symbols<cr>"
            "Workspace Symbols"]
        :a ["<cmd>lua vim.lsp.buf.code_action()<cr>" "Code Action"]
        :f ["<cmd>lua vim.lsp.buf.format { async = true }<cr>" :Format]
        :i [:<cmd>LspInfo<cr> :Info]
        :l ["<cmd>lua vim.lsp.codelens.run()<cr>" "CodeLens Action"]
        :r ["<cmd>lua vim.lsp.buf.rename()<cr>" :Rename]
        :s ["<cmd>Telescope lsp_document_symbols<cr>" "Document Symbols"]})

(local replace {:name :replace
                :m [:<cmd>ReplaceInBuf<cr> "Replace in Buffer"]
                :n [:<cmd>Replace<cr> :Replace]
                :e [:<cmd>ReplaceWord<cr> "Replace Word"]})

(local session
       {:name :session
        :m [:<cmd>RestoreSession<cr> "Restore session"]
        :n [:<cmd>RestoreLastSession<cr> "Restore last session"]
        :e [:<cmd>IgnoreSession<cr> "Ignore current session"]})

(local treesitter
       {:name :Treesitter :p [:<cmd>TSPlaygroundToggle<cr> :Playground]})

(local nmappings {:a ["<cmd>Telescope lsp_document_symbols theme=dropdown<cr>"
                      "Document Symbols"]
                  :T treesitter
                  :<BS> [:<cmd>BufDel<CR> "Close Buffer"]
                  :j diagnostics
                  :f find
                  :g git
                  :h [:<cmd>ColorizerToggle<cr> :Colorizer]
                  :l lsp
                  :m [:<cmd>Mason<cr> :Mason]
                  :n [:<cmd>SymbolsOutline<cr> "Symbols outline"]
                  :r replace
                  :s session
                  :t [:<cmd>ToggleTerm<cr> :Terminal]
                  :u [:<cmd>UndotreeToggle<cr> :Undotree]
                  :y ["<cmd>Lazy home<cr>" :Home]
                  :z [:<cmd>ZenMode<cr> "Zen Mode"]})

(local vopts {:mode :v
              :prefix :<leader>
              :buffer nil
              :silent true
              :noremap true
              :nowait true})

(local vmappings {:n [:<esc><cmd>CommentVisual<cr> :Comment]})

(local gopts {:mode :n
              :prefix :g
              :buffer nil
              :silent true
              :noremap true
              :nowait true})

(local gmappings {:a [:<cmd>OrgAgendaPrompt<cr> "Open agenda prompt"]
                  :c [:<cmd>OrgCapturePrompt<cr> "Open capture prompt"]
                  :m ["<cmd>Telescope orgmode search_headings theme=dropdown<cr>"
                      "Search headings"]})

(fn setup []
  (let [which-key (require :which-key)]
    (which-key.setup opts)
    (which-key.register mmappings mopts)
    (which-key.register nmappings nopts)
    (which-key.register vmappings vopts)
    (which-key.register gmappings gopts)))

{1 :folke/which-key.nvim :event :VeryLazy :config (fn [] (setup))}
