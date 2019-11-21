#lang racket

(provide city-search-page
         cities)

(require metacoders-dot-org-lib)
(require (prefix-in dc: metacoders-dot-org-dc-site))
(require (prefix-in reno: metacoders-dot-org-reno-site))
(require (only-in pict scale text filled-rectangle cc-superimpose colorize))

(define (cities/reno:index)
  (push-path 
    "cities"
    (push-path "reno"
               (reno:index))))

(define (cities/dc:index)
  (push-path 
    "cities"
    (push-path "dc"
               (dc:index))))

(define (cities/reno:index)
  (push-path 
    "cities"
    (push-path "reno"
               (reno:index))))

(define (cities)
  (list
    (push-path "cities" 
               (push-path "reno" (reno:pages)))
    (push-path "cities" 
               (push-path "dc" (dc:pages)))))

(define (index-page->banner-img index-page)
  (define c (page-content index-page))
  (get-property background-image:
                (get-attribute style:
                               (findf-element (query section)
                                              c))))


(define (index-page->city-card title index-page)
  (card
    style: (properties height: "300px") 
    ;Can't use link-to because it doesn't take attributes like class:.  TODO: It should.
    (a href: (pathify (add-path-prefix (page-path index-page)))
      class: "card-img-top"
      style: (properties 
                         background-image: 
                         (index-page->banner-img index-page)))
    (link-to index-page
      (card-body
        (card-title title)))))

(define (add-a-city-card)
  (card class: "h-100"
    (card-body
      (card-title "Your city can too!")
      (link-to partners-top-path
               (button-secondary "Learn More")))))

;Move to website
(define (rule apply-to style-string)
  (~a apply-to " {" style-string "}"))

(define (color-change-style)
  (style/inline
    (rule ".card-img-top"
         (properties
           filter: "grayscale(1)"
           height: "100%"))

    (rule ".card-img-top:hover"
      (properties
        filter: "none"
        '-webkit-filter: "grayscale(0%)"))))

(define (jumbotron-header-section)
  (jumbotron  style: (properties
                      background-image: (string-append "url(" (prefix/pathify join-our-team-banner-path) ")")
                      background-position: "center"
                      background-size: "cover"
                      height: "60%")
              class: "d-flex align-items-center mb-0 text-center"
              (container
               (div style: (properties
                            display: "inline-block"
                            padding: 15
                            color: "white"
                            background: "rgba(0, 0, 0, 0.5)")
                    (h1 "Cities That Went Meta")))))

(define (cities-section)
  (jumbotron  class: "mb-0 text-center"
              style: (properties background: "white")
              (container
               (h2 "MetaCoders is excited to bring coding education to:")
               (br)
               (responsive-row #:columns 3
                               (index-page->city-card 
                                "Chula Vista, CA"
                                (cities/dc:index))
                               (index-page->city-card 
                                "Dallas, TX"
                                (cities/dc:index))
                               (index-page->city-card 
                                "Minneapolis, MN"
                                (cities/dc:index))
                               (index-page->city-card 
                                "Poway, CA"
                                (cities/dc:index))
                               (index-page->city-card 
                                "Reno, NV"
                                (cities/reno:index))
                               (index-page->city-card 
                                "Temecula, CA"
                                (cities/dc:index))
                               (index-page->city-card 
                                "Washington, D.C."
                                (cities/dc:index))))))

(define (learn-more-section)
  (jumbotron  class: "mb-0 text-center"
              (container
               (h2 "If you don't see your city listed, you can still go meta.")
               (br)
               (link-to partners-top-path 
                        (button-primary "Learn More")))))

(define (city-search-page)
  (page city-search-path
        (normal-content-wide
          (color-change-style)
          (jumbotron-header-section)
          (cities-section)
          (learn-more-section)
          )))

