#lang at-exp racket

(require mc-scripts)
 
 ;--- Define pkg(s) test(s)
 (define data-sci-test
   @~a{#lang data-sci

      (define the-data (data-set large-cities))
 
      (define cities-only (map first the-data))
 
      (define population-only (map third the-data))
 
      (define cities-with-population
        (zip cities-only population-only))
 
      (plot-pict
        (discrete-histogram
          cities-with-population
          #:invert? #t)
          #:height 700
          #:width 700)})

 ;--- Check pkg(s)
 (check-pkg "data-sci"
            "https://github.com/thoughtstem/TS-MISC-Languages.git?path=data-sci"
            data-sci-test)
