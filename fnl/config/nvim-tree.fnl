;; A file explorer.
(module config.nvim-tree {autoload {util util nvim aniseed.nvim}})

(set nvim.g.nvim_tree_show_icons
  { :git 1 :folders 1 :files 1 :folder_arrows 1 })

(set nvim.g.nvim_tree_icons
     {:default ""
      :symlink ""
      :git {:unstaged ""
            :staged :S
            :unmerged ""
            :renamed "➜"
            :deleted ""
            :untracked :U
            :ignored "◌"}
      :folder {:default ""
               :open ""
               :empty ""
               :empty_open ""
               :symlink ""}})

(let [nvim-tree (util.load-plugin :nvim-tree)
      nvim-tree-config (util.load-plugin :nvim-tree.config)]
  (let [tree-cb nvim-tree-config.nvim_tree_callback]
    (nvim-tree.setup
      {:auto_reload_on_write true
       :disable_netrw false
       :hide_root_folder false
       :hijack_cursor false
       :hijack_netrw true
       :hijack_unnamed_buffer_when_opening false
       :ignore_buffer_on_setup false
       :open_on_setup false
       :open_on_tab false
       :sort_by :name
       :update_cwd true
       :view
        {:width 30
         :height 30
         :side :left
         :preserve_window_proportions false
         :number false
         :relativenumber false
         :signcolumn :yes
         :mappings
           {:custom_only false
            :list [{:key [:l :<CR> :o]
                    :cb (tree_cb :edit)}
                   {:key :h
                    :cb (tree_cb :close_node)}
                   {:key :v :cb (tree_cb :vsplit)}]}}
       :renderer
        {:icons
         {:webdev_colors false}}
       :hijack_directories {:enable true :auto_open true}
       :update_focused_file {:enable true
                             :update_cwd true
                             :ignore_list {}}
       :ignore_ft_on_setup [:startify :dashboard :alpha]
       :system_open {:cmd nil :args {}}
       :diagnostics {:enable true
                     :show_on_dirs false
                     :icons {:hint ""
                             :info ""
                             :warning ""
                             :error ""}}
       :filters {:dotfiles false :custom {} :exclude {}}
       :git {:enable true :ignore true :timeout 400}
       :actions
       {:change_dir {:enable true :global false}
        :open_file {:quit_on_open false
                    :resize_window false
                    :window_picker
                      {:enable true
                       :chars :ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890
                       :exclude
                        {:filetype
                         [:notify
                          :packer
                          :qf
                          :diff
                          :fugitive
                          :fugitiveblame]
                         :buftype [:nofile
                                   :terminal
                                   :help]}}}}
       :trash {:cmd :trash :require_confirm true}
       :log {:enable false
             :truncate false
             :types {:all false
                     :config false
                     :copy_paste false
                     :git false
                     :profile false}}})))
