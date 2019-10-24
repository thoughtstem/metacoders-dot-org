#lang at-exp racket

(provide get-to-work)

(require metacoders-dot-org-lib)

(define (get-to-work)
  (page get-to-work-path
        (normal-content
          (h1 "The Four Ways You Can Help")
          (four-ways-to-work-with-metacoders))))

(define (four-ways-to-work-with-metacoders)
  (list
    (row
      (col-6
        (coach-call-to-action))
      (col-6
        (tech-coord-call-to-action)))

    (row
      (col-6
        (scientist-call-to-action))
      (col-6
        (coder-call-to-action)))))

