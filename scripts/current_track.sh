#!/usr/bin/env bash

command -v osascript >/dev/null 2>&1 && { osascript scripts/current_track.scpt }
