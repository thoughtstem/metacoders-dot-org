#lang at-exp racket

(provide normal-content
         normal-content-wide
         mc-jumbotron-header
         staff-modal
         meeting-date->weekday)

(require website/bootstrap
         racket/runtime-path
         "./css.rkt"
         "./imgs.rkt"
         "./paths.rkt"
         gregor)


(define (normal-content #:head (h (void)) . more)
  (content #:head h
    (normal-navbar)
    (container 
      id: "main"
      more)
    (normal-footer)))

(define (normal-content-wide #:head (h (void)) . more)
  (content #:head h
    (jumbotron-navbar)
    (div 
      id: "main"
      more)
    (normal-footer)))


(define (mc-jumbotron-header
          #:title [title "Title"]
          #:tagline [tagline "Tagline"]
          #:percent-height [percent-height "80%"]
          #:image-path [image-path learn-more-banner-path]
          . more)
  (jumbotron style: (properties
                      text-align: "center"
                      margin-bottom: 0
                      background-image: (string-append "url(" (prefix/pathify image-path) ")")
                      background-position: "center"
                      background-size: "cover"
                      height: percent-height
                      position: "relative")
              class: "d-flex align-items-center"
    (div class: "overlay"
         style: (properties
                  background-color: "rgba(0, 0, 0, 0.6)"
                  width: "100%"
                  position: "absolute"
                  top: 0
                  left: 0
                  bottom: 0
                  right: 0
                  float: "left"))
    (container
      (div style: (properties
                      display: "inline-block"
                      padding: 15
                      color: "white"
                      position: "relative"
                      z-index: "10")
                  (h1 title)
                  (h6 tagline)))
                  more))


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
      (container 
        (row
          (col-md-3 class: "text-white"
            (h6 "Company")
            (ul class: "list-unstyled"
              (li (link-to learn-more-path (small "Learn More")))
              (li (link-to join-our-team-path (small "Join Our Team")))
              (li (link-to donate-path (small "Donate")))
              (li (link-to terms-and-conditions-path (small "Terms & Conditions")))))
          (col-md-3 class: "text-white"
            (h6 "Programs")
            (ul class: "list-unstyled"
              (li (link-to city-search-path (small "Find a Location")))
              (li (link-to partners-top-path (small "Start a New Location"))))
            (h6 "Contact Us")
            (ul class: "list-unstyled"
              (li (small "(858) 869-9430"))
              (li (a href:"mailto: contact@metacoders.org" (small "contact@metacoders.org")))
              (li (small "Monday - Friday, 9am-5pm PT"))))
          (col-md-3 class: "text-white"
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
              (li (small "All Rights Reserved"))
              (li (br))
              (li (small "MetaCoders, Inc. is a non-profit registered in the state of California."))
              (li (small "Tax ID: 84-3633066")))))))))

(define (normal-navbar)
  (navbar
    #:brand "MetaCoders"
    (my-nav-link learn-more-path  "Learn More")
    (my-nav-link city-search-path "Locations")
    (my-nav-link join-our-team-path "Join Our Team")
    (my-nav-link donate-path "Donate")))

(define (jumbotron-navbar)

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
                  // checks if window is scrolled more than 5% of screen width, adds/removes solid class
                  if($(this).scrollTop() > (.05 * window.innerHeight)) {
                      $('.navbar').addClass('solid');
                  } else {
                      $('.navbar').removeClass('solid');
                  }
                });
        });
     })
  (nav class: "navbar fixed-top navbar-dark navbar-expand-md bg-transparent"
    (a class: "navbar-brand"
       href: (pathify (add-path-prefix index-path)) ;"/index.html"
       style: (properties color: "white")
       "MetaCoders")
    (button class: "navbar-toggler" type: "button" `data-toggle: "collapse" `data-target: "#navbarSupportedContent" `aria-controls: "navbarSupportedContent" `aria-expanded: "false" `aria-label: "Toggle navigation"
        (span class: "navbar-toggler-icon"))
    (div class: "collapse navbar-collapse" id: "navbarSupportedContent"
      (ul class: "navbar-nav ml-auto"
        (my-nav-link learn-more-path  "Learn More")
        (my-nav-link city-search-path "Locations")
        (my-nav-link join-our-team-path "Join Our Team")
        (my-nav-link donate-path "Donate"))))))

(define (my-nav-link to text)
  (nav-item
    (a class: "nav-link mr-3 text-white"
       href: (pathify (add-path-prefix to))
       text)))

(provide big-image
         big-quote)

(define (staff-modal #:id modal-id
                     #:path the-path
                     #:name [name "Name goes here"]
                     #:position [position "Position goes here"]
                     #:quote [quote "Quote goes here"])
  (modal id: modal-id `tabindex: "-1" `role: "dialog" `aria-labelledby: "exampleModalLabel" `aria-hidden: "true"
    (modal-dialog class: "modal-dialog-centered"
      (modal-content
        (modal-header class: "bg-primary"
          (button type: "button" class: "close" `data-dismiss: "modal" `aria-label: "Close"
            (span class: "text-white" `aria-hidden: "true" 
                  "×")))
        (modal-body 
          (row 
            (col-4
              (img src: (prefix/pathify the-path)
                  class: "img-fluid rounded m-3"))
            (col-8 
              (h3 name)
              (p (strong "Position: ") position)
              (p (i quote)))))
        (modal-footer
          (button type: "button" class: "btn btn-secondary" `data-dismiss: "modal"
                  "Close")
          (button type: "button" class: "btn btn-primary"   
                  "Save Changes"))))))

(define (print-dates dates [s ""])   
  (if (> (length dates) 1)
      (begin (set! s (~a s (first dates) ", "))
             (print-dates (rest dates) s))
      (begin (set! s (~a s (first dates) "."))
             s)))

(define (meeting-date->weekday meeting-date)
  (define date (parse-date meeting-date "M/d/yyyy"))
  (define day-list (list "Sunday" "Monday" "Tuesday" "Wednesday" "Thursday" "Friday" "Saturday"))
  (list-ref day-list (->wday date)))



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
                   #:image-src (image-src lindsey-img-path)
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
