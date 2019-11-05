#lang at-exp racket

(provide training
         training-top)

(require metacoders-dot-org-lib
         website/impress)

(define (training)
  (list 
    (impress-files)
    (training-top)))

(define (quest)
  (container
    (h3 "Quest")
    (div
      style: (properties border: "1px solid black"
                         width: "100%"
                         height: "500px"
                         overflow: "hidden"
                         position: "relative")
      (impress-metapolis))))

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

          (quest/assess)
          )))
