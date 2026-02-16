mock commandline \* ""
_fzf_search_variables 2>/dev/null
@test "fails if no arguments given" $status -ne 0
