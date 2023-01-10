;; Simple file manager.

(fn opts [actions mark-actions clipboard-actions]
  {:show_hidden_files false
   :devicons_enable true
   :mappings {:l actions.edit
              :<C-s> actions.split
              :v actions.vsplit
              :<C-t> actions.tabedit
              :h actions.up
              :q actions.quit
              :A actions.mkdir
              :a actions.newfile
              :r actions.rename
              "@" actions.cd
              :Y actions.yank_path
              :i actions.toggle_show_hidden
              :d actions.delete
              :J (fn []
                   (mark-actions.toggle_mark)
                   (vim.cmd "normal! j"))
              :c clipboard-actions.copy
              :x clipboard-actions.cut
              :p clipboard-actions.paste}
   :float {:winblend 0
           :curdir_window {:enable false :highlight_dirname true}
           :win_opts (fn []
                       (let [width (math.floor (* vim.o.columns 0.7))
                             height (math.floor (* vim.o.lines 0.7))]
                         {:border :rounded : width : height}))}
   :hide_cursor false
   :on_init (fn []
              (vim.api.nvim_buf_set_keymap 0 :x :J
                                           ":<C-u>lua require(\"lir.mark.actions\").toggle_mark(\"v\")<CR>"
                                           {:noremap true :silent true}))})

(fn setup []
  (let [actions (require :lir.actions)
        clipboard-actions (require :lir.clipboard.actions)
        mark-actions (require :lir.mark.actions)
        lir (require :lir)]
    (tset vim.g :loaded_netrw 1)
    (tset vim.g :loaded_netrwPlugin 1)
    (lir.setup (opts actions mark-actions clipboard-actions))
    (vim.keymap.set :n "-" ":lua require'lir.float'.toggle()<cr>"
                    {:noremap true :silent true})))

{1 :tamago324/lir.nvim
 :keys "-"
 :config (fn []
           (setup))
 :dependencies [:kyazdani42/nvim-web-devicons]}
