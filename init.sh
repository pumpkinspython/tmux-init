#! /bin/bash
deps=("tmux" "yq")
config_file=$(dirname $(readlink -f $0))/config.yaml

for dep in ${deps[@]}
do
    if ! command -v $dep >/dev/null 2>&1; then
        echo "Dependency: $dep not found"
        exit 1
    fi
done

if [ ! -f $config_file ]; then
    echo "Could not find config.yaml"
    exit 1
fi

# init
ses_count=$(yq ".sessions | length" $config_file)

for ((i = 0; i < ses_count; i++));
do
    ses_name=$(yq ".sessions.[$i].name" $config_file)
    tmux new-session -d -s $ses_name
    
    win_count=$(yq ".sessions.[$i].windows | length" $config_file)
    for ((y = 0; y < ses_count; y++));
    do
        win_name=$(yq ".sessions.[$i].windows.[$y].name" $config_file)
        win_command=$(yq ".sessions.[$i].windows.[$y].command" $config_file)
        tmux new-window -n $win_name -t $ses_name "$win_command"
    done
    tmux kill-window -t 0
done