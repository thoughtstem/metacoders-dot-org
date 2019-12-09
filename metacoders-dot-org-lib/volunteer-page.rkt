#lang at-exp racket 

(provide volunteer-page)

(require website/bootstrap
         "./html-helpers.rkt")

(define (volunteer-page
  #:position-title        [position-title "JOB TITLE"]
  #:image-path            [image-path ""]   
  #:jumbotron-tagline     [tagline "TAGLINE"]
  #:percent-height        [percent-height "80%"]
  #:locations-hiring      [locations-hiring '("TBD" "TBD")]
  #:volunteer-description [description '(h6 "Volunteer Position Description goes here")]
  #:application-link      [application-link ""])
  (div
    (mc-jumbotron-header
      #:title (string-append "Become a " position-title)
      #:tagline tagline
      #:percent-height percent-height
      #:image-path image-path)
    (br)
    (container
      (h1 position-title)
      (h3 "Volunteer for MetaCoders")
      (h6 style: (properties padding-top: 10)
          "Currently Seeking Volunteers In:")
      (ul
        (map li locations-hiring)) 
      description    
      (a href: application-link target: "_blank" (button-primary class: "mb-4"
                      id: "main-button"
                      "Apply To Volunteer Here")))))
      
