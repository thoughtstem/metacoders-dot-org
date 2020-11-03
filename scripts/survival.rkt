#lang at-exp racket

(require mc-scripts)
 
 ;--- Define pkg(s) test(s)
 (define survival-test
   @~a{#lang survival
       
       (define (my-enemy)
         (basic-enemy
           #:sprite bat-sprite
           #:amount-in-world 5))
 
       (survival-game
         #:enemy-list (list (my-enemy)))})

 ;--- Check pkg(s)
 (check-pkg "survival"
            "https://github.com/thoughtstem/TS-GE-Languages.git?path=survival"
            survival-test)
