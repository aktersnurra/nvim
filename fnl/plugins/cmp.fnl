;; Configuration for completion plugin.

(local opts
       {:keymap {:preset :default}
        :appearance {:use_nvim_cmp_as_default true :nerd_font_variant :mono}
        :sources {:default {:lsp :path :snippets :buffer}}
        :menu {:border :single :scrollbar false}
        :documentation {:window {:border :single :scrollbar false}}
        :signature {:enabled true :window {:border :single :scrollbar false}}})

(local dependencies [:rafamadriz/friendly-snippets])

{1 :saghen/blink.cmp :version :v0.* : dependencies :event :InsertEnter : opts}
