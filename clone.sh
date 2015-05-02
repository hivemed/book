#!/bin/sh

# clone and initialize submodule branch
git clone --recursive git@github.com:hivemed/book.git $1
cd $1

# see http://stackoverflow.com/a/18799234/446907
git submodule foreach -q --recursive 'branch="$(git config -f $toplevel/.gitmodules submodule.$name.branch)"; git checkout $branch'
