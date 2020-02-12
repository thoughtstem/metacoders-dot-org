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
        ;ME Langs
        (page cutscene.rkt
              (code-from-path "cutscene.rkt"))
        ;GE Langs
        (page survival.rkt
              (code-from-path "survival.rkt"))
        (page survival-minecraft.rkt
              (code-from-path "survival-minecraft.rkt"))
        (page survival-pokemon.rkt
              (code-from-path "survival-pokemon.rkt"))
        (page battlearena.rkt
              (code-from-path "battlearena.rkt"))
        (page battlearena-avengers.rkt
              (code-from-path "battlearena-avengers.rkt"))
        (page battlearena-fortnite.rkt
              (code-from-path "battlearena-fortnite.rkt"))
        (page battlearena-starwars.rkt
              (code-from-path "battlearena-starwars.rkt"))
        (page adventure.rkt
              (code-from-path "adventure.rkt"))
        (page adventure-harrypotter.rkt
              (code-from-path "adventure-harrypotter.rkt"))
        (page adventure-mario.rkt
              (code-from-path "adventure-mario.rkt"))
        ;VR Langs
        (page 3d-exploration.rkt
              (code-from-path "3d-exploration.rkt"))
        (page 3d-orbit.rkt
              (code-from-path "3d-orbit.rkt"))
        ;MISC Langs
        (page data-sci.rkt
              (code-from-path "data-sci.rkt"))
        ;K2 Langs
        (page clicker-pokemon.rkt
              (code-from-path "clicker-pokemon.rkt"))
        (page clicker-cartoon.rkt
              (code-from-path "clicker-cartoon.rkt"))
        (page healer-animal.rkt
              (code-from-path "healer-animal.rkt"))
        (page healer-zoo.rkt
              (code-from-path "healer-zoo.rkt"))
        ;Helper Packages
        (page fandom-sprites-ge.rkt
              (code-from-path "fandom-sprites-ge.rkt"))))
