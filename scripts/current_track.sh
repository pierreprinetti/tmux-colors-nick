#!/usr/bin/env bash

command -v osascript >/dev/null 2>&1 && echo -n $(osascript ${TMUX_PLUGIN_MANAGER_PATH}tmux-colors-nick/scripts/current_track.scpt)
