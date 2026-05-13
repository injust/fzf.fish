function _fzf_search_git_log --description="Search the output of git log and preview commits. Replace the current token with the selected commit hash."
    if not git rev-parse --git-dir >/dev/null 2>&1
        __fish_echo echo '_fzf_search_git_log: Not in a git repository.' >&2
        return
    end

    if not set -q fzf_git_log_format
        # %h gives you the abbreviated commit hash, which is useful for saving screen space, but we might need to expand it later
        set -f fzf_git_log_format '%C(auto)%h %C(blue)%ad %C(auto)%d %s  %C(dim)[%an]%C(reset)'
    end

    set -f preview_cmd 'git show --color=always --stat --patch {1}'
    if set -q fzf_diff_highlighter
        set preview_cmd "$preview_cmd | $fzf_diff_highlighter"
    end

    set -f selected_log_lines (
        git log --no-show-signature --color=always --format=format:$fzf_git_log_format --date=short |
        _fzf_wrapper --ansi \
            --multi \
            --scheme=history \
            --prompt="[Git Log] ❯" \
            --preview=$preview_cmd \
            --query=(commandline --current-token) \
            $fzf_git_log_opts
    )
    if test $status -eq 0
        for line in $selected_log_lines
            set -f commit_hash (string split --fields=1 " " $line)
            # Expand abbreviated commit hash if `log.abbrevCommit` is false in Git config
            test (git config get --type=bool log.abbrevCommit) = true
            or set -f commit_hash (git rev-parse $commit_hash)
            set -fa commit_hashes $commit_hash
        end
        commandline --current-token --replace -- (string join ' ' $commit_hashes)
    end

    commandline --function repaint
end
