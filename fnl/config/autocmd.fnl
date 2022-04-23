;; A customizable greeter.
(module config.autocmd
  {autoload {nvim aniseed.nvim
             a    aniseed.core
             util util}})

(defn- autocmd-v1 [group cmds] (nvim.command (.. "augroup " group))
      (nvim.command :autocmd!)
      (each [_ cmd (ipairs cmds)]
        (nvim.command (.. "autocmd " cmd)))
      (nvim.command "augroup end"))

(defn- group [name]
  (nvim.create_augroup name {:clear true}))

(defn- autocmd-v2 [event opts name]
  (nvim.create_autocmd event (a.merge! {:group (group name)} opts)))

(def- alpha
  ["User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2"])

(def- nvim-tree-autoclose
  ["BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif"])

(autocmd-v1 :_alpha alpha)
(autocmd-v1 :_nvim-tree nvim-tree-autoclose)

(autocmd-v2 :FileType
         {:pattern [:qf :help :man :lspinfo]
          :command "nnoremap <silent> <buffer> q :close<CR>"}
         :_general_settings)

(autocmd-v2 :TextYankPost
         {:callback (lambda [] (vim.highlight.on_yank {:timeout 200}))}
         :_general_settings)

(autocmd-v2 :BufWinEnter
         {:command "setlocal formatoptions-=cro"}
         :_general_settings)

(autocmd-v2 :FileType
         {:pattern "qf"
          :command "set nobuflisted"}
         :_general_settings)

(autocmd-v2 :FileType
         {:pattern "gitcommit"
          :command "setlocal wrap"}
         :_git)

(autocmd-v2 :FileType
         {:pattern "gitcommit"
          :command "setlocal spell"}
         :_git)

(autocmd-v2 :FileType
         {:pattern "markdown"
          :command "setlocal wrap"}
         :_markdown)

(autocmd-v2 :FileType
         {:pattern "markdown"
          :command "setlocal spell"}
         :_markdown)

(autocmd-v2 :FileType
         {:pattern "markdown"
          :command "setlocal spell"}
         :_markdown)

(autocmd-v2 :VimResized
         {:command "tabdo wincmd ="}
         :_auto_resize)
