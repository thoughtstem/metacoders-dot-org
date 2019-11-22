#lang at-exp racket

(provide training)

(require metacoders-dot-org-lib)

(define (training)
  (page summer-interns/training.html
        (normal-content
          (h1 "Summer Camp Team Leader Training Starts Here")))) 
