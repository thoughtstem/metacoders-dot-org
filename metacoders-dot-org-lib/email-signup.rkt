#lang racket 

(provide email-signup)

(require website/bootstrap)

(define (email-signup)
  (card
    (card-body
      (card-title "Apply Now!")
      (card-text
        (a href: ""
           "Go")))))


