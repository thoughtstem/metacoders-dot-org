#lang at-exp racket

(require mc-scripts)
 
 ;--- Define pkg(s) test(s)
 (define adventure-mario-test
   @~a{#lang adventure-mario
       (define (my-character)
         (basic-character
           #:sprite luigi-sprite
           #:speed 20
           #:health 200
           #:max-health 200))
       (mario-game #:character (my-character))})

 ;--- Check pkg(s)
 (check-pkg "adventure-mario"
            "https://github.com/thoughtstem/TS-GE-Languages.git?path=adventure-mario"
            adventure-mario-test)
