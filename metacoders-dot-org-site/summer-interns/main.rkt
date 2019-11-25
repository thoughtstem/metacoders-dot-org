#lang at-exp racket

(provide summer-interns)
(require metacoders-dot-org-lib
         "./training.rkt")

(define (summer-interns)
  (list
    (summer-camp-interns-top)
    (training)))

(define (intern-description)
  (intern-page
    #:position-title "Summer Camp Team Leader"
    #:image-path summer-camp-intern-img-path
    #:jumbotron-tagline "Lead students in our summer camps in coding exercises and make sure they have a great first experience with coding!"
    #:locations-hiring (list "Dallas, Texas" "Minneapolis, Minnesota" "Temecula, CA" "Poway, CA" "Chula Vista, CA" "Reno, Nevada")
    #:intern-description 
    (div 
      (h6 "Job Description")
      (p "MetaCoders' internship program is designed for incoming high school seniors through college students interested in pursuing careers in education. This is an unpaid internship with a focus on developing skills as an educator and leader.")
      (p "")
      (button-primary class: "mb-4"
                      id: "main-button" 
                      "Apply Here"))))

(define (bottom-section)
  (container
    (card-deck
      (email-signup)
      (begin-training
        (p "Whether you're interested in becoming a Summer Camp Team Leader Intern, or if you just want to learn more, you can start your training to become a Summer Camp Team Leader now!") 
        (training)))))

(define (summer-camp-interns-top)
  (page summer-camp-intern-top-path
        (normal-content-wide
          (intern-description)
          (bottom-section))))
