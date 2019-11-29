#lang at-exp racket

(provide index)

(require metacoders-dot-org-lib
         racket/runtime-path)

(define (jumbotron-header-section)
  (jumbotron  style: (properties
                      text-align: "center"
                      margin-bottom: 0
                      background-image: (string-append "url(" (prefix/pathify homepage-banner-path) ")")
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
                  (row class: "justify-content-center"
                    (col-7
                      (h6 "Cutting-edge learning science, with grass-roots community support to prepare kids for the future.")))))))

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
                  (row class: "justify-content-center"
                    (col-8
                      (h6 "We teach kids coding the “meta” way. We bring the latest scientific research to the table to make sure kids are getting the most out of our classes.")))
                  (br)
                  (responsive-row #:columns 3
                      (card class:"h-100"
                      (card-img-top class: "gradient-effect"
                                    src: (prefix/pathify games-svg-path)
                                    style: (properties background-color: "#00C851")) 
                      (card-body
                        (card-title "Meta Games")
                        (card-text "Our students stay motivated with badges and prizes.")))
                      (card class:"h-100"
                        (card-img-top class: "gradient-effect"
                                      src: (prefix/pathify brain-svg-path)
                                      style: (properties background-color: "#ffbb33")) 
                        (card-body
                          (card-title "Metacognition")
                          (card-text "By reflecting on how we learn, we are able to learn more efficiently.")))
                      (card class:"h-100"
                        (card-img-top class: "gradient-effect"
                                      src: (prefix/pathify story-svg-path)
                                      style: (properties background-color: "#33b5e5")) 
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
          (col-md-6
            (carousel class: "slide" 'data-ride:"carousel" id: "carouselExampleControls"
              (carousel-inner
                (carousel-item class: "active" 
                  (img src: (prefix/pathify takes-a-village-path) 
                  class: "img-fluid rounded d-block w-100" 'alt: "First Slide"))
                (carousel-item 'alt: "Second Slide"
                  (img src: (prefix/pathify takes-a-village-2-path) 
                  class: "img-fluid rounded d-block w-100" 'alt: "Second Slide"))
                (carousel-item 'alt: "Third Slide"
                  (img src: (prefix/pathify takes-a-village-3-path) 
                  class: "img-fluid rounded d-block w-100" 'alt: "Third Slide"))
                (carousel-item 'alt: "Fourth Slide"
                  (img src: (prefix/pathify takes-a-village-4-path) 
                  class: "img-fluid rounded d-block w-100" 'alt: "Fourth Slide")))
              (a class: "carousel-control-prev" href: "#carouselExampleControls" 'role: "button" 'data-slide: "prev"
                (span class: "carousel-control-prev-icon" 'aria-hidden: "true")
                (span class: "sr-only" "Previous"))
              (a class: "carousel-control-next" href: "#carouselExampleControls" 'role: "button" 'data-slide: "next"
                (span class: "carousel-control-next-icon" 'aria-hidden: "true")
                (span class: "sr-only" "Next"))))
          (col-md-6 class: "pt-md-0 pt-3"
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
        (col-md-7
          (h2 "We’re teaching coding to save the world.")
          (p "Around the world, coders are tackling cancer, self-driving cars, and terrorism.  If we are going to save the world, we need more people coding.")
          (br)
          (b (p "Meet the people who are saving the world, one coding student at a time:")))
        (col-md-5
          (row
            (col-sm-6
              (a href: "#" `data-toggle: "modal" `data-target: "#Modal-Sonny"
                (img src: (prefix/pathify sonny-img-path) 
                     class: "img-fluid rounded mb-3 img-link")))
            (col-sm-6
              (a href: "#" `data-toggle: "modal" `data-target: "#Modal-Lindsey"
                (img src: (prefix/pathify lindsey-img-path) 
                     class: "img-fluid rounded ml-1 mb-3 img-link"))))
          (row
            (col-sm-6
              (a href: "#" `data-toggle: "modal" `data-target: "#Modal-Sara"
                (img src: (prefix/pathify sara-img-path) 
                     class: "img-fluid rounded mt-3 img-link")))
            (col-sm-6
              (a href: "#" `data-toggle: "modal" `data-target: "#Modal-Judith"
                (img src: (prefix/pathify judith-img-path) 
                     class: "img-fluid rounded ml-1 mt-3 img-link"))))
          (staff-modal #:id "Modal-Sonny"
                       #:path sonny-img-path
                       #:name "Sonny Najar"
                       #:position "Software Developer and Instructor at MetaCoders"
                       #:quote "Pick any object and ask, How did this get here? Odds are, its design, manufacturing, and distribution was shaped by code. We write these stories at a rate of 111 billion lines per year. MetaCoders can help you write your first line, or your millionth.")
          (staff-modal #:id "Modal-Lindsey"
                       #:path lindsey-img-path
                       #:name "Lindsey Handley, Ph.D."
                       #:position "Co-Founder & Officer"
                       #:quote "The moment we realized coding education could transform everything -- from math and sciences to history and language arts -- that was when we decided to found MetaCoders. You don't leave something broken when you know how to fix it.")
          (staff-modal #:id "Modal-Sara"
                       #:path sara-img-path
                       #:name "Sara Lucchini"
                       #:position "Software Developer and Instructor at MetaCoders"
                       #:quote "Writing code is a form of storytelling -- where the stories actually come true. That's the magic of our time. With that alone, teachers and students can rewrite education as we know it. MetaCoders paves the way.")
          (staff-modal #:id "Modal-Judith"
                       #:path judith-img-path
                       #:name "Judith Eisenberg"
                       #:position "Administrator and Instructor at MetaCoders"
                       #:quote "Put a coder in an fMRI, and what lights up? The language parts. The better the coder, the more their brains look like they are reading English while reading code. I designed MetaCoders education around this simple neuroscientific insight: learning to code is a form of language acquisition."))))))


(define (index)
  (page index-path
        (normal-content-wide
          (style/inline type: "text/css" 
                        (~a ".img-link:hover {
                            opacity: 0.5;
                            filter: alpha(opacity=50); /* For IE8 and earlier */}"
                            "@keyframes flow {
                              0% {
                                background-position: 0% 50%;
                              }
                              50% {
                                background-position: 100% 50%;
                              }
                              100% {
                                background-position: 0% 50%;
                              }
                            }"
                            ".gradient-effect:hover {background: linear-gradient(-45deg, #ee7752, #e73c7e, #23a6d5, #23d5ab);
                                                    background-size: 400% 400%;
                                                    animation: flow 10s ease infinite;}"))
          (jumbotron-header-section)
          (jumbotron-code-the-meta-way) 
          (jumbotron-it-takes-a-village)
          (jumbotron-save-the-world))))
