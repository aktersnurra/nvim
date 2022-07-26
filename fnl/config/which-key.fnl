;; Which-key provides a pop-up meny for some key mappings.
(module config.which-key {autoload {: util nvim aniseed.nvim}})

(def- setup {:plugins {:marks true
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
             :window {:border :rounded
                      :position :bottom
                      :margin [1 0 1 0]
                      :padding [2 2 2 2]
                      :winblend 0}
             :layout {:height {:min 4 :max 25}
                      :width {:min 20 :max 50}
                      :spacing 3
                      :align :left}
             :ignore_missing true
             :hidden [:<silent> :<cmd> :<Cmd> :<CR> :call :lua "^:" "^ "]
             :show_help true
             :triggers :auto
             :triggers_blacklist {:i [:j :k] :v [:j :k]}})

(def- opts {:mode :n
            :prefix :<leader>
            :buffer nil
            :silent true
            :noremap true
            :nowait true})

(def- mappings
      {:k ["<cmd>lua require('Comment.api').toggle_current_linewise()<CR>"
           :Comment]
       :A [:<cmd>Alpha<cr> :Alpha]
       :a {:name :Aerial
           :a [:<cmd>AerialToggle!<CR> "Toggle Aerial"]
           :c [:<cmd>AerialClose<CR> "Close Aerial"]}
       :e [:<cmd>NvimTreeToggle<cr> :Explorer]
       :c [:<cmd>Bdelete!<CR> "Close Buffer"]
       :P ["<cmd>Telescope projects<cr>" :Projects]
       :z [:<cmd>ZenMode<cr> "Zen Mode"]
       :b ["<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{sort_lastused = true, initial_mode = 'normal', previewer = false})<cr>"
           "Switch buffers"]
       :f ["<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>"
           "Find files"]
       :t ["<cmd>Telescope live_grep theme=ivy<cr>" "Find text"]
       :p {:name :Packer
           :c [:<cmd>PackerCompile<cr> :Compile]
           :i [:<cmd>PackerInstall<cr> :Install]
           :s [:<cmd>PackerSync<cr> :Sync]
           :S [:<cmd>PackerStatus<cr> :Status]
           :u [:<cmd>PackerUpdate<cr> :Update]}
       :g {:name :Git
           :g ["<cmd>lua _LAZYGIT_TOGGLE()<CR>" :Lazygit]
           :j ["<cmd>lua require 'gitsigns'.next_hunk()<cr>" "Next Hunk"]
           :k ["<cmd>lua require 'gitsigns'.prev_hunk()<cr>" "Prev Hunk"]
           :l ["<cmd>lua require 'gitsigns'.blame_line()<cr>" :Blame]
           :p ["<cmd>lua require 'gitsigns'.preview_hunk()<cr>" "Preview Hunk"]
           :r ["<cmd>lua require 'gitsigns'.reset_hunk()<cr>" "Reset Hunk"]
           :R ["<cmd>lua require 'gitsigns'.reset_buffer()<cr>" "Reset Buffer"]
           :s ["<cmd>lua require 'gitsigns'.stage_hunk()<cr>" "Stage Hunk"]
           :u ["<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>"
               "Undo Stage Hunk"]
           :o ["<cmd>Telescope git_status<cr>" "Open changed file"]
           :b ["<cmd>Telescope git_branches<cr>" "Checkout branch"]
           :c ["<cmd>Telescope git_commits<cr>" "Checkout commit"]
           :d ["<cmd>Gitsigns diffthis HEAD<cr>" :Diff]
           :n [:<cmd>Neogit<cr> :Neogit]}
       :l {:name :LSP
           :a ["<cmd>lua vim.lsp.buf.code_action()<cr>" "Code Action"]
           :d ["<cmd>Telescope lsp_document_diagnostics<cr>"
               "Document Diagnostics"]
           :w ["<cmd>Telescope lsp_workspace_diagnostics<cr>"
               "Workspace Diagnostics"]
           :f ["<cmd>lua vim.lsp.buf.format { async = true }<cr>" :Format]
           :i [:<cmd>LspInfo<cr> :Info]
           :j ["<cmd>lua vim.lsp.diagnostic.goto_next({buffer=0})<CR>" "Next Diagnostic"]
           :k ["<cmd>lua vim.lsp.diagnostic.goto_prev({buffer=0})<cr>" "Prev Diagnostic"]
           :l ["<cmd>lua vim.lsp.codelens.run()<cr>" "CodeLens Action"]
           :q ["<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>" :Quickfix]
           :r ["<cmd>lua vim.lsp.buf.rename()<cr>" :Rename]
           :s ["<cmd>Telescope lsp_document_symbols<cr>" "Document Symbols"]
           :S ["<cmd>Telescope lsp_dynamic_workspace_symbols<cr>"
               "Workspace Symbols"]}
       :s [(fn switch-window []
             (let [window-picker (require :window-picker)]
               (let [win (window-picker.pick_window)]
                 (if (not= win nil)
                     (nvim.set_current_win win)))))
           "Switch window"]
       :o {:name :Orgmode
           :a ["<cmd>lua require('orgmode').action('agenda.prompt')"
               "Open agenda prompt"]
           :c ["<cmd>lua require('orgmode').action('capture.prompt')"
               "Open capture prompt"]}
       :r {:name :Replace
           :r ["<cmd>lua require('spectre').open()<cr>" :Replace]
           :w ["<cmd>lua require('spectre').open_visual({select_word=true})<cr>"
               "Replace Word"]
           :f ["<cmd>lua require('spectre').open_file_search()<cr>"
               "Replace Buffer"]}
       :s [(fn switch-window []
             (let [window-picker (require :window-picker)]
               (let [win (window-picker.pick_window)]
                 (if (not= win nil)
                     (nvim.set_current_win win)))))
           "Switch window"]
       :T {:name :Treesitter :p [:<cmd>TSPlaygroundToggle<cr> :Playground]}})

(def- vopts {:mode :v
             :prefix :<leader>
             :buffer nil
             :silent true
             :noremap true
             :nowait true})

(def- vmappings {:k ["<ESC><CMD>lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())<CR>"
                     :Comment]})

(let [which-key (util.load-plugin :which-key)]
  (which-key.setup setup)
  (which-key.register mappings opts)
  (which-key.register vmappings vopts))
