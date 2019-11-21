#lang at-exp racket

(provide coders)
(require metacoders-dot-org-lib
         "./training.rkt")

(define (coders)
  (list
    (coders-top)
    (training)))

(define (coders-top)
  (page coders-top-path
        (normal-content
          (h1 "Coder")
          (card-deck
              (email-signup)
              (begin-training
                (p "I'm writing stuff here!") 
                (training))))))
