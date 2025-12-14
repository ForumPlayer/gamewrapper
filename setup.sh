#!/bin/sh
GW_PRESETS="$PWD/Presets"
git clone git@github.com:ForumPlayer/gamewrapper-presets.git "${GW_PRESETS}" || \
git clone "https://github.com/ForumPlayer/gamewrapper-presets.git" "${GW_PRESETS}" || exec false