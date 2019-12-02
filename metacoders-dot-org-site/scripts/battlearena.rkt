#lang at-exp racket

(require mc-scripts)
 
 ;--- Define pkg(s) test(s)
 (define battlearena-test
   @~a{#lang battlearena
       
       (define (my-weapon)
         (fire-magic
           #:name "Heavy Fire Magic"
           #:damage 20))
 
       (battlearena-game
         #:weapon-list (list (my-weapon)))})

 ;--- Check pkg(s)
 (check-pkg "battlearena"
            "https://github.com/thoughtstem/TS-GE-Languages.git?path=battlearena"
            battlearena-test)