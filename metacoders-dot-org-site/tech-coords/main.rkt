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
          (bottom-section))))

(define (bottom-section)
  (container
    (hr)
    (br)
    (card-deck
      (begin-training
        (p "Whether you're interested in becoming a Technology Coordinator and would like to learn more, or you've already been hired as a Technology Coordinator, you can start your training now!") 
        (training)
        "col-9 mx-auto"))))

(define (tech-coord-page)
  (employment-page  #:position-title "Technology Coordinator"
                    #:image-path equipment-img-path
                    #:jumbotron-tagline "Help us connect coaches and students!"
                    #:locations-hiring (list "Dallas, Texas" "Minneapolis, Minnesota" "Raleigh, North Carolina" "Reno, Nevada")
                    #:job-description 
    (div
      (h6 "Description")
      (p "MetaCoders is currently seeking upbeat, motivated individuals who want to make a positive difference in their local community as Technology Coordinators. For this position, MetaCoders is specifically seeking individuals who are stay-at-home parents, stay-at-home caretakers, or who have the leisure to work part-time out of their home offices.")
      (p "Technology Coordinators play a critical role in MetaCoders mission to deliver coding education to local kids. Technology Coordinators prepare computers, hardware, and other classroom materials for coding classes in their surrounding areas. A Technology Coordinator's home serves as a hub for Coding Coaches (our instructors) to pick-up and drop-off equipment before and after class, respectively. With the help of MetaCoders' staff, Technology Coordinators fix any hardware that is broken and charge equipment between classes. Most importantly, Technology Coordinators help further the MetaCoders mission by approaching and setting up new locations for coding classes, thereby helping make computer science education more accessible in their area.")
      (h6 "Schedule")
      (ul
        (li "School Year: approximately 1.5-4 hours per week to start.")
        (li "Summer: approximately 4 hours/week for 5 weeks.")))))
