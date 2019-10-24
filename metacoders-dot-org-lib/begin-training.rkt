#lang racket 

(provide begin-training)

(require website/bootstrap)

(define (begin-training target-page)
  (card
    (card-body
      (card-title "Your quest begins here...")
      (card-text
        (link-to target-page
                 "Begin Training!")))))


