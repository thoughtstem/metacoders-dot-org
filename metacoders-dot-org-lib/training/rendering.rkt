#lang racket

(provide render-city
         render-story
         render-story-link
         the-map
         link-to-place)

(require "./base.rkt"
         "../html-helpers.rkt"
         2htdp/image)

;Place rendering

(define (render-city places
                     #:highlight (highlight #f)
                     (w 76) 
                     (h 48))
  (define bg (rectangle w h 'solid 'transparent))  

  (scale 5
         (overlay
           (place-images
             (map (curry place-icon
                         #:highlight highlight) 
                  places) 
             (map place-posn places) 
             bg)
           (scale 0.1
                  (bitmap/url
                    "https://ksr-ugc.imgix.net/assets/000/804/927/7638d3b979045f9e317eae552cf0ac97_original.jpg?ixlib=rb-2.1.0&w=680&fit=max&v=1375715420&auto=format&gif-q=50&q=92&s=f70187c022d2f7f9e5824d3cd2407208")))))

(define (place-icon p
                    #:highlight (highlight #f) )
  (if (and highlight
           (equal? p highlight))
    (star 3 'solid 'yellow)
    (square 1 'solid 
            (if (house? p)
              'green
              'red)))) 

;Story rendering
;  Stories render to pages

(provide story->path urlify)

(require (except-in website/bootstrap frame))

(define (urlify s)
  (string-replace
    #:all? #t
    (string-downcase s)
    " "
    "-"))

(define (story->path s)
  (define pl-name (urlify (place-name (story-place s))))
  (define title.html (urlify (~a 
                               (story-title s)
                               ".html")))

  (list pl-name title.html))

(define (render-story s)
  (define path (cons "training" (story->path s)))
  (page path
        (normal-content
          (h1 (place-name (story-place s)))
          (h2 (story-title s))
          (the-map (story-place s))
          (story-content s)
          (if (empty? (story-links s))
            '()
            (list
              (h3 "Next Stories") 
              (map render-story-link
                   (story-links s)))))))

(define (render-story-link s)
  (link-to (render-story (story-link-next-story s))
           (story-link-name s)))

(define (the-map highlight)
  (write-img
    (render-city
      #:highlight highlight
      (metapolis))))

(define (link-to-place n p)
  (div
    (link-to p n)) )
