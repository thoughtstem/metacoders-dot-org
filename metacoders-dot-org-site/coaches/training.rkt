#lang at-exp racket

(provide training)

(require metacoders-dot-org-lib)

(define (training)
  (page coaches/training.html
        (normal-content
          (h1 "Coach Training Starts Here")))) 
