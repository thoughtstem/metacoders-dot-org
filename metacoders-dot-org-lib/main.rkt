#lang at-exp racket

(provide normal-content
         homepage-content)

(provide index-path
         city-search-path
         learn-more-path
         get-to-work-path
         scientist-top-path        
         coders-top-path           
         location-partner-top-path
         tech-coords-top-path    
         coaches-top-path)

(provide (all-from-out website/bootstrap)
         (all-from-out "./imgs.rkt") 
         (all-from-out "./css.rkt"))

(require website/bootstrap
         "./imgs.rkt" 
         "./css.rkt")

(define index-path                (list "index.html"))
(define city-search-path          (list "city-search.html"))
(define learn-more-path           (list "learn-more.html"))
(define get-to-work-path          (list "get-to-work.html"))
(define scientist-top-path        (list "scientists.html"))
(define coders-top-path           (list "coders.html"))
(define location-partner-top-path (list "partners.html"))
(define tech-coords-top-path       (list "tech-coordinators.html"))
(define coaches-top-path       (list "coaches.html"))

(define (normal-content . more)
  (content
    (normal-navbar)
    (container more)))

(define (homepage-content . more)
  (content 
    #:head (list 
             (include-css testimonial-quotes.css))
    (normal-navbar)
    more))

(define (normal-navbar)
  (navbar
    #:brand "MetaCoders"
    (nav-link learn-more-path  "Learn More")
    (nav-link city-search-path "Enroll Kids")
    (nav-link get-to-work-path "Get To Work")))

(provide kid-circle
         coach-circle
         tech-coordinator-circle
         location-circle
         scientist-circle
         coder-circle)

(require (only-in 2htdp/image circle))

(define (kid-circle)
  (write-img 
    style: (properties margin: "2px") 
    (circle 4 'solid 'red)))

(define (coach-circle)
  (write-img 
    style: (properties margin: "2px") 
    (circle 4 'solid 'orange)))

(define (tech-coordinator-circle)
  (write-img 
    style: (properties margin: "2px") 
    (circle 4 'solid 'yellow)))

(define (location-circle)
  (write-img 
    style: (properties margin: "2px") 
    (circle 4 'solid 'green)))

(define (scientist-circle)
  (write-img 
    style: (properties margin: "2px") 
    (circle 4 'solid 'blue)))

(define (coder-circle)
  (write-img 
    style: (properties margin: "2px") 
    (circle 4 'solid 'purple)))


(provide big-image
         big-quote)

(define (big-image url
                   #:offset-y (offset-y 0)
                   #:offset-x (offset-x 0)
                   . content)
  (section class: "py-5 bg-image-full"
                   style: (properties
                            background-image: (~a "url(" url ")")
                            background-position: (~a "right " offset-x "px " "top " offset-y "px"))
                   (div style: (properties 
                                 height: 300)
                        content)))

(define (big-quote #:title (title "TITLE")
                   #:tagline (tagline "tag line...")
                   #:content (content (p "lorem ipsum..."))
                   #:image-src (image-src stephen-img-path)
                   #:attribution (attrib (list (span "Someone Famous") (br) "MetaCoders.org, Founding Member"))
                   #:right? (right #t))
  (section 
    class: "py-5"
    (container
      (h1 title)
      (p class: "lead"
         tagline)

      (div class: (if right
                    "testimonial-quote group right"
                    "testimonial-quote group")
           (img src: (pathify (add-path-prefix image-src)))
           (div class: "quote-container"
                (blockquote
                  content)
                   (cite
                     attrib
                     (br)
                     (a href: learn-more-path
                        (button-secondary 
                          style: (properties
                                   margin-top: 10)
                          "Learn More"))))))))







