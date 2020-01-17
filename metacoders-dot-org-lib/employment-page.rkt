#lang at-exp racket

(provide employment-page
)

(require website/bootstrap
         "./html-helpers.rkt")

(define (employment-page
          #:position-title      [position-title "JOB TITLE"]
          #:image-path          [image-path ""]   
          #:jumbotron-tagline   [tagline "TAGLINE"]
          #:percent-height      [percent-height "80%"]
          #:locations-hiring    [locations-hiring '("TBD" "TBD")]
          #:short-job-description     [description '(h6 "Job Description goes here")]
          #:job-link            [job-link ""]
          #:long-job-description      [long-description '(h6 "A long job description goes here...")]
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
      (p "Want to learn more? Read the full job description here:")
      (a href: "#" `data-toggle: "modal" `data-target: "#Modal-Job"
        (button-primary class: "mb-4"
                        id: "main-button"
                        "Full Job Description"))
      (p "Ready to apply? Take the next steps here:")
      (a href: job-link target: "_blank" 
        (button-primary class: "mb-4"
                        id: "main-button"
                        "Apply Here"))
      (modal id: "Modal-Job" `tabindex: "-1" `role: "dialog" `aria-labelledby: "exampleModalLabel" `aria-hidden: "true"
       (modal-dialog class: "modal-dialog-centered text-left"
        (modal-content
         (modal-header class: "bg-primary"
          (button type: "button" class: "close p-2" `data-dismiss: "modal" `aria-label: "Close"
           (span class: "text-white" `aria-hidden: "true" 
            "×")))
         (modal-body
          long-description)
         (modal-footer class: "p-2"
          (button type: "button" class: "btn btn-secondary" `data-dismiss: "modal"
           "Close")
         ))))
)))
