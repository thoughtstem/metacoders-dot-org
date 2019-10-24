#lang at-exp racket

(provide training)

(require metacoders-dot-org-lib)

(define (training)
  (page scientists/training.html
        (normal-content
          (h1 "Scientist Training Starts Here")))) 
