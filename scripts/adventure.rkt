#lang at-exp racket

(require mc-scripts)
 
 ;--- Define pkg(s) test(s)
 (define adventure-test
   @~a{#lang adventure

       (adventure-game
        #:avatar (basic-avatar
                   #:sprite pirategirl-sprite
                   #:speed 20) 
        #:intro-cutscene (basic-cutscene
                          (page
                            pirategirl-sprite
                            "This is the story of"
                            "Jordan the Pirate.")))})

 ;--- Check pkg(s)
 (check-pkg "adventure"
            "https://github.com/thoughtstem/TS-GE-Languages.git?path=adventure"
            adventure-test)
