#lang at-exp racket

(provide checkout-fail)
(require metacoders-dot-org-lib)

(define (checkout-fail)
  (page checkout-fail-top-path
        (normal-content
          (h1 "Checkout Fail")
          (p "Something went wrong, please try again")
          )))
