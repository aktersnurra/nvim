(fn create-user-cmds [user-cmds]
  (each [_ user-cmd (ipairs user-cmds)]
    (match user-cmd
      [event cmd opts] (vim.api.nvim_create_user_command event cmd opts))))

(fn create-auto-cmds [auto-cmds]
  (each [_ auto-cmd (ipairs auto-cmds)]
    (match auto-cmd
      [event opts] (vim.api.nvim_create_autocmd event opts))))

{: create-user-cmds : create-auto-cmds}
