;; Leap through text.

(local dependencies [{1 :ggandor/flit.nvim
                      :event :VimEnter
                      :opts {:keys {:f :f :F :F :t :t :T :T}
                             :labeled_modes :v
                             :multiline true
                             :opts {}}}
                     {1 :tpope/vim-repeat :event :VeryLazy}
                     {1 :ggandor/leap-spooky.nvim
                      :event :VeryLazy
                      :opts {;; Additional text objects, to be merged with the default ones.
                             ;; E.g.: {'iq', 'aq'}
                             :extra_text_objects [:iq :aq]
                             ;; Mappings will be generated corresponding to all native text objects,
                             ;; like: (ir|ar|iR|aR|im|am|iM|aM){obj}.
                             ;; Special line objects will also be added, by repeating the affixes.
                             ;; E.g. `yrr<leap>` and `ymm<leap>` will yank a line in the current
                             ;; window.
                             :affixes {;; The cursor moves to the targeted object, and stays there.
                                       :magnetic {:window :m :cross_window :M}
                                       ;; The operation is executed seemingly remotely (the cursor boomerangs
                                       ;; back afterwards).
                                       :remote {:window :r :cross_window :R}}
                             ;; Defines text objects like `riw`, `raw`, etc., instead of
                             ;; targets.vim-style `irw`, `arw`. (Note: prefix is forced if a custom
                             ;; text object does not start with "a" or "i".)
                             :prefix true
                             ;; The yanked text will automatically be pasted at the cursor position
                             ;; if the unnamed register is in use.
                             :paste_on_remote_yank false}}])

(λ config []
  (let [leap (require :leap)]
    (leap.setup {})
    (vim.keymap.set [:n :x :o] :s "<Plug>(leap-forward)")
    (vim.keymap.set [:n :x :o] :S "<Plug>(leap-backward)")
    (vim.keymap.set [:x :o] :x "<Plug>(leap-forward-till)")
    (vim.keymap.set [:x :o] :X "<Plug>(leap-backward-till)")
    (vim.keymap.set [:n] :gs "<Plug>(leap-from-window)")))

{1 :ggandor/leap.nvim : dependencies :event :VeryLazy : config}
