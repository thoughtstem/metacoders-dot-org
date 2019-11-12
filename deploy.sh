#!/bin/bash

rm -rf out
git worktree add out gh-pages
racket main.rkt
cd out/
git add --all
git commit -m "deploy"
git push origin gh-pages
