#lang at-exp racket

(provide coach-training-chapter-path
         nav-link-to-chapter
         book-nav
         flash-cards
         metapolis-quest)

(require metacoders-dot-org-lib
         website/bootstrap)

(define (coach-training-chapter-path n)
  (list "coaches" (~a "training-ch" n ".html")))

(define (nav-link-to-chapter n)
  (link-to 
    #:element page-link
    (coach-training-chapter-path n)
    (~a n)))

(define (book-nav book #:current n)
  (container
    (page-nav #:active n 
              #:label "Chapters"
              (link-to #:element page-link
                (list "coaches" "training.html")
                "Intro")
              (map nav-link-to-chapter 
                   (range 1
                          (add1 (length book)))))))


(define (flash-cards deck-name)
  (code 
    "#lang meta-cards"
    (br)
    (br)
    @~a{(view-deck @deck-name)}))


(define (metapolis-quest . stops)
  (div
    style: (properties width: "100%"
                       height: "500px"
                       overflow: "hidden"
                       position: "relative")
    (impress-metapolis
      #:quest
      stops)))
