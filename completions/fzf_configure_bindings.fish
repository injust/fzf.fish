complete fzf_configure_bindings --no-files
complete fzf_configure_bindings --long-option=help --short-option=h --description="Print help" --condition="not __fish_seen_argument --help -h"
complete fzf_configure_bindings --long-option=directory --description="Change the key binding for Search Directory" --condition="not __fish_seen_argument --directory"
complete fzf_configure_bindings --long-option=git-log --description="Change the key binding for Search Git Log" --condition="not __fish_seen_argument --git-log"
complete fzf_configure_bindings --long-option=git-status --description="Change the key binding for Search Git Status" --condition="not __fish_seen_argument --git-status"
complete fzf_configure_bindings --long-option=history --description="Change the key binding for Search History" --condition="not __fish_seen_argument --history"
complete fzf_configure_bindings --long-option=processes --description="Change the key binding for Search Processes" --condition="not __fish_seen_argument --processes"
complete fzf_configure_bindings --long-option=variables --description="Change the key binding for Search Variables" --condition="not __fish_seen_argument --variables"
