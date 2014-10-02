#!/usr/bin/env sh

cd $1
git add -A
git commit -m "$(date)"
cd -
