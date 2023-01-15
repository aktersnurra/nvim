;; Autopairs for brackets and quote symbols.

{1 :windwp/nvim-autopairs
 :event :InsertEnter
 :opts {:check_ts true
        :ts_config {:lua [:string :source]
                    :javascript [:string :template_string]
                    :java false}
        :disable_filetype [:TelescopePrompt :spectre_panel]
        :fast_warp {:map :<M-e>
                    :chars ["{" "[" "(" "\"" "'"]
                    :pattern (string.gsub "[%'%\"%)%>%]%)%}%,]" "%s+" "")
                    :check_comma true
                    :highlight :PmenuSel
                    :highlight_grey :LineNr
                    :offset 0
                    :end_key "$"
                    :keys :qwertyuiopzxcvbnmasdfghjkl
                    :highlight :PmenuSel
                    :highlight_grey :LineNr}}}
