#!/usr/bin/env sh

ln -svrf gitignore_global ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global
 
