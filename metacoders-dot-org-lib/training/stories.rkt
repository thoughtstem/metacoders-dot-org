#lang at-exp racket

(provide lovelace-elementary-stories 
         asp-first-day-of-class
         asp-first-day-of-class/checkin)

(require website/bootstrap 
         "./base.rkt"
         "./stories/asp-first-day-of-class.rkt")

(define (lovelace-elementary-stories)
  (list
    (asp-first-day-of-class)
    (asp-first-day-of-class/checkin) ;Auto extract linked stories?
    
    ))




