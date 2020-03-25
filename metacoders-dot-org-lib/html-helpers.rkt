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
         warning-shadow
         common-critical-css
         custom-css-colors
         )

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

(define primary "#1581c2") ; blue-green: 10b1a2, blue: 1581c2, light-blue: 589edb, purple: 8d3aa2
(define primary-base-color (hex->color primary))
(define primary-dark-1 (~a "#" (color->hex-string (darken-color primary-base-color 15))))
(define primary-dark-2 (~a "#" (color->hex-string (darken-color primary-base-color 20))))
(define primary-dark-3 (~a "#" (color->hex-string (darken-color primary-base-color 25))))
(define primary-dark-4 (~a "#" (color->hex-string (darken-color primary-base-color 30))))
(define primary-shadow (~a "#" (color->hex-string (change-color-alpha -128 primary-base-color) #:alpha? #t))) ;Bootstrap 4.4 also reduces sat by 15%

(define warning "#f37a1f") ; light-orange: f9a21d, orange: f37a1f, yellow: f6c41d, light-teal: 6bced0
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
 a.text-primary:focus, a.text-primary:hover {
  color: @primary-dark-4 !important;
 }
 a.text-warning:focus, a.text-warning:hover {
  color: @warning-dark-4 !important;
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
 @; BOOTSTRAP 4.0
 @;.btn-primary.focus, .btn-primary:focus {
 @;   box-shadow: 0 0 0 0.2rem @primary-shadow;
 @;}
 
 @; BOOTSTRAP 4.4
 .btn-primary.focus, .btn-primary:focus {
    color: #fff;
    background-color: @primary-dark-1;
    border-color: @primary-dark-2;
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

 .btn-warning {
    color: #fff;
    background-color: @warning;
    border-color: @warning;
 }
 .btn-warning:hover {
    color: #fff;
    background-color: @warning-dark-1;
    border-color: @warning-dark-2;
 }
 .btn-warning.focus, .btn-warning:focus {
    box-shadow: 0 0 0 0.2rem @warning-shadow;
 }
 .btn-warning.disabled, .btn-warning:disabled {
  color: #fff;
  background-color: @warning-dark-1;
  border-color: @warning-dark-1;
 }
 .btn-warning:not(:disabled):not(.disabled).active, .btn-warning:not(:disabled):not(.disabled):active, .show > .btn-warning.dropdown-toggle {
  color: #fff;
  background-color: @warning-dark-2;
  border-color: @warning-dark-3;
 }
 .btn-warning:not(:disabled):not(.disabled).active:focus, .btn-warning:not(:disabled):not(.disabled):active:focus, .show > .btn-warning.dropdown-toggle:focus {
    box-shadow: 0 0 0 0.2rem @warning-shadow;
 }
 
}))

(define (google-tag-manager)
 (list
  @script/inline{
   (function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
                                                new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
    j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
    'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
    })(window,document,'script','dataLayer','GTM-MZ2K628');}))

(define (google-tag-manager-2)
  (list
    (noscript
      (iframe src:"https://www.googletagmanager.com/ns.html?id=GTM-MZ2K628" height:"0" width:"0" style: "display:none;visibility:hidden"))))

(define (normal-content #:head [h (void)]
                        #:defer-css [defer #f]
                        . more)
  (content #:head (list h
                        (custom-css-colors)
                        (google-tag-manager)
                        )
	   #:defer-css defer
    (google-tag-manager-2)
    (normal-navbar)
    (container 
      id: "main"
      style: (properties 'min-height: "80vh")
      more)
    (normal-footer)))

(define (normal-content-wide #:head [h (void)]
                             #:defer-css [defer #f]
                             . more)
  (content #:head (list h
                        (custom-css-colors)
                        (google-tag-manager)
                        )
	   #:defer-css defer
    (google-tag-manager-2) 
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
          #:alt-tag [alt-tag ""]
          . more)
  (define jpg-url (prefix/pathify image-path))
  (define webp-url (prefix/pathify (jpg-path->webp-path image-path)))
  (jumbotron id: "main-banner"
             style: (properties
                      text-align: "center"
                      margin-bottom: 0
                      ;background-image: (string-append "url(" (prefix/pathify image-path) ")")
                      background-position: "center"
                      background-size: "cover"
                      height: percent-height
                      position: "relative")
              class: "d-flex align-items-center"
              role: "img"
              `aria-label: alt-tag
              @style/inline[type: "text/css"]{
 .no-webp #main-banner{
  background-image: url('@jpg-url') !important;
 }
 .webp #main-banner{
  background-image: url('@webp-url') !important;
 }
}
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
    #:brand ;"MetaCoders"
             (img src: (prefix/pathify navbar-logo7-wide-path)
                 height: 40
                 alt: "MetaCoders")
    (my-nav-link learn-more-path  "Learn More")
    (my-nav-link online-top-path  "Quarantine Coding Club")
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
       (img src: (prefix/pathify navbar-logo7-wide-path)
                 height: 40
                 alt: "MetaCoders")
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
        (my-nav-link online-top-path  "Quarantine Coding Club")
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
             (picture 
              (source type: "image/webp" srcset: (prefix/pathify (jpg-path->webp-path the-path)))
              (source type: "image/jpeg" srcset: (prefix/pathify the-path))
              (img src: (prefix/pathify the-path)
                   class: "img-fluid rounded m-3")))
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
           (picture 
              (source type: "image/webp" srcset: (prefix/pathify (jpg-path->webp-path image-src)))
              (source type: "image/jpeg" srcset: (prefix/pathify image-src))
              (img src: (prefix/pathify image-src)))
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

(define (common-critical-css)
  @style/inline[type: "text/css"]{
:root {
    --blue:#007bff;--indigo:#6610f2;--purple:#6f42c1;--pink:#e83e8c;--red:#dc3545;--orange:#fd7e14;--yellow:#ffc107;--green:#28a745;--teal:#20c997;--cyan:#17a2b8;--white:#fff;--gray:#6c757d;--gray-dark:#343a40;--primary:#007bff;--secondary:#6c757d;--success:#28a745;--info:#17a2b8;--warning:#ffc107;--danger:#dc3545;--light:#f8f9fa;--dark:#343a40;--breakpoint-xs:0;--breakpoint-sm:576px;--breakpoint-md:768px;--breakpoint-lg:992px;--breakpoint-xl:1200px;--font-family-sans-serif:-apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif,"Apple Color Emoji","Segoe UI Emoji","Segoe UI Symbol";--font-family-monospace:SFMono-Regular,Menlo,Monaco,Consolas,"Liberation Mono","Courier New",monospace}

*,::after,::before {
    box-sizing: border-box
}

html {
    font-family: sans-serif;
    line-height: 1.15;
    -webkit-text-size-adjust: 100%;
    -ms-text-size-adjust: 100%;
    -ms-overflow-style: scrollbar;
    -webkit-tap-highlight-color: transparent
}

article,aside,dialog,figcaption,figure,footer,header,hgroup,main,nav,section {
    display: block
}

body {
    margin: 0;
    font-family: -apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif,"Apple Color Emoji","Segoe UI Emoji","Segoe UI Symbol";
    font-size: 1rem;
    font-weight: 400;
    line-height: 1.5;
    color: #212529;
    text-align: left;
    background-color: #fff
}

h1,h2,h3,h4,h5,h6 {
    margin-top: 0;
    margin-bottom: .5rem
}

p {
    margin-top: 0;
    margin-bottom: 1rem
}

dl,ol,ul {
    margin-top: 0;
    margin-bottom: 1rem
}

b,strong {
    font-weight: bolder
}

small {
    font-size: 80%
}

a {
    color: #007bff;
    text-decoration: none;
    background-color: transparent;
    -webkit-text-decoration-skip: objects
}

img {
    vertical-align: middle;
    border-style: none
}

button {
    border-radius: 0
}

button,input,optgroup,select,textarea {
    margin: 0;
    font-family: inherit;
    font-size: inherit;
    line-height: inherit
}

button,input {
    overflow: visible
}

button,select {
    text-transform: none
}

[type=reset],[type=submit],button,html [type=button] {
    -webkit-appearance: button
}

.h1,.h2,.h3,.h4,.h5,.h6,h1,h2,h3,h4,h5,h6 {
    margin-bottom: .5rem;
    font-family: inherit;
    font-weight: 500;
    line-height: 1.2;
    color: inherit
}

.h1,h1 {
    font-size: 2.5rem
}

.h2,h2 {
    font-size: 2rem
}

.h5,h5 {
    font-size: 1.25rem
}

.h6,h6 {
    font-size: 1rem
}

.small,small {
    font-size: 80%;
    font-weight: 400
}

.list-unstyled {
    padding-left: 0;
    list-style: none
}

.container {
    width: 100%;
    padding-right: 15px;
    padding-left: 15px;
    margin-right: auto;
    margin-left: auto
}

@"@"media (min-width: 576px) {
    .container {
        max-width:540px
    }
}

@"@"media (min-width: 768px) {
    .container {
        max-width:720px
    }
}

@"@"media (min-width: 992px) {
    .container {
        max-width:960px
    }
}

@"@"media (min-width: 1200px) {
    .container {
        max-width:1140px
    }
}

.row {
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-wrap: wrap;
    flex-wrap: wrap;
    margin-right: -15px;
    margin-left: -15px
}

.col,.col-1,.col-10,.col-11,.col-12,.col-2,.col-3,.col-4,.col-5,.col-6,.col-7,.col-8,.col-9,.col-auto,.col-lg,.col-lg-1,.col-lg-10,.col-lg-11,.col-lg-12,.col-lg-2,.col-lg-3,.col-lg-4,.col-lg-5,.col-lg-6,.col-lg-7,.col-lg-8,.col-lg-9,.col-lg-auto,.col-md,.col-md-1,.col-md-10,.col-md-11,.col-md-12,.col-md-2,.col-md-3,.col-md-4,.col-md-5,.col-md-6,.col-md-7,.col-md-8,.col-md-9,.col-md-auto,.col-sm,.col-sm-1,.col-sm-10,.col-sm-11,.col-sm-12,.col-sm-2,.col-sm-3,.col-sm-4,.col-sm-5,.col-sm-6,.col-sm-7,.col-sm-8,.col-sm-9,.col-sm-auto,.col-xl,.col-xl-1,.col-xl-10,.col-xl-11,.col-xl-12,.col-xl-2,.col-xl-3,.col-xl-4,.col-xl-5,.col-xl-6,.col-xl-7,.col-xl-8,.col-xl-9,.col-xl-auto {
    position: relative;
    width: 100%;
    min-height: 1px;
    padding-right: 15px;
    padding-left: 15px
}

.col-12 {
    -webkit-box-flex: 0;
    -ms-flex: 0 0 100%;
    flex: 0 0 100%;
    max-width: 100%
}

@"@"media (min-width: 576px) {
    .col-sm-6 {
        -webkit-box-flex: 0;
        -ms-flex: 0 0 50%;
        flex: 0 0 50%;
        max-width: 50%
    }
}

@"@"media (min-width: 768px) {
	.col-md-3 {
		-webkit-box-flex: 0;
		-ms-flex: 0 0 25%;
		flex: 0 0 25%;
		max-width: 25%
	}
	.col-md-6 {
        -webkit-box-flex: 0;
        -ms-flex: 0 0 50%;
        flex: 0 0 50%;
        max-width: 50%
    }
}

@"@"media (min-width: 992px) {
	.col-lg-4 {
		-webkit-box-flex: 0;
		-ms-flex: 0 0 33.333333%;
		flex: 0 0 33.333333%;
		max-width: 33.333333%
    }
}

.btn {
    display: inline-block;
    font-weight: 400;
    text-align: center;
    white-space: nowrap;
    vertical-align: middle;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    border: 1px solid transparent;
    padding: .375rem .75rem;
    font-size: 1rem;
    line-height: 1.5;
    border-radius: .25rem;
    transition: color .15s ease-in-out,background-color .15s ease-in-out,border-color .15s ease-in-out,box-shadow .15s ease-in-out
}

.btn:not(:disabled):not(.disabled) {
    cursor: pointer
}

.btn-primary {
    color: #fff;
    background-color: #007bff;
    border-color: #007bff
}

.btn-block {
    display: block;
    width: 100%
}

.collapse {
    display: none
}

.nav-link {
    display: block;
    padding: .5rem 1rem
}

.navbar {
    position: relative;
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-wrap: wrap;
    flex-wrap: wrap;
    -webkit-box-align: center;
    -ms-flex-align: center;
    align-items: center;
    -webkit-box-pack: justify;
    -ms-flex-pack: justify;
    justify-content: space-between;
    padding: .5rem 1rem
}

.navbar-brand {
    display: inline-block;
    padding-top: .3125rem;
    padding-bottom: .3125rem;
    margin-right: 1rem;
    font-size: 1.25rem;
    line-height: inherit;
    white-space: nowrap
}

.navbar-nav {
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-orient: vertical;
    -webkit-box-direction: normal;
    -ms-flex-direction: column;
    flex-direction: column;
    padding-left: 0;
    margin-bottom: 0;
    list-style: none
}

.navbar-nav .nav-link {
    padding-right: 0;
    padding-left: 0
}

.navbar-collapse {
    -ms-flex-preferred-size: 100%;
    flex-basis: 100%;
    -webkit-box-flex: 1;
    -ms-flex-positive: 1;
    flex-grow: 1;
    -webkit-box-align: center;
    -ms-flex-align: center;
    align-items: center
}

.navbar-toggler {
    padding: .25rem .75rem;
    font-size: 1.25rem;
    line-height: 1;
    background-color: transparent;
    border: 1px solid transparent;
    border-radius: .25rem
}

.navbar-toggler:focus,.navbar-toggler:hover {
    text-decoration: none
}

.navbar-toggler:not(:disabled):not(.disabled) {
    cursor: pointer
}

.navbar-toggler-icon {
    display: inline-block;
    width: 1.5em;
    height: 1.5em;
    vertical-align: middle;
    content: "";
    background: no-repeat center center;
    background-size: 100% 100%
}

@"@"media (min-width: 768px) {
    .navbar-expand-md {
        -webkit-box-orient:horizontal;
        -webkit-box-direction: normal;
        -ms-flex-flow: row nowrap;
        flex-flow: row nowrap;
        -webkit-box-pack: start;
        -ms-flex-pack: start;
        justify-content: flex-start
    }

    .navbar-expand-md .navbar-nav {
        -webkit-box-orient: horizontal;
        -webkit-box-direction: normal;
        -ms-flex-direction: row;
        flex-direction: row
    }
	
	.navbar-expand-md .navbar-nav .nav-link {
        padding-right: .5rem;
        padding-left: .5rem
    }

	.navbar-expand-md .navbar-collapse {
        display: -webkit-box!important;
        display: -ms-flexbox!important;
        display: flex!important;
        -ms-flex-preferred-size: auto;
        flex-basis: auto
    }

    .navbar-expand-md .navbar-toggler {
        display: none
    }
}

.navbar-dark .navbar-brand {
    color: #fff
}

.navbar-dark .navbar-nav .nav-link {
    color: rgba(255,255,255,.5)
}

.navbar-dark .navbar-toggler {
    color: rgba(255,255,255,.5);
    border-color: rgba(255,255,255,.1)
}

.navbar-dark .navbar-toggler-icon {
    background-image: url("data:image/svg+xml;charset=utf8,%3Csvg viewBox='0 0 30 30' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath stroke='rgba(255, 255, 255, 0.5)' stroke-width='2' stroke-linecap='round' stroke-miterlimit='10' d='M4 7h22M4 15h22M4 23h22'/%3E%3C/svg%3E")
}

.card {
    position: relative;
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-orient: vertical;
    -webkit-box-direction: normal;
    -ms-flex-direction: column;
    flex-direction: column;
    min-width: 0;
    word-wrap: break-word;
    background-color: #fff;
    background-clip: border-box;
    border: 1px solid rgba(0,0,0,.125);
    border-radius: .25rem
}

.card-body {
    -webkit-box-flex: 1;
    -ms-flex: 1 1 auto;
    flex: 1 1 auto;
    padding: 1.25rem
}

.card-title {
    margin-bottom: .75rem
}

.card-text:last-child {
    margin-bottom: 0
}

.card-header {
    padding: .75rem 1.25rem;
    margin-bottom: 0;
    background-color: rgba(0,0,0,.03);
    border-bottom: 1px solid rgba(0,0,0,.125)
}

.card-header:first-child {
    border-radius: calc(.25rem - 1px) calc(.25rem - 1px) 0 0
}


.card-footer {
    padding: .75rem 1.25rem;
    background-color: rgba(0,0,0,.03);
    border-top: 1px solid rgba(0,0,0,.125)
}

.card-footer:last-child {
    border-radius: 0 0 calc(.25rem - 1px) calc(.25rem - 1px)
}

.card-img-top {
    width: 100%;
    border-top-left-radius: calc(.25rem - 1px);
    border-top-right-radius: calc(.25rem - 1px)
}

.jumbotron {
    padding: 2rem 1rem;
    margin-bottom: 2rem;
    background-color: #e9ecef;
    border-radius: .3rem
}

@"@"media (min-width: 576px) {
    .jumbotron {
        padding:4rem 2rem
    }
}

.bg-dark {
    background-color: #343a40!important
}

.bg-transparent {
    background-color: transparent!important
}

.border-primary {
    border-color: #007bff!important
}

.d-flex {
    display: -webkit-box!important;
    display: -ms-flexbox!important;
    display: flex!important
}

.align-items-center {
    -webkit-box-align: center!important;
    -ms-flex-align: center!important;
    align-items: center!important
}

.fixed-top {
    position: fixed;
    top: 0;
    right: 0;
    left: 0;
    z-index: 1030
}

.h-100 {
    height: 100%!important
}

.m-0 {
    margin: 0!important
}

.mb-0,.my-0 {
    margin-bottom: 0!important
}

.mr-2,.mx-2 {
    margin-right: .5rem!important
}

.mt-3,.my-3 {
    margin-top: 1rem!important
}

.mr-3,.mx-3 {
    margin-right: 1rem!important
}

.mb-3,.my-3 {
    margin-bottom: 1rem!important
}

.p-0 {
    padding: 0!important
}

.p-2 {
    padding: .5rem!important
}

.p-3 {
    padding: 1rem!important
}

.pr-3,.px-3 {
    padding-right: 1rem!important
}

.pl-3,.px-3 {
    padding-left: 1rem!important
}

.pt-4,.py-4 {
    padding-top: 1.5rem!important
}

.pt-5,.py-5 {
    padding-top: 3rem!important
}

.pb-5,.py-5 {
    padding-bottom: 3rem!important
}
	
.ml-auto,.mx-auto {
    margin-left: auto!important
}

@"@"media (min-width: 768px) {
    .pr-md-5,.px-md-5 {
        padding-right: 3rem!important
    }
	.pl-md-5,.px-md-5 {
        padding-left: 3rem!important
    }
}

.text-left {
    text-align: left!important
}

.text-center {
    text-align: center!important
}

.text-white {
    color: #fff!important
}

.text-primary {
    color: #007bff!important
}

/*# sourceMappingURL=bootstrap.min.css.map */
h1 {
    color: rgb($random[0 255],$random[0 255],$random[0 255]);
}

})
