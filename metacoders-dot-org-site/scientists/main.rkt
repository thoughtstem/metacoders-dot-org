#lang at-exp racket 

(provide scientists)

(require metacoders-dot-org-lib
         "./training.rkt")

(define (scientists)
  (list
    (scientists-top)
    (training)))

(define (scientists-top)
  (page scientists-top-path
        (normal-content
          (h1 "Scientists")
          (card-deck
              (email-signup)
              (begin-training
                (p "I'm writing stuff here!") 
                (training))))))
