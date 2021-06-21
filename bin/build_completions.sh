#!/usr/bin/env bash
func=~/.zsh/func
[ "$(which just 2> /dev/null)" ] && just --completions zsh > "${func}/_just"
[ "$(which kubectl 2> /dev/null)" ] && kubectl completion zsh > "${func}/_kubectl"
[ "$(which pip3 2> /dev/null)" ] && pip3 completion --zsh > "${func}/_pip3"
