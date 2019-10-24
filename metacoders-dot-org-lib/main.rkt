#lang at-exp racket

(provide normal-content
         homepage-content)


(provide (all-from-out website/bootstrap)
         (all-from-out "./begin-training.rkt") 
         (all-from-out "./email-signup.rkt") 
         (all-from-out "./visual-aids.rkt") 
         (all-from-out "./calls-to-action.rkt") 
         (all-from-out "./paths.rkt") 
         (all-from-out "./imgs.rkt") 
         (all-from-out "./css.rkt"))

(require website/bootstrap
         "./begin-training.rkt"
         "./email-signup.rkt"
         "./visual-aids.rkt"
         "./calls-to-action.rkt"
         "./paths.rkt"
         "./imgs.rkt" 
         "./css.rkt")


(define (normal-content . more)
  (content
    (normal-navbar)
    (container 
      id: "main"
      more)))

(define (homepage-content . more)
  (content 
    #:head (list 
             (include-css testimonial-quotes.css))
    (normal-navbar)
    (div id: "main"
         more)))

(define (normal-navbar)
  (navbar
    #:brand "MetaCoders"
    (nav-link learn-more-path  "Learn More")
    (nav-link city-search-path "Enroll Kids")
    (nav-link get-to-work-path "Get To Work")))



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
                     (a href: (pathify learn-more-path)
                        (button-secondary 
                          style: (properties
                                   margin-top: 10)
                          "Learn More"))))))))






