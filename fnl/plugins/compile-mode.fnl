(local keys
       [{1 :<m-c> 2 :<cmd>Compile<cr> :desc :Compile}
        {1 :<m-C> 2 :<cmd>Recompile<cr> :desc :Recompile}
        {1 "]e" 2 :<cmd>NextError<cr> :desc "Next compile error"}
        {1 "[e" 2 :<cmd>PrevError<cr> :desc "Prev compile error"}])

(λ config []
  (set vim.g.compile_mode {:default_command {:ocaml "dune build"}
                           :bang_expansion true
                           :recompile_no_fail true
                           :auto_jump_to_first_error false
                           :ask_about_save true
                           :ask_to_interrupt true
                           :auto_scroll true}))

{1 :ej-shafran/compile-mode.nvim
 :version :^5.0.0
 :dependencies [:nvim-lua/plenary.nvim]
 : config
 : keys}
