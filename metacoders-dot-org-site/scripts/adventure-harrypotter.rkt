#lang at-exp racket

(require mc-scripts)
 
 ;--- Define pkg(s) test(s)
 (define adventure-harrypotter-test
   @~a{#lang adventure-harrypotter
       (harrypotter-game
         #:potion-list (list
                         (basic-potion
                           #:name "Heal Potion"
                           #:amount-in-world 10
                           #:heals-by 20)))})

 ;--- Check pkg(s)
 (check-pkg "adventure-harrypotter"
            "https://github.com/thoughtstem/TS-GE-Languages.git?path=adventure-harrypotter"
            adventure-harrypotter-test)