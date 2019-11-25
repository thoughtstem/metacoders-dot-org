#lang at-exp racket

(provide partners)
(require metacoders-dot-org-lib)

(define (jumbotron-header-section)
  (jumbotron  class: "text-center mb-0"
              style: (properties
                      background-image: (string-append "url(" (prefix/pathify partners-img-path) ")")
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
              (h6 "Make a difference by bringing MetaCoders to your community! We hope our excitement for teaching coding is infectious, and you will be inspired to invite us to your neighborhood.")))))

(define (what-we-do-section)
  (jumbotron  class: "mb-0"
              style: (properties background: "white")
    (container
      ;(h2 class: "text-center" "What We Do")
      ;(br)
      ;(p "We hope our excitement for teaching coding is infectious, and you will be inspired to invite us to your neighborhood.")
      (p "MetaCoders teaches " (b "weekly one-hour") " coding classes during the school year after-school on "
         (b "weekday afternoons") " and on " (b "weekends") ".  We run " (b "single day") " camps during "
         (b "school breaks") ".  During the " (b "summers") ", we run " (b "week-long, half-day") " camps.")
      (p "We teach in locations that are near " (b "parents") " who are interested in coding education and where there are "
         (b "enthusiastic coaches") " we can hire and train to run our classes.")
      
      )
  )
)

(define (email-section)
  (jumbotron class: "mb-0"
             (container
              (p "If you administer a location that you would like us to consider, please provide your contact information in the boxes below:")
              (email-signup))
  )
)

(define (partners)
  (page partners-top-path
        (normal-content-wide
          (jumbotron-header-section)
          (what-we-do-section)
          (email-section))))
        