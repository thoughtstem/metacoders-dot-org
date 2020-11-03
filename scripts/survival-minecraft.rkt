#lang at-exp racket

(require mc-scripts)
 
 ;--- Define pkg(s) test(s)
 (define survival-minecraft-test
   @~a{#lang survival-minecraft
       (define (my-mob)
         (basic-mob
           #:sprite skeleton-sprite
           #:amount-in-world 5))
       (minecraft-game #:mob-list (list (my-mob)))})

 ;--- Check pkg(s)
 (check-pkg "survival-minecraft"
            "https://github.com/thoughtstem/TS-GE-Languages.git?path=survival-minecraft"
            survival-minecraft-test)
