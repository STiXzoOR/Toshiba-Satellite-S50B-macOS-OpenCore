#!/usr/bin/env bash

repo_dir=$(dirname ${BASH_SOURCE[0]})
macos_tools=$repo_dir/macos-tools

if [[ ! -d $macos_tools ]]; then
    echo "Downloading latest macos-tools..."
    rm -Rf $macos_tools && git clone https://github.com/STiXzoOR/macos-tools $macos_tools --quiet
fi

source $macos_tools/_hack_cmds.sh

case "$1" in
    --auto-mode)
        $0 --mount-system
        $0 --download-requirements
        $0 --install-downloads
    ;;
esac
