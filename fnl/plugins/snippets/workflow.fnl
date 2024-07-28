(λ workflow-snippets []
  (let [ls (require :luasnip)
        fmt (require :luasnip.extras.fmt)]
    (let [s ls.s
          i ls.insert_node
          fmt fmt.fmt]
      [(s :wf (fmt "workflow \"{}\" =
  input: {}
  output (on success):
    {}  
  output (on error):
    {}

  // step {}
  do {}
  {}
    " [(i 1) (i 2) (i 3) (i 4) (i 5) (i 6) (i 7)]))
       (s :st (fmt "
// step {}
do {}
If {}:
  {}

                                     "
                   [(i 1) (i 2) (i 3) (i 4)]))
       (s :ss (fmt "
substep \"{}\" =
  input: {}
  output: {}
  dependencies: {}

  {}
                                     "
                   [(i 1) (i 2) (i 3) (i 4) (i 5)]))])))

(λ add-snippets []
  (let [ls (require :luasnip)
        snippets (workflow-snippets)]
    (ls.add_snippets :org snippets)
    (ls.add_snippets :markdown snippets)))

{: add-snippets}
