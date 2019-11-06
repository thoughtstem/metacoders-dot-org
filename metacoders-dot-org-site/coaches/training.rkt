#lang at-exp racket

(provide training
         training-top)

(require metacoders-dot-org-lib
         (except-in metapolis-stories site)
         website/impress)

(define (training)
  (list 
    (impress-files) ;Hmmm misplaced...
    (training-top)
    (training-ch1)
    (training-ch2)))


;Move to lib...

(define (quest . content)
  (container
    (h3 "Quest")
    (div
      style: (properties height: 500)
      content)
    
    ))

(define (assess . content)
  (container
    (h3 "Assess")
    (div
      style: (properties height: 500)
      content)))

(require (prefix-in ch0: "./training/ch0.rkt"))
(require (prefix-in ch1: "./training/ch1.rkt"))

(define (quest/assess-book . chs)
  chs)

(define (quest/assess-chapter q a)
  (list 
    (quest q) 
    (assess a)))

(define (book-chapter b n)
  (define coming-soon
    (p "Coming soon"))

  (if (>= n (length b))
    (quest/assess-chapter coming-soon coming-soon)
    (list-ref b n)))

(define book
  (quest/assess-book
    (quest/assess-chapter 
      ch0:quest
      ch0:assess)
    (quest/assess-chapter 
      ch1:quest
      ch1:assess)))

(define (book-nav)
  (page-nav 
    (link-to 
      #:element page-link
      "#"
      "Previous")
    (link-to 
      #:element page-link
      (training-ch1)
      "1")

    (link-to 
      #:element page-link
      (training-ch2)
      "2")

    (link-to 
      #:element page-link
      "#"
      "3")
    
    (link-to 
      #:element page-link
      "#"
      "Next")))

(define (training-top)
  (page coaches/training.html
        (normal-content
          (h1 "Coach Training Starts Here")

          (book-nav)

          (book-chapter book 0))))

(define (training-ch1)
  (page coaches/training-ch1.html
        (normal-content
          (h1 "Chapter 1")

          (link-to 
            (training-ch2)
            (button-primary "Chapter 2"))

          (book-chapter book 1))))

(define (training-ch2)
  (page coaches/training-ch2.html
        (normal-content
          (h1 "Chapter 2")

          (book-chapter book 2))))










