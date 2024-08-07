;; Draw ASCII diagrams in Neovim

(λ enable [win]
  (tset (. vim.w win) :venn_enabled true)
  (set vim.wo.virtualedit :all)
  (vim.api.nvim_buf_set_keymap 0 :n :J "<c-v>j:VBox<cr>" {:noremap true})
  (vim.api.nvim_buf_set_keymap 0 :n :K "<c-v>k:VBox<cr>" {:noremap true})
  (vim.api.nvim_buf_set_keymap 0 :n :L "<c-v>l:VBox<cr>" {:noremap true})
  (vim.api.nvim_buf_set_keymap 0 :n :H "<c-v>h:VBox<cr>" {:noremap true})
  (vim.api.nvim_buf_set_keymap 0 :v :f ":VBox<cr>" {:noremap true}))

(λ disable [win]
  (set vim.wo.virtualedit "")
  (vim.api.nvim_buf_del_keymap 0 :n :J)
  (vim.api.nvim_buf_del_keymap 0 :n :K)
  (vim.api.nvim_buf_del_keymap 0 :n :L)
  (vim.api.nvim_buf_del_keymap 0 :n :H)
  (vim.api.nvim_buf_del_keymap 0 :v :f)
  (tset (. vim.w win) :venn_enabled nil))

(λ toggle []
  (let [win (vim.api.nvim_get_current_win)]
    (let [enabled (vim.inspect (. (. vim.w win) :venn_enabled))]
      (if (= enabled :nil)
          (enable win)
          (disable win)))))

(local keys [{1 :<leader>v
              2 (λ []
                  (toggle))
              :desc "Toggle Venn Diagram"}])

{1 :jbyuki/venn.nvim : keys}
