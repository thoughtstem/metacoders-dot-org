#lang at-exp racket 

(provide volunteer-page)

(require website/bootstrap)

(define (volunteer-page
  #:position-title      [position-title "JOB TITLE"]
  #:image-path          [image-path ""]   
  #:jumbotron-tagline   [tagline "TAGLINE"]
  #:locations-hiring    [locations-hiring '("TBD" "TBD")]
  #:volunteer-description     [description '(h6 "Volunteer Position Description goes here")]
          )
  (div
    (jumbotron style: (properties
                        text-align: "center"
                        margin-bottom: 0
                        background-image: (string-append "url(" (prefix/pathify image-path) ")")
                        background-size: "cover"
                        background-position: "center"
                        height: "60%")
                class: "d-flex align-items-center"
      (container
        (div style: (properties
                        display: "inline-block"
                        padding: 15
                        color: "white"
                        background: "rgba(0, 0, 0, 0.5)")
            (h1 (string-append "Become a " position-title))
            (h6 tagline))))
    (br)
    (container
      (h1 position-title)
      (h3 "Volunteer for MetaCoders")
      (h6 "Locations Where We Currently Need Volunteers:")
      (ul
        (map li locations-hiring)) 
      description    
      )))
