set -gx SHELL /bin/sh
# erase FZF_DEFAULT_OPTS so that one will be set by the wrapper function
set -e FZF_DEFAULT_OPTS
_fzf_wrapper unknownoption 2>/dev/null # pass unknown options so fzf immediately exits
@test "doesn't clobber SHELL" "$SHELL" = /bin/sh
@test "doesn't clobber FZF_DEFAULT_OPTS" (set -q FZF_DEFAULT_OPTS) $status -eq 1
