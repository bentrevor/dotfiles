#!/usr/bin/env bash

dotfiles=(
    'bundlerrc'
    'gemrc'
    'gitconfig'
    'gitignore_global'
    'pryrc'
    'ruby-version'
)

timestamp=$(date +"%Y%m%d%H%M%S")
bundler_jobs=1
bundler_jobs_set=false
bundler_path="$HOME/.bundle"
verbose_output=false
username=$(whoami)

function parse_args() {
    for opt in "$@"
    do
        case "$opt" in
            -bj=* | --bundler-jobs=*)
                bundler_jobs="${opt#*=}"
                bundler_jobs_set=true
                ;;

            -v | --verbose)
                verbose_output=true
                ;;

            -u=* | --username=*)
                username="${opt#*=}"
                ;;

            *)
                echo "unknown argument: $opt\n"
                echo "usage:\n\t-bj=N / --bundler-jobs=N\tparallelize bundler, defaults to 1\n\t-v / --verbose\t\t\tdebugging output"
                exit 1
                ;;
        esac
    done
}

function set_bundler_jobs() {
    sed -i "" -e "s/BUNDLE_JOBS: .[0-9]./BUNDLE_JOBS: '${bundler_jobs}'/g" bundlerrc

    if verbose; then
        if [[ "$bundler_jobs_set" = true ]]; then
            echo "set bundler jobs to $bundler_jobs\n"
        fi

        echo "selected dotfiles:"

        for df in "${dotfiles[@]}"
        do
            echo "\t$df"
        done
        echo ""
    fi
}

function link_dotfiles() {
    for dotfile in "${dotfiles[@]}"
    do
        target_path="$HOME/dotfiles/$dotfile"
        link_path=$(path_for $dotfile)

        make_backup $link_path
        ln -s $target_path $link_path
        chown -R $username:$username $link_path

        if verbose; then
            green_link=$(change_color $green $link_path)
            green_target=$(change_color $green $target_path)
            echo "linked $(change_color $green $link_path) to $(change_color $green $target_path)\n"
        fi
    done
}

red=1
green=2
yellow=3
blue=4
magenta=5
cyan=6
white=7
black=8

function change_color() {
    echo "$(tput setaf $1)$2$(tput sgr0)"
}

function verbose() {
    [[ "$verbose_output" = true ]]
}

function backup_for() {
    echo "$1_backup_$timestamp"
}

function path_for() {
    if [[ $1 == 'bundlerrc' ]]; then
        echo "$bundler_path/config"
    else
        echo "$HOME/.$1"
    fi
}

function make_backup() {
    dotfile=$1
    backup_file=$(backup_for $dotfile)

    if [[ $dotfile == "$bundler_path/config" ]] && [[ ! -e "$bundler_path" ]]; then
        mkdir $bundler_path
        chown -R $username:$username $bundler_path
    fi

    if [[ -e $dotfile ]]; then
        # mv wasn't working for ~/.bundle/config for some reason
        cat $dotfile > $backup_file
        rm $dotfile
        chown -R $username:$username $backup_file

        if verbose; then
            echo "created backup file $(change_color $green $backup_file)"
        fi
    fi
}

function main() {
    parse_args $@
    set_bundler_jobs
    link_dotfiles
}

main $@
