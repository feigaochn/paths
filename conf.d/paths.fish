if test -z "$paths_config"
    set -l config_home "$XDG_CONFIG_HOME"

    if test -z "$config_home"
        set config_home ~/.config
    end

    set -gx paths_config "$config_home/fish/paths.d"

    if test ! -d "$paths_config"
        command mkdir -p "$config/paths.d"
    end
end

################### Remove after 2.3.0 is ubiquitous ###################
switch "$FISH_VERSION"
    case 2.2.0
        set -l real_home ~

        function -S _paths_replace_tilde
            printf "%s\n" $argv | sed "s,~,$real_home,g"
        end

        for file in "$paths_config"/*
            if test -d "$file"
                set -l name (command basename "$file")

                for file in "$file"/*
                    read -laz values < $file
                    set values (_paths_replace_tilde $values)
                    set -gx "$name" $$name $values
                end

            else if test -f "$file"
                set -l name (command basename "$file")
                read -laz values < $file
                set values (_paths_replace_tilde $values)
                set -gx "$name" $values
            end
        end

        exit
end
################### Remove after 2.3.0 is ubiquitous ###################

for file in "$paths_config"/*
    if test -d "$file"
        set -l name (string split -rm1 / "$file")[-1]

        for file in "$file"/*
            read -laz values < $file
            echo "set -gx $name \$$name $values"
        end

    else if test -f "$file"
        set -l name (string split -rm1 / "$file")[-1]
        read -laz values < $file
        echo "set -gx $name $values"
    end
end | source
