#lang at-exp racket

(provide coaches)

(require metacoders-dot-org-lib
         "./training.rkt")

(define (coaches)
  (list (coaches-top)
        (training)))

(define (coaches-top)
  (page coaches-top-path
        (normal-content
          (h1 "Coaches")
          (row
            (col-6
              (email-signup))
            (col-6
              (begin-training 
                (training-top)))))))

