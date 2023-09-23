;; Language aware commenting.

(local user-cmds [[:CommentNormal
              (lambda []
                (let [comment-api (require :Comment.api)]
                  (comment-api.toggle.linewise.current)))
              {:nargs 0}]
             [:CommentVisual
              (lambda []
                (let [comment-api (require :Comment.api)]
                  (comment-api.toggle.linewise (vim.fn.visualmode))))
              {:nargs 0}]])

(fn init []
  (let [cmds (require :util.cmds)]
    (cmds.create-user-cmds user-cmds)))

{1 :numToStr/Comment.nvim
 :event :BufReadPost
 : inti
 :opts {:toggler {;; Line-comment toggle keymap
                  :line :mcc
                  ;; Block-comment toggle keymap
                  :block :mbc}
        ;; LHS of operator-pending mappings in NORMAL and VISUAL mode
        :opleader {;; Line-comment keymap
                   :line :mc
                   ;; Block-comment keymap
                   :block :mb}
        ;; LHS of extra mappings
        :extra {;; Add comment on the line above
                :above :mcO
                ;; Add comment on the line below
                :below :mco
                ;; Add comment at the end of line
                :eol :mcA}}}
