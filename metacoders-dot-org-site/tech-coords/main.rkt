#lang at-exp racket 

(provide tech-coords)

(require metacoders-dot-org-lib
         "./training.rkt")

(define (tech-coords)
  (list
    (tech-coords-top) 
    (training)))

(define (tech-coords-top)
  (page tech-coords-top-path
        (normal-content
          (h1 "Technology Coordinators")
          (row
            (col-6
              (email-signup))
            (col-6
              (begin-training (training)))))))
