#!/usr/bin/env sh

TARGET_DIR=~/.local/bin

mkdir --parents ~/.local/bin

ln -svrf light ${TARGET_DIR}/light
ln -svrf dark ${TARGET_DIR}/dark

ln -svrf wiki-sync ${TARGET_DIR}/wiki-sync
