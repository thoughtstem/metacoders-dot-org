#lang at-exp racket

(provide normal-content
         normal-content-wide
         mc-jumbotron-header
         staff-modal
         meeting-date->date
         meeting-date->weekday
         
         primary
         primary-dark-1
         primary-dark-2
         primary-dark-3
         primary-dark-4
         primary-shadow

         warning
         warning-dark-1
         warning-dark-2
         warning-dark-3
         warning-dark-4
         warning-shadow)

(require website/bootstrap
         racket/runtime-path
         "./css.rkt"
         "./imgs.rkt"
         "./paths.rkt"
         gregor
         
         (only-in 2htdp/image color-alpha)
         image-coloring
         )

(define (darken-color color amount)
  (change-color-brightness (- amount) color ))

(define (darken-hex-color num-or-string amount)
  (define color (hex->color num-or-string))
  (if (= (color-alpha color) 255)
      (color->hex-string (darken-color color amount))
      (color->hex-string #:alpha? #t (darken-color color amount))))

(define primary "#10B1A2")
(define primary-base-color (hex->color primary))
(define primary-dark-1 (~a "#" (color->hex-string (darken-color primary-base-color 15))))
(define primary-dark-2 (~a "#" (color->hex-string (darken-color primary-base-color 20))))
(define primary-dark-3 (~a "#" (color->hex-string (darken-color primary-base-color 25))))
(define primary-dark-4 (~a "#" (color->hex-string (darken-color primary-base-color 30))))
(define primary-shadow (~a "#" (color->hex-string (change-color-alpha -128 primary-base-color) #:alpha? #t)))

(define warning "#F9A21D")
(define warning-base-color (hex->color warning))
(define warning-dark-1 (~a "#" (color->hex-string (darken-color warning-base-color 15))))
(define warning-dark-2 (~a "#" (color->hex-string (darken-color warning-base-color 20))))
(define warning-dark-3 (~a "#" (color->hex-string (darken-color warning-base-color 25))))
(define warning-dark-4 (~a "#" (color->hex-string (darken-color warning-base-color 30))))
(define warning-shadow (~a "#" (color->hex-string (change-color-alpha -128 warning-base-color) #:alpha? #t)))

(define (custom-css-colors)
  
  (literal
   @style/inline[type: "text/css"]{
 .bg-primary {
  background-color: @primary !important;
 }
 .bg-warning {
  background-color: @warning !important;
 }
 .text-primary {
  color: @primary !important;
 }
 .text-warning {
  color: @warning !important;
 }
 .border-primary {
    border-color: @primary !important;
 }
 .border-warning {
    border-color: @warning !important;
 }
 a {
  color: @primary;
  text-decoration: none;
  background-color: transparent;
  -webkit-text-decoration-skip: objects
 }
 a:hover {
  color: @primary-dark-4;
  text-decoration: underline
 }
 .btn-primary {
    color: #fff;
    background-color: @primary;
    border-color: @primary;
 }
 .btn-primary:hover {
    color: #fff;
    background-color: @primary-dark-1;
    border-color: @primary-dark-2;
 }
 .btn-primary.focus, .btn-primary:focus {
    box-shadow: 0 0 0 0.2rem @primary-shadow;
 }
 .btn-primary.disabled, .btn-primary:disabled {
  color: #fff;
  background-color: @primary-dark-1;
  border-color: @primary-dark-1;
 }
 .btn-primary:not(:disabled):not(.disabled).active, .btn-primary:not(:disabled):not(.disabled):active, .show > .btn-primary.dropdown-toggle {
  color: #fff;
  background-color: @primary-dark-2;
  border-color: @primary-dark-3;
 }
 .btn-primary:not(:disabled):not(.disabled).active:focus, .btn-primary:not(:disabled):not(.disabled):active:focus, .show > .btn-primary.dropdown-toggle:focus {
    box-shadow: 0 0 0 0.2rem @primary-shadow;
 }
 
}))

(define (google-analytics)
  (list 
    (script 'async: "true" src: "https://www.googletagmanager.com/gtag/js?id=UA-154491265-1")
    (script/inline
      @~a{
        window.dataLayer = window.dataLayer || [];
        function gtag(){dataLayer.push(arguments);}
        gtag('js', new Date());
        gtag('config', 'UA-154491265-1');})))


(define (normal-content #:head (h (void)) . more)
  (content #:head (list h
                        (custom-css-colors)
                        (google-analytics))
    (normal-navbar)
    (container 
      id: "main"
      style: (properties 'min-height: "80vh")
      more)
    (normal-footer)))

(define (normal-content-wide #:head (h (void)) . more)
  (content #:head (list h
                        (custom-css-colors)
                        (google-analytics)) 
    (jumbotron-navbar)
    (div 
      id: "main"
      style: (properties 'min-height: "80vh")
      more)
    (normal-footer)))


(define (mc-jumbotron-header
          #:title [title "Title"]
          #:tagline [tagline "Tagline"]
          #:percent-height [percent-height "80vh"]
          #:image-path [image-path learn-more-banner-path]
          . more)
  (jumbotron style: (properties
                      text-align: "center"
                      margin-bottom: 0
                      background-image: (string-append "url(" (prefix/pathify image-path) ")")
                      background-position: "center"
                      background-size: "cover"
                      'min-height: percent-height
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
                      ;padding: 15
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
    (footer class: "px-3 pt-4 bg-dark"
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
              (li (small "(858) 375-4097"))
              (li (a href:"mailto: contact@metacoders.org" (small "contact@metacoders.org")))
              (li (small "Monday - Friday, 9am-5pm PT"))))
          (col-md-3 class: "text-white"
            (h6 "Follow Us")
            (ul class: "list-unstyled"
              (li 
                (row
                  (col-12
                    (a href: "https://www.facebook.com/metacoders.org/"
                       style: (properties padding-left: "0px")
                       class: "fab fa-facebook-square fa-2x")
                    (a href: "https://twitter.com/metacoders" class: "fab fa-twitter-square fa-2x")
                    (a href: "https://www.linkedin.com/company/34648496" class: "fab fa-linkedin fa-2x")
                    (a href: "https://www.instagram.com/metacoders/" class: "fab fa-instagram fa-2x"))))
              (li (br))
              (li (small "MetaCoders, Inc. Copyright 2020"))
              (li (small "All Rights Reserved"))
              (li (br))
              (li (small "MetaCoders, Inc. is a non-profit registered in the state of California."))
              (li (small "Tax ID: 84-3633066")))))))))

(define (normal-navbar)
  (navbar
    #:brand (img src: (prefix/pathify navbar-logo2-wide-path)
                 height: 40
                 'alt: "MetaCoders") ;"MetaCoders"
    (my-nav-link learn-more-path  "Learn More")
    (my-nav-link city-search-path "Locations")
    (my-nav-link join-our-team-path "Join Our Team")
    (my-nav-link donate-path "Donate")))

(define (jumbotron-navbar)

  (list
   (style/inline
    @~a{
 .navbar:before{
  background: #343a40;
  @;background: linear-gradient(-45deg, #542E85, #f8f9fa);
  @;background: linear-gradient(-45deg, #542E85, #f8f9fa);
  content: '';
  width: 100%;
  height: 100%;
  top: 0;
  left: 0;
  position: absolute;
  z-index: -1;
  opacity: 0;
  transition: opacity 1s ease 0s;
 }
 .navbar.solid:before {
  opacity: 1;
 }
 })
   (script/inline
     @~a{
        $(document).ready(function() {
                // Transition effect for navbar
                $(window).scroll(function() {
                  var navContent = document.getElementById('navbarSupportedContent');
                  // checks if window is scrolled more than 5% of screen width, adds/removes solid class
                  if($(this).scrollTop() > (.05 * window.innerHeight) ||
                      navContent.classList.contains("show")) {
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
       ;"MetaCoders"
       (img src: (prefix/pathify navbar-logo2-wide-path)
                 height: 40
                 'alt: "MetaCoders")
       )
    (button id: "navbarToggler" 'onclick: "toggleNavbarSolid();" class: "navbar-toggler" type: "button" `data-toggle: "collapse" `data-target: "#navbarSupportedContent" `aria-controls: "navbarSupportedContent" `aria-expanded: "false" `aria-label: "Toggle navigation"
        (span class: "navbar-toggler-icon")
        @script/inline{
 function toggleNavbarSolid() {
  var navContent = document.getElementById('navbarSupportedContent');
  if($(this).scrollTop() <= (.05 * window.innerHeight) &&
     navContent.classList.contains("show")) {
     $('.navbar').removeClass('solid');
   } else {
     $('.navbar').addClass('solid');
  }
  }})
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
    (modal-dialog class: "modal-dialog-centered text-left"
      (modal-content
        (modal-header class: "bg-primary"
          (button type: "button" class: "close p-2" `data-dismiss: "modal" `aria-label: "Close"
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
        (modal-footer class: "p-2"
          (button type: "button" class: "btn btn-secondary" `data-dismiss: "modal"
                  "Close")
          )))))

(define (print-dates dates [s ""])   
  (if (> (length dates) 1)
      (begin (set! s (~a s (first dates) ", "))
             (print-dates (rest dates) s))
      (begin (set! s (~a s (first dates) "."))
             s)))

(define (meeting-date->date meeting-date)
  (define date (parse-date meeting-date "M/d/yyyy"))
  date)

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
