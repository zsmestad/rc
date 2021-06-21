#!/usr/bin/env bash
func=~/.zsh/func
[ "$(which just 2> /dev/null)" ] && just --completions zsh > "${func}/_just"
[ "$(which kubectl 2> /dev/null)" ] && kubectl completion zsh > "${func}/_kubectl"
[ "$(which pip 2> /dev/null)" ] && pip completion --zsh > "${func}/_pip"
