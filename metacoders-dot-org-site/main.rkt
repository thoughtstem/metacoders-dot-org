#lang racket

(provide metacoders.org)

(require website/bootstrap
         metacoders-dot-org-lib 
         "./index.rkt"
         "./learn-more.rkt"
         "./city-search.rkt")

(define (coaches)
  (page coaches-top-path
        (normal-content
          (h1 "Coaches"))))

(define (get-to-work)
  (page get-to-work-path
        (normal-content
          (h1 "Get To Work"))))

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
      (add-a-city-page)
      (cities)
      (coaches))))




