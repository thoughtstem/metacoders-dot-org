#lang racket

;TODO: Move to bootstrap if it stays general enough...

(provide page-nav)

(require website/bootstrap)

(define/provide-extensible-element
  page-item
  li
  (class: "page-item" class-join)
  (href: "#" replace))

(define/provide-extensible-element
  pagination
  ul
  (class: "pagination" class-join))

(define/provide-extensible-element
  page-link
  a
  (class: "page-link" class-join))

(define (page-nav #:active (active-i 1) . links)
  (nav 'aria-label: "Page Navigation"
       (pagination 
         links)))
