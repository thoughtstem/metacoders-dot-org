#lang at-exp racket

(provide training
         training-top)

(require metacoders-dot-org-lib
         (except-in metapolis-stories site)
         website/impress)

(define (training)
  (list 
    (impress-files)
    (training-top)))

(define (quest)
  (container
    (h3 "Quest")
    (div
      style: (properties width: "100%"
                         height: "500px"
                         overflow: "hidden"
                         position: "relative")
      (impress-metapolis
        #:quest
        (list  
          places:lovelace-elementary  
          stories:asp-first-day-of-class  
          places:jacks-house
          stories:jack)))))

(define (assess)
  (container
    (h3 "Assess")
    (code 
      "#lang meta-cards"
      (br)
      (br)
      "(print \"Hello\")")))

(define (quest/assess)
  (list
    (quest)
    (assess)))

(define (training-top)
  (page coaches/training.html
        (normal-content
          (h1 "Coach Training Starts Here")

          (quest/assess))))
