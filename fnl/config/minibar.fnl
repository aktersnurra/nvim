(module config.minibar {autoload {: util}})

(let [minibar (util.load-plugin :minibar)]
  (minibar.setup {:ignore-filetypes [:help
                                     :startify
                                     :dashboard
                                     :packer
                                     :neogitstatus
                                     :NvimTree
                                     :Trouble
                                     :alpha
                                     :lir
                                     :Outline
                                     :NeogitStatus
                                     :NeogitCommitMessage
                                     :NeogitNotification
                                     :NeogitCommitView
                                     :spectre_panel]}))
