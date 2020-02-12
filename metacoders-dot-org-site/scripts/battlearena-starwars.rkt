#lang at-exp racket

(require mc-scripts)
 
 ;--- Define pkg(s) test(s)
 (define battlearena-starwars-test
   @~a{#lang battlearena-starwars
       (starwars-game
         #:rebel (basic-rebel #:sprite yoda-sprite))})

 ;--- Check pkg(s)
 (check-pkg "battlearena-starwars"
            "https://github.com/thoughtstem/TS-GE-Languages.git?path=battlearena-starwars"
            battlearena-starwars-test)