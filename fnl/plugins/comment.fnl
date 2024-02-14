;; Language aware commenting.

(local opts {:toggler {;; Line-comment toggle keymap
                       :line :mpc
                       ;; Block-comment toggle keymap
                       :block :mbc}
             ;; LHS of operator-pending mappings in NORMAL and VISUAL mode
             :opleader {;; Line-comment keymap
                        :line :mp
                        ;; Block-comment keymap
                        :block :mb}
             ;; LHS of extra mappings
             :extra {;; Add comment on the line above
                     :above :mpO
                     ;; Add comment on the line below
                     :below :mpo
                     ;; Add comment at the end of line
                     :eol :mpA}})

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

{1 :numToStr/Comment.nvim :event :BufReadPost : inti : opts}
