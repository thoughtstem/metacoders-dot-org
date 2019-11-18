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
        (normal-content-wide
          (tech-coord-page)
          (container
            (row
              (col-6
                (email-signup))
              (col-6
                (begin-training (training))))))))

(define (tech-coord-page)
  (employment-page  #:position-title "Technology Coordinator"
                    #:image-path equipment-img-path
                    #:jumbotron-tagline "Help us connect coaches and students!"
                    #:locations-hiring (list "Dallas, Texas" "Houston, Texas")
                    #:job-description (list (p "Insert job description here."))))
