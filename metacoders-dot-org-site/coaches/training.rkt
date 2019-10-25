#lang at-exp racket

(provide training
         training-top)

(require metacoders-dot-org-lib
         metacoders-dot-org-lib/training/pages)

(define (training)
  (list 
    (training-top)
    (training-stories)))

(define (training-top)
  (page coaches/training.html
        (normal-content
          (h1 "Coach Training Starts Here")

          (h2 "Welcome to Metapolis")
          (write-img
            (render-city (metapolis)))
          
          (div
            (h2 "Places of Interest for Coaches")
            
              (link-to-place "Lovelace Elementary"
                             (lovelace-elementary-top))
              (link-to-place  "Babbage University"
                              (babbage-university-top))))))

