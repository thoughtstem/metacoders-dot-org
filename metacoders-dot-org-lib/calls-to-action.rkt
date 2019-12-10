#lang at-exp racket 

(provide call-to-action-card
         coach-call-to-action
         tech-coord-call-to-action
         scientist-call-to-action
         coder-call-to-action
         donate-call-to-action
         join-our-team-call-to-action
         enroll-call-to-action
         partner-call-to-action)

(require website/bootstrap
         "./visual-aids.rkt"
         "./paths.rkt")

(define (learn-more-button)
  (button-primary class: "btn-block"
                  style: (properties display: "inline-block"
                                     border-radius: "0 0 0.18rem 0.18rem"
                                     )
                  "Learn More"))

(define (call-to-action-card title 
                             pitch 
                             link)
  (card class: "h-100"
    ;style: (properties
    ;         margin: 10
    ;         height: 300)
    (card-header (h5 class: "m-0" title))
    (card-body
      ;(card-title title)
      (card-text pitch)
      )
    (card-footer class: "text-center p-0"
                 style: (properties background-color: "transparent"
                                    border-top: "none")
                 link)
    ))

(define (coach-call-to-action)
  (call-to-action-card
    (span 
      "Become a Coach")
    @list{You can apply to be
         @b{hired as a MetaCoders coach}, being paid to teach local kids
         how to code and how to apply the benefits of coding to improve your own life from day one.}
    (link-to coaches-top-path
             (learn-more-button))))

(define (tech-coord-call-to-action)
  (call-to-action-card
    (span 
      "Become a Tech Coordinator")
    @list{You can apply to be @b{hired as MetaCoders technology coordinator}, charging computers in your house for local MetaCoders coaches to pick up on their way to class.} 
    (link-to tech-coords-top-path
             (learn-more-button))))

(define (scientist-call-to-action)
  (call-to-action-card
    (span 
      "Volunteer as a Scientist")
    @list{You don’t need a science background to @b{ learn the learning sciences} and help ensure that MetaCoder classes are of the highest quality. All you need is free time and a clipboard.}
    (link-to scientists-top-path
             (learn-more-button))))

(define (donate-call-to-action)
  (call-to-action-card
    (span 
      "Donate")
    @list{Help us provide coding education to children nationwide at the most affordable price possible. Your donations @b{help subsidize the cost of classes} for everyone, but especially families in need of financial assistance.}
    (link-to donate-path
             (learn-more-button))))

(define (join-our-team-call-to-action)
  (call-to-action-card
    (span 
      "Join Our Team")
    @list{You can apply to be hired as a @b{MetaCoders coach}, being paid to teach local kids how to code, or as a @b{Technology Coordinator}, charging computers in your house for local MetaCoders coaches to pick up on their way to class.}
    (link-to join-our-team-path
             (learn-more-button))))


(define (coder-call-to-action)
  (call-to-action-card
    (span 
      "Code to Teach Coding")
    @list{You can help @b{code educational software} that MetaCoders uses in classes. With your help, we can @b{inspire more students to become software developers} and engineers, solving the problems of the future!}
    (link-to coders-top-path
             (learn-more-button))))


(define (partner-call-to-action)
  (call-to-action-card
          (span
            "Register a Location")
          @list{You can apply to @b{list a public location} you manage (i.e. a local school, art studio, etc.) as a MetaCoders classroom. Help spread computer science education by sharing your space!}
          (link-to partners-top-path
                   (learn-more-button))))

(define (enroll-call-to-action)
  (call-to-action-card
    (span
      "Enroll Your Children")
    @list{You can @b{enroll children} in local coding classes and summer camps in your area. Don't forget to invite your friends! Why? Because @b{coding is always more fun with friends}, and when you're having fun, you learn better!} 
    (link-to city-search-path 
             (learn-more-button)))
  )
