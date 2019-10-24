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
          (row
            (col-6
              (email-signup))
            (col-6
              (begin-training (training)))))))
