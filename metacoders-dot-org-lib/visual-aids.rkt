#lang at-exp racket

(provide kid-circle
         coach-circle
         tech-coordinator-circle
         location-circle
         scientist-circle
         coder-circle)

(require 
  website/bootstrap
  (only-in 2htdp/image circle))

(define (kid-circle)
  (write-img 
    class: "mr-2 pb-1"
    (circle 4 'solid 'red)))

(define (coach-circle)
  (write-img 
    class: "mr-2 pb-1"
    (circle 4 'solid 'orange)))

(define (tech-coordinator-circle)
  (write-img 
    class: "mr-2 pb-1"
    (circle 4 'solid 'yellow)))

(define (location-circle)
  (write-img 
    class: "mr-2 pb-1"
    (circle 4 'solid 'green)))

(define (scientist-circle)
  (write-img 
    class: "mr-2 pb-1"
    (circle 4 'solid 'blue)))

(define (coder-circle)
  (write-img 
    class: "mr-2 pb-1"
    (circle 4 'solid 'purple)))
