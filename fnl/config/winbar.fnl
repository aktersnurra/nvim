;; Winbar settings
(module config.winbar {autoload {nvim aniseed.nvim}})

(def- ignore-filetypes {:help true
                        :startify true
                        :dashboard true
                        :packer true
                        :neogitstatus true
                        :NvimTree true
                        :Trouble true
                        :alpha true
                        :lir true
                        :Outline true
                        :spectre_panel true})

(defn- is-empty [arg] (or (= arg nil) (= arg "")))

(defn- get-filename [] (vim.fn.expand "%t:"))

(defn- get-filetype [] vim.bo.filetype)

(defn- get-extension [] (vim.fn.expand "%:e"))

(defn- ignore [] (. ignore-filetypes (get-filetype)))

(defn- get-winbar []
       (if (and (not= (ignore) true) (not= (is-empty (get-filetype)) true))
           (vim.api.nvim_set_option_value :winbar (.. " " "%t%m")
                                          {:scope :local})
           (vim.api.nvim_set_option_value :winbar "" {:scope :local})))

(nvim.create_autocmd "BufEnter,CursorMoved,CursorHold,BufWinEnter,BufFilePost,InsertEnter,BufWritePost,TabClosed"
                     {:callback (lambda []
                                  (get-winbar))})
