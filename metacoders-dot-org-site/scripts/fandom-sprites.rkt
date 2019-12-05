#lang at-exp racket

(require mc-scripts)
 
 ;--- Define pkg(s) test(s)
 (define fandom-sprites-test
   @~a{#lang battlearena
       (require fandom-sprites)
       (battlearena-game
         #:avatar (basic-avatar
                    #:sprite pikachu-sprite)
         #:enemy-list (list (basic-enemy
                              #:sprite harrypotter-sprite)
                            (basic-enemy
                              #:sprite creeper-sprite)
                            (basic-enemy
                              #:sprite hulk-sprite)
                            (basic-enemy
                              #:sprite yoda-sprite)
                            (basic-enemy
                              #:sprite luigi-sprite)))
})

 ;--- Check pkg(s)
 (check-pkg "fandom-sprites"
            "https://github.com/thoughtstem/fandom-sprites.git"
            fandom-sprites-test)