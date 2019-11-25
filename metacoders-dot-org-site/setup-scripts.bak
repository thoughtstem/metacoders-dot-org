#lang at-exp racket

(provide setup-scripts)

(require website)

(define script
  @~a{
sudo add-apt-repository ppa:plt/racket -y
sudo apt-get update -y
sudo apt-get install racket -y
raco pkg install --deps search-auto --update-deps https://github.com/thoughtstem/kata-installer.git
  })

(define config.sh
  (page config.sh
    script))

(define config
  (page (list "config")
    script))

(define (setup-scripts)
  (list config.sh
        config))
