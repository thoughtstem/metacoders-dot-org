#lang racket

(provide normal-content
         homepage-content)

(require website/bootstrap
         "./css.rkt"
         "./imgs.rkt"
         "./paths.rkt")

(define (normal-content . more)
  (content
    (normal-navbar)
    (container 
      id: "main"
      more)
    (normal-footer)))

(define (homepage-content . more)
  (content 
    #:head (list 
             (include-css testimonial-quotes.css))
    (normal-navbar)
    (div id: "main"
         more)
    (normal-footer)))

(define (normal-footer)
  (footer class: "pt-4"
    (container 
      (row
        (col-3
          (h6 "Company")
          (ul class: "list-unstyled"
            (li (link-to learn-more-path (small "Learn More")))
            (li (link-to get-to-work-path (small "Join Our Team")))
            (li (link-to donate-path (small "Donate")))
            (li (small "Terms & Conditions"))
            (li (small "Privacy Policy"))))
        (col-3
          (h6 "Programs")
          (ul class: "list-unstyled"
            (li (link-to city-search-path (small "Find a Location")))
            (li (link-to partners-top-path (small "Start a New Location"))))
          (h6 "Contact Us")
          (ul class: "list-unstyled"
            (li (small "(858) 869-9430"))
            (li (a href:"mailto: contact@metacoders.org" (small "contact@metacoders.org")))
            (li (small "Monday - Friday, 9am-5pm PT"))))
        (col-3
          (h6 "Follow Us")
          (ul class: "list-unstyled"
            (li (small "INSERT SOCIAL MEDIA LINKS"))
            (li (br))
            (li (small "MetaCoders, Inc. Copyright 2020"))
            (li (small "All Rights Reserved"))))))))



(define (normal-navbar)
  (navbar
    #:brand "MetaCoders"
    (nav-link learn-more-path  "Learn More")
    (nav-link city-search-path "Locations")
    (nav-link get-to-work-path "Join Our Team")
    (nav-link donate-path "Donate")))

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
                     (a href: (pathify (add-path-prefix learn-more-path))
                        (button-secondary 
                          style: (properties
                                   margin-top: 10)
                          "Learn More"))))))))
