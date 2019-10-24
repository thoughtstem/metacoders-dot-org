#lang at-exp racket

(provide training)

(require metacoders-dot-org-lib)

(define (training)
  (page tech-coords/training.html
        (normal-content
          (h1 "Tech Coordinator Training Starts Here")))) 
