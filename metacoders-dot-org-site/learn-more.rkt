#lang at-exp racket

(provide learn-more)

(require website/bootstrap
         (only-in 2htdp/image circle)
         metacoders-dot-org-lib  
         racket/runtime-path
         "./learn-more/main.rkt")

(define-runtime-path js "learn-more/js")


(define (six-ways-to-go-meta)
  (list
   (card-deck
    (enroll-call-to-action)
    (coach-call-to-action)
    (tech-coord-call-to-action))
   
    #|(row
      (col-4
        (enroll-call-to-action))
      (col-4
        (coach-call-to-action))
      (col-4
        (tech-coord-call-to-action)))|#
   (card-deck
    (partner-call-to-action)
    (scientist-call-to-action)
    (coder-call-to-action))
    #|(row
      (col-4
        (partner-call-to-action))
      (col-4
        (scientist-call-to-action))
      (col-4
        (coder-call-to-action)))|#
    ))

(define (learn-more)
  (list
    (page js/name-replace-effect.js
          (file->string (build-path js "name-replace-effect.js"))) 
    (page learn-more-path
          (normal-content
            (h1 "Learn More")
            @p{The MetaCoders concept is so simple that a single story explains it:}

            (metacoders-text-story-1)


            (h2 "Six ways to \"Go Meta\"")

            (six-ways-to-go-meta)
            (include-js "js/name-replace-effect.js")))))
