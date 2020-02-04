#lang at-exp racket

(provide training
         training-top)

(require metacoders-dot-org-lib
         (except-in metapolis-stories site)
         website/impress
         website/bootstrap
         (only-in stories/base place-name)
         "./common.rkt"
         mc-classmaps
         mc-languages)

;TESTING -- run this file to see training live
;does not work currently

#|(module+ main
  (render (list
            (impress-files)
            (bootstrap-files)
            (page index.html
                  (normal-content
                    (training))))
          #:to "out"))|#

;TODO: This file combines some stuff that could be separated to make things clearer.
; The (book) function is assembled here, but there's also a bunch of stuff about how it gets displayed.
; Those two things could be pulled apart.

(define (training)
  (list 
    (language-pages)
    (page coaches/maps.html
      (normal-content
       (page-content (classmaps-index))))
    (impress-files)
    (training-top)
    (training-ch 1)
    (training-ch 2)
    (training-ch 3)
    (training-ch 4)
    (training-ch 5)
    (training-ch 6)
    (training-ch 7)
    (training-ch 8)
    (training-ch 9)
    (appendix)))

(define (language-pages)
 (sub-site "languages"
   (languages-pages #:wrap-content normal-content)))


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

(define (quest/assess-book . chs)
  chs)

(define (quest/assess-chapter q a h)
  (list 
    (quest q) 
    (container 
      ;A hack to push the footer off the screen.
      ;  Can remove if we figure out how to steal the main scrollbar back from impress -- which automatically hides it.  TODO: Look into whether impress really needs to do that and whether it can be overriden easily 
      style: (properties padding-bottom: 100)
      (div class: "card-group" 
                 (assess a)
                 (hints h)))))

(define (book-chapter b n)
  (define coming-soon
    (p "Coming soon"))

  (if (>= n (length b))
    (quest/assess-chapter coming-soon coming-soon coming-soon)
    (list-ref b n)))

(define (normal-quest/assess-chapter stops fc-name)
  (quest/assess-chapter 
    (metapolis-quest stops)
    (flash-cards fc-name)
    (usual-hints stops)))


(require (prefix-in ch0: "./training/ch0.rkt"))
(require (prefix-in ch1: mc-coach-training/books/book-1/chapter-1))
(require (prefix-in ch2: mc-coach-training/books/book-1/chapter-2))
(require (prefix-in ch3: mc-coach-training/books/book-1/chapter-3))
(require (prefix-in ch4: mc-coach-training/books/book-1/chapter-4))
(require (prefix-in ch5: mc-coach-training/books/book-1/chapter-5))
(require (prefix-in ch6: mc-coach-training/books/book-1/chapter-6))
(require (prefix-in ch7: mc-coach-training/books/book-1/chapter-7))
(require (prefix-in ch8: mc-coach-training/books/book-1/chapter-8))
(require (prefix-in ch9: mc-coach-training/books/book-1/chapter-9))

(define (book)
  (quest/assess-book
    (quest/assess-chapter 
      (ch0:quest)
      (ch0:assess)
      (p "None"))

    (normal-quest/assess-chapter 
      (ch1:quest-stops)
      'chapter-1)
    (normal-quest/assess-chapter 
      (ch2:quest-stops)
      'chapter-2)
    (normal-quest/assess-chapter 
      (ch3:quest-stops)
      'chapter-3)
    (normal-quest/assess-chapter 
      (ch4:quest-stops)
      'chapter-4)
    (normal-quest/assess-chapter 
      (ch5:quest-stops)
      'chapter-5)
    (normal-quest/assess-chapter 
      (ch6:quest-stops)
      'chapter-6)
    (normal-quest/assess-chapter 
      (ch7:quest-stops)
      'chapter-7)
    (normal-quest/assess-chapter 
      (ch8:quest-stops)
      'chapter-8)
    (normal-quest/assess-chapter 
      (ch9:quest-stops)
      'chapter-9)
      ))

(define (usual-hints stops)
  (div
    (ol
      (li "Start at the " @b{@(place-name (first stops))})
      (li "Find the green icons in order: "
          (span class: "badge badge-pill badge-success"
                (~a "1 of " (length stops))))
      (li "There are " (b (/ (length stops) 2)) (b " stories") " to find in this Chapter.")
      (li "Stories without these icons will not be on the test."))))


(define (training-top)
  (page coaches/training.html
        (normal-content
          (h1 "Coach Training Starts Here")

          (book-nav (book) #:current 0)

          (book-chapter (book) 0)))
          )

(define (training-ch n)
  (page (coach-training-chapter-path n)
        (normal-content
          (container class: "mt-3"
            (book-nav (book) #:current n)
            (book-chapter (book) n)))))

(define (appendix)
  (page coaches/training-appendix.html
        (normal-content
          (container class: "mt-3"
            (book-nav (book) #:current 10)
            (quest
             (h3 "Appendix")
             (p "Helpful resources:")
             (ul
              @li{@b{How do I start training?}  Our training materials are open and available to anyone.  Simply start reading this digital book, starting at the beginning.}

              @li{@b{How do I get an official MetaCoders certification?}  Usually, this is by invitation only -- i.e. we've hired you as a MetaCoders coach.  We'll assess your knowledge, grade your submissions, coach you along the way, and grant you a certification at the end. }

              @li{@b{How do I submit my assessments to MetaCoders}  If you've been accepted as a MetaCoders coach-in-training, you will upload your assessment video to YouTube and email us a link at @(a href: "mailto:training@metacoders.org" "training@metacoders.org").}

              @li{@b{How do I get a certification if I'm @i{not} employed by MetaCoders?} You'll need to contact us at @(a href: "mailto:training@metacoders.org" "training@metacoders.org").  We occasionally make exceptions for enthusiastic people who are trying to bring MetaCoders to their city and are training in advance of an official application.}

              @li{@b{How can I find the MetaCoders in-class curriculum?} Here is a link to the basic building blocks of a MetaCoders classroom:  
                @(link-to (list "coaches" "maps.html") 
                         "Classmaps, Story Modes, and Game Modes")}

              @li{@b{How can I find the MetaCoders in-class programming languages?} Here is a link to our currently released languages:  
                @(link-to (list "languages" "index.html") 
                         "Languages")}))))))



