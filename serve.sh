#!/bin/bash
( # Run in a subshell to not change path
# Get folder the script is in
cd $( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
# Wipe the build folder
rm -rf .build && mkdir .build
# This doesnt copy . files
cp -r * .build/
cp -r .packwizignore .build/
cd .build/
# The cost of organizing mods
find mods/ -type f -print0 | xargs -0 mv -t mods/
packwiz refresh --build
packwiz serve --basic
)