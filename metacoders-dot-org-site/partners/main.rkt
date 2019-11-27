#lang at-exp racket

(provide partners)
(require metacoders-dot-org-lib)

(define (jumbotron-header-section)
  (jumbotron  style: (properties
                      background-image: (string-append "url(" (prefix/pathify partners-img-path) ")")
                      text-align: "center"
                      background-position: "center"
                      background-size: "cover"
                      height: "60%")
              class: "d-flex align-items-center"
              (container
                (div style: (properties
                                    display: "inline-block"
                                    padding: 15
                                    color: "white"
                                    background: "rgba(0, 0, 0, 0.5)")
              (h1 "Become Our Partner")
              (h6 "Make a difference by bringing MetaCoders to your community!")))))

(define (what-we-do-section)
  (jumbotron  class: "mb-0"
              style: (properties background: "white")
    (container
      (h2 class: "text-center" "Help Us Teach Coding to Kids at Your Location")
      (br)
      (p "We are on a mission to teach as many students how to code as possible. If you have a space and you'd like to help us in our mission, we hope you'll reach out today!")
      (p "MetaCoders teaches weekly coding classes during the school year after-school, on weekday afternoons, and on weekends.  We run single day camps during school breaks like Winter Break and Spring Break.  During the summers, we run week-long, half-day and full-day camps. We could offer any or all of these kinds of programs at your location.")
      )
  )
)

(define (email-section)
  (jumbotron class: "mb-0"
             (container
              (h2 style: (properties text-align: "center") 
                  "Reach Out to Get Started")
              (br)
              (p "If you administer a location at which you would like us to consider teaching coding classes or camps, please reach out to us below! You can start by letting us know a little bit about your location and what days of the week and times your location would be available:")
              (div  class: "col-9 mx-auto"
                (email-signup)))))

(define (partners)
  (page partners-top-path
        (normal-content-wide
          (jumbotron-header-section)
          (what-we-do-section)
          (email-section))))
        
