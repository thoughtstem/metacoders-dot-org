#lang racket

(provide quest assess)

(define quest
  (metapolis-quest
    (quest-stops places:lovelace-elementary
                 stories:lovelace-elementary-asp
                 places:jacks-house
                 stories:jack)))

(define assess
  (flash-cards
    '(front back)))

