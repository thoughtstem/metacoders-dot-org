#lang at-exp racket

(provide setup-scripts)

(require website
         "./scripts/initial-script.rkt"
         "./scripts/clicker-cartoon.rkt"
         "./scripts/3d-exploration.rkt")


(define (setup-scripts)
  (list config.sh
        clicker-cartoon.rkt
        3d-exploration.rkt))
