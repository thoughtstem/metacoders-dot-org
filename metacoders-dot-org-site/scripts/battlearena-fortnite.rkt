#lang at-exp racket

(require mc-scripts)
 
 ;--- Define pkg(s) test(s)
 (define battlearena-fortnite-test
   @~a{#lang battlearena-fortnite
       (define (my-enemy)
         (basic-enemy
           #:sprite darkknight-sprite
           #:amount-in-world 5))
       (fortnite-game #:enemy-list (list (my-enemy)))})

 ;--- Check pkg(s)
 (check-pkg "battlearena-fortnite"
            "https://github.com/thoughtstem/TS-GE-Languages.git?path=battlearena-fortnite"
            battlearena-fortnite-test)