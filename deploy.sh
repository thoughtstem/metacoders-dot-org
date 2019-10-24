#!/bin/bash
racket main.rkt
git add out
git commit -m "deploy"
git subtree push --prefix out origin gh-pages
