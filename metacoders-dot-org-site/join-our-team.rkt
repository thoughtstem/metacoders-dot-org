#lang at-exp racket

(provide join-our-team)

(require metacoders-dot-org-lib)

(define (join-our-team)
  (page join-our-team-path
        (homepage-content
          (jumbotron-header-section)
          (two-ways-to-work-with-metacoders)
          (two-other-ways-to-help-metacoders)
          (our-values))))

(define (jumbotron-header-section)
  (jumbotron  style: (properties
                      text-align: "center"
                      margin-bottom: 0
                      background-image: (string-append "url(" (prefix/pathify join-our-team-banner-path) ")")
                      background-size: "cover"
                      height: "80%")
              class: "d-flex align-items-center"
              (container
                (div style: (properties
                                    display: "inline-block"
                                    padding: 15
                                    color: "white"
                                    background: "rgba(0, 0, 0, 0.5)")
              (h1 "Join Our Team")
              (h6 "You can make a difference in your community by bringing coding education to local students.")))))

(define (two-ways-to-work-with-metacoders)
  (jumbotron  style: (properties
                           text-align: "center"
                           margin-bottom: 0
                           background: "white")
    (container
      (h2 "Make a Difference in Kids' Lives")
      (br)
      (p "MetaCoders is in communities throughout the United States, and we are continuing to grow.  We are looking for candidates who support our mission of a world with more computer science education. Our current employment opportunities are:")
      (br)
      (card-deck
        (card
          (card-img-top src: (prefix/pathify coding-coach-img-path))
          (card-body
            (card-title "Become a Coding Coach")
            (card-text "Teach kids in your community how to code!")
            (button-primary
              "Learn More")))
        (card
          (card-img-top src: (prefix/pathify coding-coach-img-path))
          (card-body
            (card-title "Become a Technology Coordinator")
            (card-text "Work at home and prepare supplies for local classes.")
            (button-primary
              "Learn More")))))))


(define (two-other-ways-to-help-metacoders)
  (jumbotron  style: (properties
                           text-align: "center"
                           margin-bottom: 0)
    (container
      (h2 "Other Ways You Can Help")
      (br)
      (p "In addition to employment opportunities, we're always looking for volunteers to help us maximize student outcomes in our classrooms.")
      (br)
      (card-deck
        (card
          (card-img-top src: (prefix/pathify volunteer-scientist-img-path))
          (card-body
            (card-title "Volunteer as a Learning Scientist")
            (card-text "Study and monitor MetaCoders classes in your local area to make sure kids have the best classroom experiences.")
            (button-primary
              "Learn More")))
        (card
          (card-img-top src: (prefix/pathify volunteer-coder-img-path))
          (card-body
            (card-title "Volunteer as a Coder")
            (card-text "Help us code open-source educational software that kids around the world can use to create video games, apps, and more!")
            (button-primary
              "Learn More")))))))

(define (our-values)
  (jumbotron  style: (properties
                           text-align: "center"
                           margin-bottom: 0
                           background: "white")
    (container
      (h1 "Our Core Value")
      (p "We be good people."))))
