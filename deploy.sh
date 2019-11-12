#!/bin/bash

rm -rf out
mkdir out
touch out/site_prefix
git worktree prune
git worktree add out gh-pages
racket main.rkt
cd out/
git add --all
git commit -m "deploy"
git push -f origin gh-pages
