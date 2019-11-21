#lang at-exp racket 

(provide employment-page)

(require website/bootstrap)

(define (employment-page
          #:position-title      [position-title "JOB TITLE"]
          #:image-path          [image-path ""]   
          #:jumbotron-tagline   [tagline "TAGLINE"]
          #:locations-hiring    [locations-hiring '("TBD" "TBD")]
          #:job-description     [description '(h6 "Job Description goes here")]
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
      (h3 "Apply to be a Part-time MetaCoders Employee")
      (h6 style: (properties padding-top: 10) 
          "Currently Hiring In:")
      (ul
        (map li locations-hiring)) 
      description    
      (p "Learn more about employment duties, requirements, or take the next step here:")
      (button-primary class: "mb-4"
                      id: "main-button" 
                      "Apply Here"))))
