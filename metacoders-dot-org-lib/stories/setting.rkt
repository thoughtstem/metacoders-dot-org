#lang racket 

(require stories)

(define lovelace-elementary
  (place "Lovelace Elementary" 
         'classroom
         (posn 38 14)))

(define babbage-university
  (place "Babbage University" 
         'classroom
         (posn 39 19)))

(define turing-recreation-center
  (place "Turing Recreation Center" 
         'classroom
         (posn 65 33)))

(define new-hire-tc
  (person "Jack"))

(define new-hire-tc-house
  (place "Jack's House" 
         'house
         (posn 63 32)))

(define settled-tc
  (person "Kate"))

(define settled-tc-house
  (place "Kate's House" 
         'house
         (posn 18 14.5)))

(define 1-year-tc
  (person "John"))

(define 1-year-tc-house
  (place "John's House" 
         'house
         (posn 42.4 19)))


(define new-hire-c
  (person "Bruce"))

(define new-hire-c-house
  (place "Bruce's House" 
         'house
         (posn 26.5 16)))

(define settled-c
  (person "Josheph"))

(define settled-c-house
  (place "Joseph's House" 
         'house
         (posn 6 5.5)))

(define 1-year-c
  (person "Ruby"))

(define 1-year-c-house
  (place "Ruby's House" 
         'house
         (posn 56 24)))


(define (metapolis)
  (list
    lovelace-elementary
    babbage-university
    turing-recreation-center

    new-hire-tc-house        
    settled-tc-house        
    1-year-tc-house        
    new-hire-c-house        
    settled-c-house        
    1-year-c-house))









