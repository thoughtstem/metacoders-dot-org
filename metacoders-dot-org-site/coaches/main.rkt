#lang at-exp racket

(provide coaches)

(require metacoders-dot-org-lib
         "./training.rkt")

(define (coaches)
  (list (coaches-top)
        (training)))

(define (employment-section)
  (employment-page #:position-title "Coding Coach"
                   #:image-path coding-coach-img-path
                   #:jumbotron-tagline "Work at home and prepare supplies for local classes!"
                   #:locations-hiring (list "Dallas, Texas" "Minneapolis, Minnesota" "Raleigh, North Carolina" "Reno, Nevada")
                   #:job-description 
  (div
    (h6 "Description")
    (p "We are currently seeking energetic, passionate individuals who will be \"Coding Coaches\" for computer science classes & camps in your area. Candidates do not necessarily need to be experienced in computer science, but should be excited to learn coding with us! Coding Coaches guide students as they learn computer science using MetaCoders’ innovative curriculum. Applicants are strongly encouraged to check out the online training below to see if this position is a good fit for them.")
    (h6 "Schedule")
    (ul
      (li "School Year: approximately 2-5 hours per week to start.")
      (li "Summer: 40 hours/week for 5 weeks.")))))


(define (start-now-section)
  (container
    (hr)
    (h3 "Not Hiring in Your City?")
    (p class: "mt-3"
       "All of MetaCoders training and curriculum are open source, meaning you can access them and start teaching in your community for free today! We also love to hear from people who want us to come to their community, so reach out to us using the form below and help us bring innovative, science-based coding education to your city!")
    (card-deck
        (email-signup)
        (begin-training
          (p "Whether you're interested in being hired as a Coding Coach, or you're interested in starting free classes in your area, you can start your training to become a coach now!") 
          (training-top)))))


(define (coaches-top)
  (page coaches-top-path
        (normal-content-wide
          (employment-section)
          (start-now-section))))
