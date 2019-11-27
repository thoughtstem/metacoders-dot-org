#lang at-exp racket

(provide setup-scripts)

(require website
         racket/runtime-path
         "./scripts/initial-script.rkt")

(define-runtime-path scripts "./scripts")

(define (code-from-path n)
  (file->string (build-path scripts n)))

(define (setup-scripts)
  (list config.sh
       (page 3d-exploration.rkt
             (code-from-path "3d-exploration.rkt"))
       (page clicker-cartoon.rkt
             (code-from-path "clicker-cartoon.rkt"))))
