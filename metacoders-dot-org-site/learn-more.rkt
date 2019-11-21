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

(define (learn-more)
  (list
    (page js/name-replace-effect.js
          (file->string (build-path js "name-replace-effect.js"))) 
    (page learn-more-path
          (normal-content-wide
            (jumbotron-header)
              (container
                (br)
                @p{The MetaCoders concept is so simple that a single story explains it:}

                (metacoders-text-story-1)


                (h2 "Six ways to \"Go Meta\"")

                (six-ways-to-go-meta))
            (include-js "js/name-replace-effect.js")))))
