set -l fish "$fish_config"

if test -z "$fish"
    set -l config_home $XDG_CONFIG_HOME

    if test -z "$config_home"
        set config_home ~/.config
    end

    set fish "$config_home/fish"
end

if test ! -d "$fish/paths.d"
    command mkdir -p "$fish/paths.d"
end

for file in "$fish/paths.d"/*
    if test -s "$file"
        set -l name (command basename "$file")
        read -laz values < "$file"

        if test "$name" = PATH
            for value in $values
                if test -e "$value"
                    set -gx PATH $PATH $value
                end
            end
        else
            set -gx "$name" $$name $values
        end
    end
end
