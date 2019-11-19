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
    (p "We are currently seeking energetic, passionate individuals who will be \"Coding Coaches\" for computer science classes & camps in your area. Candidates do not necessarily need to be experienced in computer science, but should be excited to learn coding with us! Coding Coaches guide students as they learn computer science using MetaCoders’ innovative curriculum.")
    (h6 "Schedule")
    (ul
      (li "School Year: approximately 2-5 hours per week to start.")
      (li "Summer: 40 hours/week for 5 weeks.")))))


(define (start-now-section)
  (container
    (hr)
    (h3 "Or, if We're Not in Your Area Yet...")
    (p class: "mt-3"
       "If we're not in your area yet, there's no reason you can't use our tools to start teaching free classes in your own community! Alternatively, you can help us start official classes in your community and get paid as an official MetaCoders Coding Coach. Email us to learn more and start your training here:")
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
