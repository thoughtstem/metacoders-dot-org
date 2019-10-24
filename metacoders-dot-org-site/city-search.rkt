#lang racket

(provide city-search-page
         cities
         add-a-city-page) 

(require metacoders-dot-org-lib)
(require (prefix-in dc: metacoders-dot-org-dc-site))
(require (only-in pict scale text filled-rectangle cc-superimpose colorize))

(define (cities/dc:index)
  (push-path 
    "cities"
    (push-path "dc"
               (dc:index))))

(define (cities)
  (list
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

(define (add-a-city-page)
  (page cities/add-a-city.html
    (normal-content)))

(define (add-a-city-card)
  (card
    (card-body
      (card-title "Your city can too!")
      (link-to (add-a-city-page)
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

(define (city-search-page)
  (page city-search-path
        (normal-content
          (color-change-style)
          (h1 "Cities that Went Meta")
          (row
            (col-4
              (add-a-city-card))
            (col-4
              (index-page->city-card 
                "Washington, D.C."
                (cities/dc:index)))))))

