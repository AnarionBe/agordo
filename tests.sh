#!/bin/sh

while IFS= read -r line
do
    codium --install-extension $line
done < "$HOME/agordo/codiumExtensions.list"