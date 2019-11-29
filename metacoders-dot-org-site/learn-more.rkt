#lang at-exp racket

(provide learn-more)

(require website/bootstrap
         (only-in 2htdp/image circle)
         metacoders-dot-org-lib  
         racket/runtime-path
         "./learn-more/main.rkt")

(define-runtime-path js "learn-more/js")


(define (six-ways-to-go-meta)
  (responsive-row #:columns 3
    (enroll-call-to-action)
    (coach-call-to-action)
    (tech-coord-call-to-action)
    (partner-call-to-action)
    (scientist-call-to-action)
    (coder-call-to-action))
    )

(define (jumbotron-header)
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
              (h1 "About Us")
              (h6 "Learn about MetaCoders' educational philosophy, team, and more!")))))

(define (about-and-mission)
  (jumbotron style: (properties background: "white" margin-bottom: 0)
    (container
      (row
        (col-6 class: "pr-5"
          (h2 "About MetaCoders")
          (p "For the past 7 years, the founders of MetaCoders have been pioneering innovative approaches to teaching students coding. MetaCoders operated as a for-profit for several years as we honed our skills as educators and developed new technologies to better engage our students. Now, MetaCoders is teaching students nationwide!"))
        (col-6 class: "pl-5"
          (h2 "Our Mission")
          (p "MetaCoders’ mission is to prepare students for the future by not just teaching coding, but teaching students how to learn new programming languages. Programming languages come and go, so students need to be ready to learn the next language - whatever that may be! This means MetaCoders spends time teaching students about their brains and how they learn!"))))))

(define (programs-we-offer)
  (jumbotron style: (properties margin-bottom: 0)
    (container class: "text-center"
      (h2 "We Teach Coding Year-Round")
        (responsive-row #:columns 3
          (card class: "h-100"
            (card-img-top src: (prefix/pathify takes-a-village-4-path))
            (card-body
              (card-title "Summer Camps")
              (card-text "Fun, flexible, reasonably-priced summer camps are a great way to spark a lifetime interest in coding!")))
          (card class: "h-100"
            (card-img-top src: (prefix/pathify weekly-classes-img-path))
            (card-body
              (card-title "Weekly Classes")
              (card-text "Weekend classes at a local university or after-school at the local rec center, weekly classes keep students engaged throughout the year.")))
          (card class: "h-100"
            (card-img-top src: (prefix/pathify in-school-img-path))
            (card-body
              (card-title "In-School Workshops")
              (card-text "Many schools aren’t teaching coding, so we help schools integrate coding into the school day!")))))))
           
(define (what-makes-us-different)
  (jumbotron style: (properties background: "white" margin-bottom: 0)
    (container
      (h2 "What Makes MetaCoders Different?")
      (accordion
        (card
          (button class: "btn btn-primary p-3 text-left" 'data-toggle: "collapse" 'data-target: "#collapseOne" 'aria-expanded: "true" 'aria-controls: "collapseOne" 
            (i class: "fas fa-plus pr-2") 
            (h5 style: (properties display: "inline-block" margin-bottom: 0) "  A focus on cutting-edge research from the learning sciences.")))
        (div id: "collapseOne" class: "collapse show" 'aria-labelledby: "headingOne" 'data-parent: "#accordion"
          (card-body
            "Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS."))
        (card
          (button class: "btn btn-primary p-3 text-left collapsed" 'data-toggle: "collapse" 'data-target: "#collapseTwo" 'aria-expanded: "false" 'aria-controls: "collapseTwo" 
            (i class: "fas fa-plus pr-2") 
            (h5 style: (properties display: "inline-block" margin-bottom: 0)"  Building communities of learning around the country.")))
        (div id: "collapseTwo" class: "collapse" 'aria-labelledby: "headingTwo" 'data-parent: "#accordion"
          (card-body
            "Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS."))
        (card
          (button class: "btn btn-primary p-3 text-left collapsed" 'data-toggle: "collapse" 'data-target: "#collapseThree" 'aria-expanded: "false" 'aria-controls: "collapseThree"  
            (i class: "fas fa-plus pr-2") 
            (h5 style: (properties display: "inline-block" margin-bottom: 0)  "  A non-profit worldview, but with for-profit quality.")))
        (div id: "collapseThree" class: "collapse" 'aria-labelledby: "headingOne" 'data-parent: "#accordion"
          (card-body
            "Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS."))))))


(define (where-do-you-fit-in)
  (jumbotron style: (properties margin-bottom: 0)
    (container
      (div class: "text-center"
        (h2 "Where Do You Fit In?")
        (p "If you want to help us in our mission, there’s a lot of ways you can become involved, from enrolling your student to donating to becoming an employee or volunteer! Help us change the world!"))
      (six-ways-to-go-meta))))

(define (learn-more)
  (list
    (page js/name-replace-effect.js
          (file->string (build-path js "name-replace-effect.js"))) 
    (page learn-more-path
          (normal-content-wide
            (jumbotron-header)
                (about-and-mission)
                (programs-we-offer)
                (what-makes-us-different)
                (where-do-you-fit-in)
            (include-js "js/name-replace-effect.js")))))
