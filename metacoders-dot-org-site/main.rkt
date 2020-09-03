#lang racket

(provide metacoders.org)

(require website/bootstrap
         metacoders-dot-org-lib 
         (rename-in metapolis-stories 
                    [site metapolis-stories:site])
         "./index.rkt"
         "./learn-more.rkt"
         "./join-our-team.rkt"
         "./city-search.rkt"
         "./donate.rkt"         
         "./coaches.rkt"
         "./tech-coords.rkt"
         "./scientists.rkt"
         "./coders.rkt"
         "./volunteer-online.rkt"
         "./partners.rkt"
         "./online.rkt"
         "./coding-club.rkt"
         "./coding-for-pods.rkt"
         "./genentech.rkt"
         "./tech-ed.rkt"
         "./one-on-one.rkt"
         "./badges.rkt"
         
         "./terms-and-conditions.rkt"         
         "./setup-scripts.rkt"

         "./checkout-success.rkt"
         "./camp-checkout-success.rkt"
         "./tech-ed-checkout-success.rkt"
         
         "./donate-success.rkt"
         
         "./checkout-fail.rkt"

	 mc-social-media/blog)

(define (metacoders.org)
  (flatten
    (list
      (sub-site "metapolis"
                (metapolis-stories:site))
      (sub-site "blog" (blog))
      (bootstrap-files)    
      (css)
      (imgs)
      (index)
      (learn-more)
      (join-our-team) 
      (city-search)
      (donate)
      (cities)
      (coaches)
      (tech-coords)
      (scientists)
      (coders)
      (volunteer-online)
      (partners) 
      (online)
      (coding-club)
      (coding-for-pods)
      (genentech)
      (tech-ed)
      (terms-and-conditions)
      (sub-site "scripts"
                (setup-scripts))
      (checkout-success)
      (camp-checkout-success)
      (tech-ed-checkout-success)
      (donate-success)
      (checkout-fail)
      )))
