#lang at-exp racket

(provide 3d-exploration.rkt)

(require website)

(define 3d-exploration-script
  @~a{
 #lang racket

 (require mc-scripts)
 
 ;--- Define pkg(s) test(s)
 (define 3d-exploration-test
   (~a "#lang 3d-exploration "
       "(define (earth) "
         "(basic-sphere "
           "#:position (position 25 0 0) "
           "#:texture earth-bg)) " 
       "(define (sun) "
         "(basic-sphere "
           "#:texture sun-bg "
           "#:radius 5 "
           "#:animations-list (do-many (animate-rotation)) "
           "#:components-list (list (earth)))) "
       "(exploration-scene #:sky-objects (list (sun)))"))

 ;--- Check pkg(s)
 (check-pkg "3d-exploration"
            "https://github.com/thoughtstem/TS-VR-Languages.git?path=3d-exploration");

 ;--- Setting up pkg(s)
 (msg-alert "Running raco setup on 3d-exploration")
 (system "raco setup 3d-exploration")

 ;--- Adding file(s) to test folder
 (msg-alert "Adding test files")
 (add-test 3d-exploration-test
           "3d-exploration-test")
      })

(define 3d-exploration.rkt
  (page 3d-exploration.rkt
        3d-exploration-script))
