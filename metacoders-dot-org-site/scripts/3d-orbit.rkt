#lang at-exp racket

(require mc-scripts)
 
 ;--- Define pkg(s) test(s)
 (define 3d-orbit-test
   @~a{#lang 3d-orbit 
       (define the-ring
        (basic-ring
          #:tilt (tilt 90 0 0)
          #:texture saturnring-tex
          #:radius 2
          #:thickness 0.5)) 
       (define my-planets
         (list
           (basic-planet
             #:texture jupiter-tex
             #:label "Jupiter")
           (basic-planet
             #:texture saturn-tex
             #:label "Saturn"
             #:rings-list (list the-ring))))
       (orbit-scene
         #:star (basic-star
         #:texture sun-tex
         #:label "Sol"
         #:planets-list my-planets))})

 ;--- Check pkg(s)
 (check-pkg "3d-orbit"
            "https://github.com/thoughtstem/TS-VR-Languages.git?path=3d-orbit"
            3d-orbit-test)