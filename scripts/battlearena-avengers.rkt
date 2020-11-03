#lang at-exp racket

(require mc-scripts)
 
 ;--- Define pkg(s) test(s)
 (define battlearena-avengers-test
   @~a{#lang battlearena-avengers
       (avengers-game
         #:planet (basic-planet #:image LAVA-BG))})

 ;--- Check pkg(s)
 (check-pkg "battlearena-avengers"
            "https://github.com/thoughtstem/TS-GE-Languages.git?path=battlearena-avengers"
            battlearena-avengers-test)
