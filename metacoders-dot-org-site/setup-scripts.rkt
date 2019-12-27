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
        ;GE Langs
        (page survival.rkt
              (code-from-path "survival.rkt"))
        (page battlearena.rkt
              (code-from-path "battlearena.rkt"))
        (page adventure.rkt
              (code-from-path "adventure.rkt"))
        ;VR Langs
        (page 3d-exploration.rkt
              (code-from-path "3d-exploration.rkt"))
        ;MIS Langs
        (page data-sci.rkt
              (code-from-path "data-sci.rkt"))
        ;K2 Langs
        (page clicker-cartoon.rkt
              (code-from-path "clicker-cartoon.rkt"))
        (page healer-animal.rkt
              (code-from-path "healer-animal.rkt"))
        (page healer-zoo.rkt
              (code-from-path "healer-zoo.rkt"))
        ;Helper Packages
        (page fandom-sprites-ge.rkt
              (code-from-path "fandom-sprites-ge.rkt"))))
