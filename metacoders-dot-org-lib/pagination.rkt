#lang racket

;TODO: Move to bootstrap if it stays general enough...

(provide page-nav)

(require website/bootstrap)


(define/provide-extensible-element
  pagination
  ul
  (class: "pagination" class-join))

(define/provide-extensible-element
  page-link
  a
  (class: "page-link" class-join))

(define/provide-extensible-element
  page-item
  li
  (class: "page-item" class-join)
  (href: "#" replace))

(define (page-nav 
          #:label (label #f)
          #:active (active-i 1) . links)
  (define flat-links (flatten links))

  (define (maybe-active-page-item link i)
    (page-item 
      class: (if (= i active-i) "active" "")
      link))

  (nav 'aria-label: "Page Navigation"
       (pagination 
         (when label
           (page-item
             class: "disabled"
             (page-link label)))
         (map 
           (curryr maybe-active-page-item)
           flat-links
           (range (length flat-links))))))








