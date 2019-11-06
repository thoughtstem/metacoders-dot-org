#lang racket

(provide quest assess)

(require metacoders-dot-org-lib
         (except-in metapolis-stories site))

;TODO: MOVE TO LIB
(define (metapolis-quest . stops)
  (div
    style: (properties width: "100%"
                       height: "500px"
                       overflow: "hidden"
                       position: "relative")
    (impress-metapolis
      #:quest
      stops)))

(define quest
  (metapolis-quest
    places:lovelace-elementary
    stories:lovelace-elementary-asp
    places:jacks-house
    stories:jack ))

(define assess
  (code 
    "#lang meta-cards"
    (br)
    (br)
    "(print \"Hello\")"))

