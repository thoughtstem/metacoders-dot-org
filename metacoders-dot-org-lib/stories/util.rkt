#lang racket

(provide render-story render-story-link)

(require metacoders-dot-org/metacoders-dot-org-lib/stories-lib/rendering)

(require "./setting.rkt")

(define (the-map highlight)
  (write-img
    (render-city
      #:highlight highlight
      (metapolis))))

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
