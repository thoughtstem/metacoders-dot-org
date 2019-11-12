#!/bin/bash
racket main.rkt
git add out
git commit -m "deploy"
#git subtree push --prefix out origin gh-pages

#Above was failing when other people had deployed.  Trying a new strategy to force pushes to gh-pages
#  https://stackoverflow.com/questions/33172857/how-do-i-force-a-subtree-push-to-overwrite-remote-changes
git push origin `git subtree split --prefix out master`:gh-pages --force
