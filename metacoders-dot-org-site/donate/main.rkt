#lang at-exp racket

(provide donate)

(require metacoders-dot-org-lib)

(define (donate) 
  (page donate-path
    (normal-content 
      (h1 "Help Students Code Today"))))
