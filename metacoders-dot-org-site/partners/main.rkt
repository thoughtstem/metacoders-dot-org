#lang at-exp racket

(provide partners)
(require metacoders-dot-org-lib)

(define (partners)
  (page partners-top-path
        (normal-content
          (h1 "Partners")
          (email-signup))))
