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
          (card-img-top src: (prefix/pathify equipment-img-path))
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
      (h1 "Our Core Values")
      (br)
      (p "We're all in this together! Our core values help us accomplish our mission of creating a world where everyone knows how to code.")
      (br)
      (card-deck
        (card class: "text-white bg-primary"
          (card-header class: "font-weight-bold" "Compassion")
          (card-body
            (card-text "A common phrase we use: \"we be good people\". We always exercise compassion when working with our employees, volunteers, parent customers, and students.")))
        (card class: "text-white bg-primary"
          (card-header class: "font-weight-bold" "Resourcefulness")
          (card-body
            (card-text "It doesn't take the most expensive equipment or the flashiest software to teach coding. Many of us learned at home on our own! Resourcefulness is one way we offer better classes at lower costs.")))
        (card class: "text-white bg-primary"
          (card-header class: "font-weight-bold" "Adaptability")
          (card-body
            (card-text "We use coding in everything. Our entire team, from coaches to administrators, are always looking for ways to be even more adaptable using the power of code.")))
        (card class: "text-white bg-primary"
          (card-header class: "font-weight-bold" "Respect")
          (card-body
            (card-text "We respect people of all backgrounds. Respect between teachers and students is paramount in the classroom. The same goes for respect between all levels of staff at MetaCoders.")))))))
