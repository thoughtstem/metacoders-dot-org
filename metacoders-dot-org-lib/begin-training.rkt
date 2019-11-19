#lang racket 

(provide begin-training)

(require website/bootstrap)

(define (begin-training description target-page [classes ""])
  (card class: classes
    (card-body
      (card-title "Your quest begins here...")
      (card-text
        description
        (link-to target-page
                 (button class: "btn btn-primary" 
                         "Begin Training!"))))))


