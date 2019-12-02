#lang at-exp racket

(require metacoders-dot-org-core-pages
         "./coaches/training.rkt")

(define (coaches+training)
  (list (coaches)
        (training)))

(provide (rename-out [coaches+training coaches]))
