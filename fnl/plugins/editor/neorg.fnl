;; Orgmode but better.

(local opts {:load {:core.defaults {}
                    :core.concealer {}
                    :core.summary {}
                    :core.completion {:config {:engine :nvim-cmp}}
                    :core.presenter {:config {:zen_mode :zen-mode}}
                    :core.dirman {:config {:workspaces {:master "~/.local/share/norg"
                                                        :molecular-notes "~/.local/share/norg/molecular-notes"
                                                        :gtd "~/.local/share/norg/gtd"}
                                           :autochdir false
                                           :default_workspace :master}}
                    :core.integrations.telescope {}}})

(fn config []
  (let [neorg (require :neorg)]
    (neorg.setup opts)))

(local auto-cmds
       [[:FileType
         {:pattern :norg
          :callback (fn []
                      (tset vim.opt_local :conceallevel 3))}]])

(fn init []
  (let [cmds (require :util.cmds)]
    (cmds.create-auto-cmds auto-cmds)))

{1 :nvim-neorg/neorg
 :build ":Neorg sync-parsers"
 :keys [{1 :<cr> 2 :VBox<cr> :mode :v}]
 :ft :norg
 :cmd :Norg
 : init
 : config
 :dependencies [:nvim-lua/plenary.nvim
                :nvim-neorg/neorg-telescope
                :jbyuki/venn.nvim]}
