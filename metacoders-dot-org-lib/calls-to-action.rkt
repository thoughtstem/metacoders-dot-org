#lang at-exp racket 

(provide call-to-action-card
         coach-call-to-action
         tech-coord-call-to-action
         scientist-call-to-action
         coder-call-to-action
         enroll-call-to-action
         partner-call-to-action)

(require website/bootstrap
         "./visual-aids.rkt"
         "./paths.rkt")

(define (call-to-action-card title 
                             pitch 
                             link)
  (card
    style: (properties
             margin: 10
             height: 300)
    (card-body
      (card-title title)
      (card-text pitch)
      link)))

(define (coach-call-to-action)
  (call-to-action-card
    (span 
      (coach-circle)
      "Become a Coach")
    @p{You can apply to be @b{hired as a MetaCoders coach}, being paid to teach local kids how to code and how to apply the benefits of coding to improve your own life from day one.} 
    (link-to coaches-top-path
             "Learn More")))

(define (tech-coord-call-to-action)
  (call-to-action-card
    (span 
      (tech-coordinator-circle)
      "Become a Tech Coordinator")
    @p{You can apply to be @b{hired as MetaCoders technology coordinator}, charging computers in your house for local MetaCoders coaches to pick up on their way to class.} 
    (link-to tech-coords-top-path
             "Learn More")))

(define (scientist-call-to-action)
  (call-to-action-card
    (span 
      (scientist-circle)
      "Volunteer as a Scientist")
    @p{You don’t need a science background to @b{ learn the learning sciences} and help ensure that MetaCoder classes are of the highest quality. All you need is free time and a clipboard.}
    (link-to scientists-top-path
             "Learn More")))


(define (coder-call-to-action)
  (call-to-action-card
    (span 
      (coder-circle)
      "Code to teach Coding")
    @p{You can help @b{code educational software} that MetaCoders uses in classes.}
    (link-to coders-top-path
             "Learn More")))


(define (partner-call-to-action)
  (call-to-action-card
          (span
            (location-circle)  
            "Register a Location")
          @p{You can apply to @b{list a public location} you manage (i.e. a local school, art studio, etc.) as a MetaCoders classroom.}
          (link-to partners-top-path
                   "Learn More")))

(define (enroll-call-to-action)
  (call-to-action-card
    (span
      (kid-circle)  
      "Enroll Kids")
    @p{You can @b{enroll children} in local classes and summer camps – applying for scholarships based on need.} 
    (link-to city-search-path 
             "Learn More")))
