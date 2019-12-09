#lang racket 

(provide begin-training)

(require website/bootstrap)

(define (begin-training #:training-exists? [training-exists? #t] 
                        description target-page [classes ""])
  (card class: classes
    (card-body
      (card-title "You Can Start Training Now!")
      (card-text
        description
        (if (false? training-exists?)
          (h6 style: (properties color: "red"
                                 text-align: "center") 
              "This Training is Coming Soon!")
          (link-to target-page
            (button class: "btn btn-primary" 
                   "Begin Training!")))))))


