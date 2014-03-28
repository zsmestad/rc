#!/bin/sh
if [ ! "$1" ]; then
  echo "Creates a link to <filepath> named .<filename> in the current working directory"
  echo "Usage: $0 <filepath>"
  exit 1
fi

srcpath="$1"
srcname="$(basename ${srcpath})"
dstname=".${srcname}"

if [ -e "${dstname}" ]; then
  echo "${dstname} exists already"
  exit 2
fi

ln -s "${srcpath}" "${dstname}"
