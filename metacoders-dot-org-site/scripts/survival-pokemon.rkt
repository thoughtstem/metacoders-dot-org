#lang at-exp racket

(require mc-scripts)
 
 ;--- Define pkg(s) test(s)
 (define survival-pokemon-test
   @~a{#lang survival-pokemon
       (define (my-stone)
         (basic-stone
           #:sprite leafstone-sprite
           #:name "Leaf Stone"
           #:value 100
           #:amount-in-world 20))
       (pokemon-game #:stone-list (list (my-stone)))})

 ;--- Check pkg(s)
 (check-pkg "survival-pokemon"
            "https://github.com/thoughtstem/TS-GE-Languages.git?path=survival-pokemon"
            survival-pokemon-test)