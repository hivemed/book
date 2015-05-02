#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Build the html version
make html

# Go To build/html folder
cd build/html/
# Add changes to git.
git add -A

# Commit changes.
msg="rebuilding html `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin gh-pages

# Come Back
cd -
