#lang at-exp racket 

(provide scientists)

(require metacoders-dot-org-lib
         "./training.rkt")

(define (scientists)
  (list
    (scientists-top)
    (training)))

(define (volunteer-description)
  (volunteer-page
    #:position-title "Learning Scientist"
    #:image-path volunteer-scientist-img-path
    #:jumbotron-tagline "Study and monitor MetaCoders classes in your local area to make sure kids have the best classroom experiences."
    #:locations-hiring (list "Dallas, Texas" "Reno, Nevada")
    #:volunteer-description 
    (div 
      (h6 "Job Description")
      (p "Write description of this position here"))))

(define (bottom-section)
  (container
    (card-deck
      (email-signup)
      (begin-training
        (p "I'm writing stuff here!") 
        (training)))))

(define (scientists-top)
  (page scientists-top-path
        (normal-content-wide
          (volunteer-description)
          (bottom-section))))
