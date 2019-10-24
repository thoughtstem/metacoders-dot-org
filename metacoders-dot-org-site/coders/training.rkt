#lang at-exp racket

(provide training)

(require metacoders-dot-org-lib)

(define (training)
  (page coders/training.html
        (normal-content
          (h1 "Coder Training Starts Here")))) 
