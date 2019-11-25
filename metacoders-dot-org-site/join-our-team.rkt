#lang at-exp racket

(provide join-our-team)

(require metacoders-dot-org-lib)

(define (join-our-team)
  (page join-our-team-path
        (normal-content-wide
          (jumbotron-header-section)
          (two-ways-to-work-with-metacoders)
          (two-other-ways-to-help-metacoders)
          (our-values))))

(define (jumbotron-header-section)
  (jumbotron  style: (properties
                      text-align: "center"
                      margin-bottom: 0
                      background-image: (string-append "url(" (prefix/pathify join-our-team-banner-path) ")")
                      background-position: "center"
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
      (responsive-row #:columns 2
        (card class: "h-100"
          (card-img-top src: (prefix/pathify coding-coach-img-path))
          (card-body
            (card-title "Become a Coding Coach")
            (card-text "Teach kids in your community how to code!")
            (link-to coaches-top-path 
              (button-primary "Learn More"))))
        (card class: "h-100"
          (card-img-top src: (prefix/pathify equipment-img-path))
          (card-body
            (card-title "Become a Technology Coordinator")
            (card-text "Help us connect coaches and students in your area!")
            (link-to tech-coords-top-path 
              (button-primary "Learn More"))))))))


(define (two-other-ways-to-help-metacoders)
  (jumbotron  style: (properties
                           text-align: "center"
                           margin-bottom: 0)
    (container
      (h2 "Other Ways You Can Help")
      (br)
      (p "In addition to employment opportunities, we're always looking for volunteers and interns to help us maximize student outcomes in our classrooms.")
      (br)
      (responsive-row #:columns 3
        (card class: "h-100"
          (card-img-top src: (prefix/pathify volunteer-scientist-img-path))
          (card-body
            (card-title "Volunteer as a Learning Scientist")
            (card-text "Study and monitor MetaCoders classes in your local area to make sure kids have the best classroom experiences.")
            (link-to scientists-top-path
              (button-primary "Learn More"))))
        (card class: "h-100"
          (card-img-top src: (prefix/pathify volunteer-coder-img-path))
          (card-body
            (card-title "Volunteer as a Coder")
            (card-text "Help us code open-source educational software that kids around the world can use to create video games, apps, and more!")
            (link-to coders-top-path 
              (button-primary "Learn More"))))
        (card class: "h-100"
          (card-img-top src: (prefix/pathify summer-camp-intern-img-path))
          (card-body
            (card-title "Intern as a Summer Camp Team Leader")
            (card-text "Lead students in our summer camps in coding exercises and make sure they have a great first experience with coding!")
            (link-to summer-camp-intern-top-path 
              (button-primary "Learn More"))))))))

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
      (responsive-row #:columns 4
        (card class: "text-white bg-primary h-100"
          (card-header class: "font-weight-bold" "Compassion")
          (card-body
            (card-text "A common phrase we use: \"we be good people\". We always exercise compassion when working with our employees, volunteers, parent customers, and students.")))
        (card class: "text-white bg-primary h-100"
          (card-header class: "font-weight-bold" "Resourcefulness")
          (card-body
            (card-text "It doesn't take the most expensive equipment or the flashiest software to teach coding. Many of us learned at home on our own! Resourcefulness is one way we offer better classes at lower costs.")))
        (card class: "text-white bg-primary h-100"
          (card-header class: "font-weight-bold" "Adaptability")
          (card-body
            (card-text "We use coding in everything. Our entire team, from coaches to administrators, is always looking for ways to be even more adaptable using the power of code.")))
        (card class: "text-white bg-primary h-100"
          (card-header class: "font-weight-bold" "Respect")
          (card-body
            (card-text "We respect people of all backgrounds. Respect between teachers and students is paramount in the classroom. The same goes for respect between all levels of staff at MetaCoders.")))))))
