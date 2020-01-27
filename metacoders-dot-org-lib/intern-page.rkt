#lang at-exp racket 

(provide intern-page)

(require website/bootstrap
         "./html-helpers.rkt")

(define (intern-page
  #:position-title      [position-title "JOB TITLE"]
  #:image-path          [image-path ""]   
  #:alt-tag             [alt-tag ""]
  #:jumbotron-tagline   [tagline "TAGLINE"]
  #:percent-height      [percent-height "80%"]
  #:locations-hiring    [locations-hiring '("TBD" "TBD")]
  #:intern-description     [description '(h6 "Intern Position Description goes here")]
          )
  (div
    (mc-jumbotron-header
      #:title (string-append "Become a " position-title)
      #:tagline tagline
      #:percent-height percent-height
      #:image-path image-path
      #:alt-tag alt-tag)
    (br)
    (container
      (h1 position-title)
      (h3 "Intern with MetaCoders")
      (h6 style: (properties padding-top: 10)
          "Currently Seeking Interns In:")
      (ul
        (map li locations-hiring)) 
      description    
      )))
