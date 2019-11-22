#lang racket

(provide city-search-page
         cities)

(require metacoders-dot-org-lib)
(require (only-in pict scale text filled-rectangle cc-superimpose colorize))

; --- require cities and define index
(require (prefix-in dc: metacoders-dot-org-dc-site))
(require (prefix-in reno: metacoders-dot-org-reno-site))
(require (prefix-in dallas: metacoders-dot-org-dallas-site))
(require (prefix-in temecula: metacoders-dot-org-temecula-site))
(require (prefix-in minneapolis: metacoders-dot-org-minneapolis-site))
(require (prefix-in poway: metacoders-dot-org-poway-site))
(require (prefix-in chula-vista: metacoders-dot-org-chula-vista-site))

(define (cities/dallas:index)
  (push-path 
    "cities"
    (push-path "dallas"
               (dallas:index))))

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

(define (cities/temecula:index)
  (push-path 
    "cities"
    (push-path "temecula"
               (temecula:index))))

(define (cities/minneapolis:index)
  (push-path 
    "cities"
    (push-path "minneapolis"
               (minneapolis:index))))

(define (cities/poway:index)
  (push-path 
    "cities"
    (push-path "poway"
               (poway:index))))

(define (cities/chula-vista:index)
  (push-path 
    "cities"
    (push-path "chula-vista"
               (chula-vista:index))))

(define (cities)
  (list
   (push-path "cities" 
              (push-path "dallas" (dallas:pages)))
   (push-path "cities" 
              (push-path "reno" (reno:pages)))
   (push-path "cities" 
              (push-path "dc" (dc:pages)))
   (push-path "cities" 
              (push-path "temecula" (temecula:pages)))
   (push-path "cities" 
              (push-path "minneapolis" (minneapolis:pages)))
   (push-path "cities" 
              (push-path "poway" (poway:pages)))
   (push-path "cities" 
              (push-path "chula-vista" (chula-vista:pages)))))
; -----------------------------------

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
                         (index-page->banner-img index-page)
                         background-position: "center"
                         background-size: "cover"))
    (link-to index-page
       (card-footer class: "text-center p-0"
                    style: (properties background-color: "transparent"
                                       border-top: "none")
        (button-light class: "btn-block p-3 text-primary"
                      style: (properties display: "inline-block"
                                         border-radius: "0 0 0.18rem 0.18rem")
                      (h5 class: "m-0" title)))
      ;(card-body
      ;  (card-title title))
      )))

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
                      background-image: (string-append "url(" (prefix/pathify world-img-path) ")")
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
                    (h1 "Cities That Went Meta")
                    (h6 "MetaCoders is expanding rapidly throughout the world.
")))))

(define (cities-section)
  (jumbotron  class: "mb-0 text-center"
              style: (properties background: "white")
              (container
               (h2 "MetaCoders is excited to bring coding education to:")
               (br)
               (responsive-row #:columns 3
                               (index-page->city-card 
                                "Chula Vista, CA"
                                (cities/chula-vista:index))
                               (index-page->city-card 
                                "Dallas, TX"
                                (cities/dallas:index))
                               (index-page->city-card 
                                "Minneapolis, MN"
                                (cities/minneapolis:index))
                               (index-page->city-card 
                                "Poway, CA"
                                (cities/poway:index))
                               (index-page->city-card 
                                "Reno, NV"
                                (cities/reno:index))
                               (index-page->city-card 
                                "Temecula, CA"
                                (cities/temecula:index))
                               (index-page->city-card 
                                "Washington, D.C."
                                (cities/dc:index))))))

(define (learn-more-section)
  (jumbotron  class: "mb-0 text-center"
              (container
               (h2 "If you don't see your city listed, you can still go meta.")
               (br)
               (p "MetaCoders would love to come to your community and can do it with your help.")
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

