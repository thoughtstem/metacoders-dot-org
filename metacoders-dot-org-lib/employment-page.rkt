#lang at-exp racket

(provide employment-page)

(require website/bootstrap
         "./html-helpers.rkt")

(define (employment-page
          #:position-title      [position-title "JOB TITLE"]
          #:image-path          [image-path ""]   
          #:jumbotron-tagline   [tagline "TAGLINE"]
          #:percent-height      [percent-height "80%"]
          #:locations-hiring    [locations-hiring '("TBD" "TBD")]
          #:job-description     [description '(h6 "Job Description goes here")]
          #:job-link            [job-link ""]
          )
  (div
    (mc-jumbotron-header
      #:title (string-append "Become a " position-title)
      #:tagline tagline
      #:percent-height percent-height
      #:image-path image-path)
    (br)
    (container
      (h1 position-title)
      (h3 "Apply to be a Part-time MetaCoders Employee")
      (h6 style: (properties padding-top: 10) 
          "Currently Hiring In:")
      (ul
        (map li locations-hiring)) 
      description    
      (p "Learn more about employment duties, requirements, or take the next step here:")
      (a href: job-link target: "_blank" (button-primary class: "mb-4"
                      id: "main-button"
                      "Apply Here")))))
