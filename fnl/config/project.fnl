;; Provides project management.

(local opts {:active true
             :on_config_done nil
             :manual_mode false
             :detection_methods [:patterns]
             :patterns [:git :_darcs :.hg :.bzr :.svn :Makefile :package.json]
             :show_hidden false
             :silent_chdir true
             :ignore_lsp {}
             :datapath (vim.fn.stdpath :data)})

{1 :ahmedkhalf/project.nvim
 :cmd :Telescope
 :config (fn []
           (let [project (require :project_nvim)]
             (project.setup opts)))}
