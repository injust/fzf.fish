# helper function for _fzf_search_variables
function _fzf_extract_var_info --description="Extract and reformat lines pertaining to \$variable_name from \$set_show_output." --argument-names variable_name set_show_output
    # Extract only the lines about the variable, all of which begin with either
    # $variable_name: ...or... $variable_name[
    string match -r "^\\\$$variable_name(?::|\[).*" <$set_show_output |
        # Strip the variable name prefix, including ": " for scope info lines
        string replace -r "^\\\$$variable_name(?:: )?" '' |
        # Distill the lines of values, replacing...
        #   [1]: |value|
        # ...with...
        #   [1] value
        string replace -r ": \|(.*)\|" ' $1'
end
