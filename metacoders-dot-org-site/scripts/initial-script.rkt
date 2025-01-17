#lang at-exp racket

(provide config.sh)

(require website)

(define initial-script
  @~a{
 sudo add-apt-repository ppa:plt/racket -y
 sudo apt-get update -y
 sudo apt-get install racket -y
 raco pkg install --deps search-auto --update-deps https://github.com/thoughtstem/mc-scripts.git
 racket -l mc-scripts/change-bg
 racket -l mc-scripts/racket-prefs
 })

(define config.sh
  (page config.sh
        initial-script))
