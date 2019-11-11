#lang racket

(provide metacoders.org)

(require website/bootstrap
         metacoders-dot-org-lib 
         (rename-in metapolis-stories 
                    [site metapolis-stories:site])
         "./index.rkt"
         "./learn-more.rkt"
         "./get-to-work.rkt"
         "./city-search.rkt"
         
         "./coaches.rkt"
         "./tech-coords.rkt"
         "./scientists.rkt"
         "./coders.rkt"
         "./partners.rkt"
         
         "./setup-scripts.rkt"

         "./checkout-success.rkt"
         "./checkout-fail.rkt")

(define (metacoders.org)
  (flatten
    (list
      (sub-site "metapolis"
                (metapolis-stories:site))
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
      (partners) 
      (setup-scripts)

      (checkout-success)
      (checkout-fail))))
