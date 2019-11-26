#lang at-exp racket

(provide index)

(require metacoders-dot-org-lib)

(define (jumbotron-header-section)
  (jumbotron  style: (properties
                      text-align: "center"
                      margin-bottom: 0
                      background-image: (string-append "url(" (prefix/pathify homepage-cover-img-path) ")")
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
                  (h1 "A New Kind of Coding Education")
                  (h6 "Cutting-edge learning science,")
                  (h6 "with grass-roots community support") 
                  (h6 "to prepare kids for the future.")))))

(define (jumbotron-code-the-meta-way)
  (jumbotron  style: (properties
                           text-align: "center"
                           margin-bottom: 0
                           background: "white")
      (container
                  (h1 "Code the Meta Way")
                  (br)
                  (h3 "Kids deserve the best in coding education.")
                  (br)
                  (h6 "We teach kids coding the “meta” way. We bring the latest scientific research") 
                  (h6 "to the table to make sure kids are getting the most out of our classes.")
                  (br)
                  (card-deck
                      (card
                      (card-img-top src: (prefix/pathify games-img-path)) 
                      (card-body
                        (card-title "Meta Games")
                        (card-text "Our students stay motivated with badges and prizes.")))
                      (card
                        (card-img-top src: (prefix/pathify brain-img-path))
                        (card-body
                          (card-title "Metacognition")
                          (card-text "By reflecting on how we learn, we are able to learn more efficiently.")))
                      (card
                        (card-img-top src: (prefix/pathify story-img-path))
                        (card-body
                          (card-title "Meta Stories")
                          (card-text "Stories are powerful tools for teaching values and communicating ideas."))))))
)

(define (jumbotron-it-takes-a-village)
  (jumbotron
    style: (properties margin-bottom: 0)
      (container
        (row 
          class: "align-items-center"
          (col-sm-6
            (img src: (prefix/pathify takes-a-village-path) 
                  class: "img-fluid rounded"))
          (col-sm-6
              (h2 "A good education takes a village.")
              (p "Coding education isn’t possible in many communities because the expertise isn’t there yet. We help train community members to bring grass-roots coding education to local kids.")
              (link-to join-our-team-path (button-primary id: "main-button" 
                                            class: "float-right"
                                            "Join Our Team")))))))

(define (jumbotron-save-the-world)
  (jumbotron
    style: (properties margin-bottom: 0
                       background: "white")
    (container
      (row
        class: "align-items-center"
        (col-sm-7
          (h2 "We’re teaching coding to save the world.")
          (p "Around the world, coders are tackling cancer, self-driving cars, and terrorism.  If we are going to save the world, we need more people coding.")
          (br)
          (b (p "Meet the people who are saving the world, one coding student at a time:")))
        (col-sm-5
          (row
            (col-sm-6
              (a href: "#" `data-toggle: "modal" `data-target: "#Modal-Sonny"
                (img src: (prefix/pathify sonny-img-path) 
                     class: "img-fluid rounded m-3 img-link")))
            (col-sm-6
              (a href: "#" `data-toggle: "modal" `data-target: "#Modal-Lindsey"
                (img src: (prefix/pathify lindsey-img-path) 
                     class: "img-fluid rounded m-3 img-link"))))
          (row
            (col-sm-6
              (a href: "#" `data-toggle: "modal" `data-target: "#Modal-Sara"
                (img src: (prefix/pathify sara-img-path) 
                     class: "img-fluid rounded m-3 img-link")))
            (col-sm-6
              (a href: "#" `data-toggle: "modal" `data-target: "#Modal-Judith"
                (img src: (prefix/pathify judith-img-path) 
                     class: "img-fluid rounded m-3 img-link"))))
          (staff-modal #:id "Modal-Sonny"
                       #:path sonny-img-path
                       #:name "Sonny Najar"
                       #:position "Software Developer and Instructor at MetaCoders"
                       #:quote "Bringing teachers and students together to learn coding is the most important thing we can be doing for our future.")
          (staff-modal #:id "Modal-Lindsey"
                       #:path lindsey-img-path
                       #:name "Lindsey Handley, Ph.D."
                       #:position "Co-Founder & Officer"
                       #:quote "Bringing teachers and students together to learn coding is the most important thing we can be doing for our future.")
          (staff-modal #:id "Modal-Sara"
                       #:path sara-img-path
                       #:name "Sara Lucchini"
                       #:position "Software Developer and Instructor at MetaCoders"
                       #:quote "Bringing teachers and students together to learn coding is the most important thing we can be doing for our future.")
          (staff-modal #:id "Modal-Judith"
                       #:path judith-img-path
                       #:name "Judith Eisenberg"
                       #:position "Administrator and Instructor at MetaCoders"
                       #:quote "Bringing teachers and students together to learn coding is the most important thing we can be doing for our future."))))))


(define (index)
  (page index-path
        (normal-content-wide
          (style/inline type: "text/css" 
                        (~a ".img-link:hover {
                            opacity: 0.5;
                            filter: alpha(opacity=50); /* For IE8 and earlier */}"))
          (jumbotron-header-section)
          (jumbotron-code-the-meta-way) 
          (jumbotron-it-takes-a-village)
          (jumbotron-save-the-world))))
