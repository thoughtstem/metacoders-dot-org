#lang at-exp racket

(require mc-scripts)
 
 ;--- Define pkg(s) test(s)
 (define cutscene-test
   @~a{#lang cutscene
       (story-cutscene
         (page
           harrypotter-sprite
           "Harry walks slow in the snow."
           #:bg snow-bg
           #:mode 90
           #:scroll-speed 30))})

 ;--- Check pkg(s)
 (check-pkg "cutscene"
            "https://github.com/thoughtstem/TS-ME-Languages.git?path=cutscene"
            cutscene-test)
