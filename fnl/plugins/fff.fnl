;; Freakin fast fuzzy file finder.

(import-macros {: autocmd} :macros)

(λ init []
  (autocmd :VimEnter {:callback (λ []
                                  (when (= (. (vim.fn.argv) 1) nil)
                                    (vim.schedule (λ []
                                                    ((. (require :fff)
                                                        :find_files))))))
                      :once true}))

(local opts {:layout {:height 0.8
                      :width 0.7
                      :prompt_position :top
                      :preview_position :bottom
                      :preview_size 0.8
                      :flex {:size 130 :wrap :top}
                      :show_scrollbar false
                      :path_shorten_strategy :middle_number}})

{1 :dmtrKovalenko/fff.nvim
 :build (λ []
          ((. (require :fff.download) :build_binary) (λ [ok err]
                                                       (vim.schedule (λ []
                                                                       (vim.notify (if ok
                                                                                       "fff.nvim built!"
                                                                                       err)))))))
 : opts
 :lazy false
 : init
 :keys [{1 :mf
         2 (λ []
             ((. (require :fff) :find_files)))
         :desc "Find Files"}
        {1 :mg
         2 (λ []
             ((. (require :fff) :live_grep)))
         :desc "Live Grep"}]}
