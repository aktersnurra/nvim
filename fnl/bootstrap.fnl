;; Bootstraping for fresh install
(module bootstrap {autoload {util util}})

(defn- fmt [s ...] (string.format s ...))

(def- packer-path (.. (vim.fn.stdpath :data) :site/pack))

(def- git-clone-url "!git clone --depth 1 https://github.com/%s/%s %s")

(defn- execute [cmd] (vim.api.nvim_command cmd))

(defn- ensure-path [packer-path repository]
       (fmt "%s/packer/start/%s" packer-path repository))

(defn- install [user repository path]
       (execute (fmt git-clone-url user repository path))
       (execute (fmt "packadd %s" repository)))

(defn- ensure [user repository] (let [path (ensure-path packer-path repository)]
                                  (if (> (vim.fn.empty (vim.fn.glob path) 0))
                                      (install user repository path)
                                      true)))

(defn run [] (let [is_bootstrapped (ensure :wbthomason :packer.nvim)]
               (ensure :Olical :aniseed)
               (ensure :lewis6991 :impatient.nvim)
               is_bootstrapped))
