#lang at-exp racket

(provide normal-content
         homepage-content)

(require website/bootstrap
         racket/runtime-path
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
    (homepage-navbar)
    (div id: "main"
         more)
    (normal-footer)))


(define (normal-footer)
  (list
   (style/inline
     @~a{
      .fab {
        padding: 5px;
        font-size: 30px;
        text-align: center;
        text-decoration: none;
      }

      /* Add a hover effect if you want */
      .fab:hover {
        opacity: 0.7;
      }
    })
    (footer class: "pt-4 bg-dark"
            style: (properties margin-top:"20vh")
      (container 
        (row
          (col-3 class: "text-white"
            (h6 "Company")
            (ul class: "list-unstyled"
              (li (link-to learn-more-path (small "Learn More")))
              (li (link-to get-to-work-path (small "Join Our Team")))
              (li (link-to donate-path (small "Donate")))
              (li (link-to terms-and-conditions-path (small "Terms & Conditions")))))
          (col-3 class: "text-white"
            (h6 "Programs")
            (ul class: "list-unstyled"
              (li (link-to city-search-path (small "Find a Location")))
              (li (link-to partners-top-path (small "Start a New Location"))))
            (h6 "Contact Us")
            (ul class: "list-unstyled"
              (li (small "(858) 869-9430"))
              (li (a href:"mailto: contact@metacoders.org" (small "contact@metacoders.org")))
              (li (small "Monday - Friday, 9am-5pm PT"))))
          (col-3 class: "text-white"
            (h6 "Follow Us")
            (ul class: "list-unstyled"
              (li 
                (row
                  (col-12
                    (a href: "https://www.facebook.com/thoughtstem"
                       style: (properties padding-left: "0px")
                       class: "fab fa-facebook-square fa-2x")
                    (a href: "https://www.twitter.com/thoughtstem" class: "fab fa-twitter-square fa-2x")
                    (a href: "https://www.linkedin.com/company/thoughtstem" class: "fab fa-linkedin fa-2x")
                    (a href: "https://www.instagram.com/thoughtstem" class: "fab fa-instagram fa-2x"))))
              (li (br))
              (li (small "MetaCoders, Inc. Copyright 2020"))
              (li (small "All Rights Reserved")))))))))

(define (normal-navbar)
  (navbar
    #:brand "MetaCoders"
    (my-nav-link learn-more-path  "Learn More")
    (my-nav-link city-search-path "Locations")
    (my-nav-link get-to-work-path "Join Our Team")
    (my-nav-link donate-path "Donate")))

(define (homepage-navbar)

  (list
   (style/inline
     @~a{
      .navbar.solid {
          background-color: #343a40 !important; 
          transition: background-color 1s ease 0s;
        }
     })
   (script/inline
     @~a{
        $(document).ready(function() {
                // Transition effect for navbar
                $(window).scroll(function() {
                  // checks if window is scrolled more than 75% of screen width, adds/removes solid class
                  if($(this).scrollTop() > (.75 * window.innerHeight)) {
                      $('.navbar').addClass('solid');
                  } else {
                      $('.navbar').removeClass('solid');
                  }
                });
        });
     })
  (nav class: "navbar fixed-top navbar-dark navbar-expand-md bg-transparent"
    (a class: "navbar-brand"
       href: "/index.html"
       style: (properties color: "white")
       "MetaCoders")
    (button class: "navbar-toggler" type: "button" `data-toggle: "collapse" `data-target: "#navbarSupportedContent" `aria-controls: "navbarSupportedContent" `aria-expanded: "false" `aria-label: "Toggle navigation"
        (span class: "navbar-toggler-icon"))
    (div class: "collapse navbar-collapse" id: "navbarSupportedContent"
      (ul class: "navbar-nav ml-auto"
        (my-nav-link learn-more-path  "Learn More")
        (my-nav-link city-search-path "Locations")
        (my-nav-link get-to-work-path "Join Our Team")
        (my-nav-link donate-path "Donate"))))))

(define (my-nav-link to text)
  (nav-item
    (a class: "nav-link mr-3 text-white"
       href: (pathify (add-path-prefix to))
       text)))

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
