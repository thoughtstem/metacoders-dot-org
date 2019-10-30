#lang at-exp racket

(provide training
         training-top)

(require metacoders-dot-org-lib)

(define (training)
  (list 
    (training-top)))

(define (training-top)
  (page coaches/training.html
        (normal-content
          (h1 "Coach Training Starts Here")

          (h2 "Welcome to Metapolis")
          )))
