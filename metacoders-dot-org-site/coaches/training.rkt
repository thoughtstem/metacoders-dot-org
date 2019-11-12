#lang at-exp racket

(provide training
         training-top)

(require metacoders-dot-org-lib
         (except-in metapolis-stories site)
         website/impress
         "./common.rkt")

(define (training)
  (list 
    (impress-files) ;Hmmm misplaced...
    (training-top)
    (training-ch1)
    (training-ch2)))


;Move to lib...

(define (quest . content)
  (container
    (card
      (card-header
        (div 
          style: (properties
                   float: "left") 
          "Quest")
        (div 
          style: (properties
                   padding: 5
                   width: "90%"
                   float: "left")
          (quest-completion-bar 0)))
      (card-body
        (div
          style: (properties height: 500)
          content)))))

(define (assess . content)
  (card
    (card-header "Assess")
    (card-body
      (div content))))

(define (hints . content)
  (card
    (card-header "Hints")
    (card-body
      (div content))))

(require (prefix-in ch0: "./training/ch0.rkt"))
(require (prefix-in ch1: "./training/ch1.rkt"))

(define (quest/assess-book . chs)
  chs)

(define (quest/assess-chapter q a h)
  (list 
    (quest q) 
    (container (div class: "card-group" 
                 (assess a)
                 (hints h)))))

(define (book-chapter b n)
  (define coming-soon
    (p "Coming soon"))

  (if (>= n (length b))
    (quest/assess-chapter coming-soon coming-soon coming-soon)
    (list-ref b n)))

(define book
  (quest/assess-book
    (quest/assess-chapter 
      ch0:quest
      ch0:assess
      (p "None"))

    (quest/assess-chapter 
      ch1:quest
      ch1:assess
      ch1:hints)
    
    ))


(define (training-top)
  (page coaches/training.html
        (normal-content
          (h1 "Coach Training Starts Here")

          (book-nav book #:current 0)

          (book-chapter book 0))))

(define (training-ch1)
  (page (coach-training-chapter-path 1)
        (normal-content
          (h1 "Chapter 1")

          (book-nav book #:current 1)
          (book-chapter book  1))))

(define (training-ch2)
  (page (coach-training-chapter-path 2)
        (normal-content
          (h1 "Chapter 2")

          (book-nav book #:current 2)
          (book-chapter book  2))))










