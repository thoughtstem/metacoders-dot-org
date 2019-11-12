#lang at-exp racket

(provide quest assess hints)

(require metacoders-dot-org-lib
         (except-in metapolis-stories site)
         "../common.rkt")

(require (only-in stories/base story-links))

(define stops
  (list
    places:metapolis-welcome-center
    stories:welcome-story

    places:babbage-university
    stories:babbage-u-weekend-class 
    stories:babbage-u-weekend-class/midway-meeting

    places:lovelace-elementary
    stories:lovelace-elementary-asp
    stories:lovelace-elementary-asp/ch-1-stories
    stories:lovelace-elementary-asp/ch-1-stories/introduction-story
    stories:lovelace-elementary-asp/ch-1-stories/code-of-awesomeness-stories
    stories:lovelace-elementary-asp/ch-1-stories/reflection
    stories:lovelace-elementary-asp/ch-1-stories/story-sum-up

    places:turing-recreational-center

    stories:turing-rec-center-weekly-class
    stories:turing-rec-center/game-mode-introduction
    stories:turing-rec-center/game-mode-introduction/name-game
    stories:turing-rec-center/game-mode-introduction/coa-mottos
    stories:turing-rec-center/game-mode-introduction/code-game
    stories:turing-rec-center/game-mode-introduction/game-sum-up

    places:hopper-library
    stories:a-students-journey

    places:metapolis-welcome-center
    stories:welcome-sum-up))

(define (quest)
  (apply metapolis-quest stops))

(define (assess)
  (flash-cards 'chapter-1-deck))

(define (hints)
  (div
    (ol 
      (li "Start at the " @b{Welcome Center})
      (li "Find the green icons in order: "
          (span class: "badge badge-pill badge-success"
                (~a "1 of " (length stops))))
      (li "Things without icons will not be on the test."))))




