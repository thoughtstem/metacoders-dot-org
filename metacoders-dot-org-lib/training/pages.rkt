#lang at-exp racket 

(provide training-stories
         lovelace-elementary-top
         babbage-university-top)

(require metacoders-dot-org-lib)

;move -> lib
(define (link-to-story s)
  (link-to (render-story
             s)
           (story-title s)))


;All pages bundled for exportation

(define (training-stories)
  (list
    (lovelace-elementary-top)
    (lovelace-elementary-pages)
    
    (babbage-university-top)))



;Story pages and groups of pages

(define (place->top-page p
                         stories)
  (define path
    (list "training"
          (~a (urlify (place-name p)) ".html")))

  (page path
        (normal-content
          (h1 "You're at...")
          (h2 (place-name p))
          (the-map p) 
          (h2 (~a "Stories at " (place-name p)))
          (map link-to-story stories))))

(define (babbage-university-top)
  (place->top-page babbage-university
                   (list)))

(define (lovelace-elementary-top)
  (place->top-page lovelace-elementary
                   (list
                     (asp-first-day-of-class))))


(define (lovelace-elementary-pages)
  (map 
    render-story 
    (lovelace-elementary-stories)))


