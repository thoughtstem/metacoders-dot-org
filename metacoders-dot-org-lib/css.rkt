#lang racket

(provide css
         testimonial-quotes.css
         )

(require website/bootstrap
         racket/runtime-path)

(define-runtime-path css-path "css")

(define (css)
  (list testimonial-quotes.css
        ))

(define testimonial-quotes.css
  (page css/testimonial-quotes.css
        (file->string (build-path css-path "testimonial-quotes.css"))))
