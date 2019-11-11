#lang at-exp racket

(provide checkout-success)
(require metacoders-dot-org-lib)

(define (checkout-success)
  (page checkout-success-top-path
        (normal-content
          (h1 "Checkout Success")
          (p "You will receive an email shortly.")
          (p "The email will link you to a form where you will need to enter the student's information.")
          )))
