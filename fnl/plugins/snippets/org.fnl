;; Snippets for org files.

(fn add-snippets []
  (let [ls (require :luasnip)
        fmt (require :luasnip.extras.fmt)]
    (let [s ls.s
          i ls.insert_node
          fmt fmt.fmt]
      (ls.add_snippets :org
                       [(s :be
                           (fmt "#+begin_src {}\n{}\n#+end_src" [(i 1) (i 2)]))
                        (s :wf
                           (fmt "workflow \"{}\" =
  input: {}
  output (on success):
    {}  
  output (on error):
    {}

  // step {}
  do {}
  {}
    "
                                [(i 1) (i 2) (i 3) (i 4) (i 5) (i 6) (i 7)]))
                        (s :st
                           (fmt "
  // step {}
  do {}
  If {}:
    {}

                                     "
                                [(i 1) (i 2) (i 3) (i 4)]))
                        (s :ss
                           (fmt "
substep \"{}\" =
  input: {}
  output: {}
  dependencies: {}

  {}
                                     "
                                [(i 1) (i 2) (i 3) (i 4) (i 5)]))]))))

{: add-snippets}
