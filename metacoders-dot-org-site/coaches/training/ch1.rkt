#lang racket

(provide quest assess)

(require metacoders-dot-org-lib
         (except-in metapolis-stories site)
         "../common.rkt")

(define quest
  (metapolis-quest
    places:lovelace-elementary
    stories:lovelace-elementary-asp
    places:jacks-house
    stories:jack))

(define assess
  (flash-cards 'chapter-1-deck))

