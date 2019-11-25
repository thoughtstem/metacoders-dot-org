#lang at-exp racket

(provide coders)
(require metacoders-dot-org-lib
         "./training.rkt")

(define (coders)
  (list
    (coders-top)
    (training)))

(define (volunteer-description)
  (volunteer-page
    #:position-title "Volunteer Coder"
    #:image-path volunteer-coder-img-path
    #:jumbotron-tagline "Design and build educational software that inspires the next generation of computer scientists!"
    #:locations-hiring (list "Anywhere!")
    #:volunteer-description 
    (div 
      (h6 "Job Description")
      (p "Create educational software that is useable by students around the world. Our programming languages are intended to make it fun for students of various skill levels to create video games, apps, and websites. Help us build the languages that inspire students to become life-long coders.")
      (p "If you are interested in volunteering to code with us, MetaCoders will provide you all the training and documentation you need to create fun educational software for K-12 students. Send us an email below to join our team!"))))

(define (bottom-section)          
  (container
    (card-deck
      (email-signup)
      (begin-training
        (p "Whether you're interested in becoming a Volunteer Coder, or if you just want to learn more, you can start your training to become a Volunteer Coder now!") 
        (training)))))

(define (coders-top)
  (page coders-top-path
        (normal-content-wide
          (volunteer-description)
          (bottom-section))))
