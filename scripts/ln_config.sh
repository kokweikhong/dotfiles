#!/bin/bash

# set default max number of config
max_config=3

# set default location for config
neovim_dst=~/.config/nvim
vscode_dst=~/.config/Code/User
tmux_dst=~/.config/tmux

# script for ln several config files to desired location
echo "This script will ln several config files to desired location"
echo "---------------------------"

# ask for selection for config
# neovim, vscode, tmux, zsh, git, ssh, firewall, swapfile in number selection
echo "Select config to ln"
echo "1. neovim"
echo "2. vscode"
echo "3. tmux"

# user input
read -p "Enter your selection: " selection

# check user input wheter within range or not
if [[ $selection -lt 1 || $selection -gt $max_config ]]; then
    echo "Invalid input"
    exit
fi

# loop and set dst for config
for (( i=1; i<=$max_config; i++ )); do
    if [[ $selection -eq $i ]]; then
        case $i in
            1)
                dst=$neovim_dst
                ;;
            2)
                dst=$vscode_dst
                ;;
            3)
                dst=$tmux_dst
                ;;
        esac
    fi
done

# ask for selection's location to ln, if not then use default location
read -p "Enter location to ln $selection (default: $dst): " location

# if location is not null, then use location as dst
if [[ ! -z $location ]]; then
    dst=$location
fi

# check whether dst is exist or not
if [[ ! -d $dst ]]; then
    echo "Directory $dst does not exist"
    # ask whether want to create dst or not
    read -p "Do you want to create $dst? (y/n) " answer
    # if yes, then create dst with sudo
    if [[ $answer == y || $answer == Y ]]; then
        sudo mkdir -p $dst
    else
        exit
    fi
fi

# ln config
case $selection in
    1)
        # neovim
        echo "ln neovim config"
        echo "---------------------------"
        sudo ln -sf $(pwd)/nvim $dst
        ;;
    2)
        # vscode
        echo "ln vscode config"
        echo "---------------------------"
        sudo ln -sf $(pwd)/vscode/settings.json $dst/settings.json
        sudo ln -sf $(pwd)/vscode/keybindings.json $dst/keybindings.json
        ;;
    3)
        # tmux
        echo "ln tmux config"
        echo "---------------------------"
        sudo ln -sf $(pwd)/tmux/tmux.conf $dst/tmux.conf
        ;;
esac

echo "Done"




