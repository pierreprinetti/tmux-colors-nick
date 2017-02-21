#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

theme=nick

tmux source-file "$CURRENT_DIR/tmuxcolors-${theme}.conf"
