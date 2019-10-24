#lang racket

(provide metacoders.org)

(require website/bootstrap
         metacoders-dot-org-lib 
         "./index.rkt"
         "./learn-more.rkt"
         "./get-to-work.rkt"
         "./city-search.rkt"
         
         "./coaches.rkt"
         "./tech-coords.rkt"
         "./scientists.rkt"
         "./coders.rkt"
         "./partners.rkt")

(define (metacoders.org)
  (flatten
    (list
      (bootstrap-files)    
      (css)
      (imgs)
      (index)
      (learn-more)
      (get-to-work) 
      (city-search-page)
      (cities)
      (coaches)
      (tech-coords)
      (scientists)
      (coders)
      (partners) )))
