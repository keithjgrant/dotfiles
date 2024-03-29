if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_prompt --description 'Write out the prompt'
    set -l last_pipestatus $pipestatus
    set -q fish_color_status
    or set -g fish_color_status red

    set -l suffix ':$'
    if functions -q fish_is_root_user; and fish_is_root_user
        set suffix '#'
    end

    # Write pipestatus
    # If the status was carried over (if no command is issued or if `set` leaves the status untouched), don't bold it.
    set -l bold_flag --bold
    set -q __fish_prompt_status_generation; or set -g __fish_prompt_status_generation $status_generation
    if test $__fish_prompt_status_generation = $status_generation
        set bold_flag
    end
    set __fish_prompt_status_generation $status_generation
    set -l status_color (set_color $fish_color_status)
    set -l statusb_color (set_color $bold_flag $fish_color_status)
    set -l prompt_status (__fish_print_pipestatus "[" "]" "|" "$status_color" "$statusb_color" $last_pipestatus)

    echo -n -s (set_color green) (fish_vcs_prompt %s) ' ' (set_color blue) (prompt_pwd -D 5) " "$prompt_status $suffix " "
end
