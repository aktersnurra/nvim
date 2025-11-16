;; Unison lang support

(λ config [plugin]
  (vim.opt.rtp:append (.. plugin.dir :/editor-support/vim))
  ((. (require :lazy.core.loader) :packadd) (.. plugin.dir :/editor-support/vim)))

(λ init [plugin]
  ((. (require :lazy.core.loader) :ftdetect) (.. plugin.dir
                                                 :/editor-support/vim)))

{1 :unisonweb/unison :branch :trunk : config : init}
