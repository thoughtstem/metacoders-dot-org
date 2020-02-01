#lang at-exp racket

(provide quest assess)

(require metacoders-dot-org-lib
         website/impress
         impress
         "../common.rkt")

(module+ main
  (render (list
            (impress-files)
            (bootstrap-files)
            (page index.html
                  (normal-content
                    (quest))))
          #:to "out"))

(define (half n) (/ n 2))



(define (video-card title youtube-id #:additional-resources [additional-resources #f]) ; 
  (card
    (card-text
      (card-body
        (card-title title)
        (yt youtube-id)
        additional-resources
        ))))

(define (click-me)
  (level
    (node 0 0
          (h5 
            style: (properties width: 200) ;testing, upped from 100
            "It begins with a click..."))
    (nice)))

(define (nice)
  (ring
    (node 0 0
          #:id "nice"
          (div
            style: (properties width: 200) ;testing, upped from 100
            (h5 "Nice!!")
            (p class: "show-on-present" 
               "Click me again to back up...")))
    
    (now-click-me)))

(define (now-click-me)
  (level
    (node 200 200
          (div
            style: (properties width: 300) 
            (h5 "Click me to go on...")
            (p 
              class: "show-on-present"
              "Great!  Now that you've centered on me, click again to enter." )))
   
    (clicking-explanation)
    
    ))

(define (clicking-explanation)
  (ring
    (tip-node 0 0
              (div
                (p "Once centered on a node, clicking again will always do one of three things:")
                (ol
                  (li (b "Zoom in") " to a new level.")
                  (li (b "Zoom out") " to the previous level.")
                  (li "Nothing!"))
                (hr)
                (p "If you're not sure, just click to find out!")))

    (easter-egg-node 200 0
      (find-the-video))))

(define (easter-egg-div (msg "click to enter"))
  (div
    style: (properties 
             text-align: "center"
             width: 100
             margin: "auto")
    (div
      style: (properties 
               vertical-align: "middle"
               text-align: "center"
               'line-height: 50
               margin: "auto"
               width: 50
               height: 50
               border-radius: "50%"
               color: "white" 
               background-color: "black")
      "?")
    (p class: "show-on-present"
       msg)))

(define (easter-egg-node x y (ring #f))
  (define egg
    (node x y
          (div 
            style: 
            (properties
              width: 100
              text-align: "center")
            (easter-egg-div))))
  
  (if ring
    (level egg ring) 
    egg))

(define (empty-egg (msg "Nothing here!"))
  (ring
    (node 0 0
          (h5 
            style: (properties width: 100)
            msg))))

(define (find-the-video)
  (ring
    (node 0 0
          #:id "video-hunt"
          (div
            (h5 
              style: (properties width: 100)
              "Now a test")
            (p "Can you find the video?")))

    (node 200 0
          (h5 "East"))

    (node 400 0
          (h5 "Farther East..."))

    (node 600 0
          (h5 "Farther East..."))

    (easter-egg-node 800 0
                     (empty-egg "Nope... Keep searching for the video."))

    (node -200 0
          (h5 "West"))

    (node -400 0
          (h5 "Farther West..."))

    (node -600 0
          (h5 "Even Farther West..."))

    (easter-egg-node -800 0
                     (empty-egg "Nice try!  But no video."))

    (node 0 200
          (h5 "South"))

    (node 0 400
          (h5 "Farther South..."))

    (node 0 600
          (h5 "Even Farther South..."))

    (easter-egg-node 0 800
                     (empty-egg "Hmmm.  No video here."))

    (node 0 -200
          (h5 "North"))

    (node 0 -400
          (h5 "Farther North..."))

    (node 0 -600
          (h5 "Even Farther North..."))

    (easter-egg-node 0 -800
                     (video-explanation))))

(define (video-explanation)
  (ring
    (node 0 0
          #:id "intro-video"
          (video-card "Welcome" "_HrFOOFGGrg"))
    
    (easter-egg-node 400 0
                     (now-some-tips))))


(define (tip-node x y . content)
  (node x y
        (div
          (h5 "Here's a tip...")
          (div
            class: "show-on-present"
            style: 
            (properties margin-left: 10
                        width: 300)
            content))))

(define (now-some-tips)
  (ring
    (node 0 0
          #:id "tips"
          (h5 "Now, some more advice..."))

    (tip-node 0 -200
              (p "To jump back the top level of a quest, use the chapter navigation -- which looks like this:")
              (book-nav #:current 0
                        (range 2))
              (p "Challenge! Can you find your way back here after clicking \"Intro\"?"))

    (tip-node -200 0
              (p
                "Your browser's back button moves backward in time to the location you were last."))

    (easter-egg-node 200 0
                     (the-end))

    (level
      (tip-node 0 ;There's some kind of bug in my impress lib.  0 should work here (and is what I want), but something about the other nodes in this ring causes this one to not be where it should when the x value is zero.  But an x value of one is correctly positioned and (visually speaking) close enough.  Annoying though...
                200
                (div
                  (p "Quest assessments look like this:")
                  (flash-cards 'intro-deck)
                  (hr)
                  (p "They are mandatory if you are employed by MetaCoders.  Otherwise, they are bonus.")
                  (easter-egg-div
                    "click again to learn more")))
      (ring
        (node 0 0
              #:id "assessment-video"
              (video-card
                "Learn How to Assess"  
                "2E8EaVZDFPM"
                ))

        
        (node 0 260
              #:id "assessment-video-tips"
              (div
               style: (properties width: 500)
               (h5 "Steps to Assess:")
               (ol
                (li "Install & open DrRacket")
                (li "Open Package Manager (File > Package Manager)")
                (li "Install " (i (b "mc-coach-assess")))
                (li "Copy & paste the Assess code on the bottom of the chapter page into the left (or top) panel")
                (li "Run the " (inline-pre "view-deck") " line until ready to test")
                (li "Record your screen and voice as you run and talk through the " (inline-pre "test-with-deck"))
                (li "When completed successfully, submit your video by emailing a youtube link or google drive upload to your training coach!"))))))))

(define (the-end)
  (ring
    (node 0 0
          (div
            style: (properties width: 200)
            (h1 "The End?")
            @p{There's one more tip @(i class: "fas fa-arrow-right")}))

    (tip-node 200 0
              (p "Ready for Chapter 1? Do it!")
              (book-nav #:current 1 (range 2))
              (p  "Worried you missed something? Assess yourself.")
              (p "Don't know how to assess yourself? You missed something. :)")     
              )))

(define (quest)
  (div
    ;class: "jumbotron"
    style: (properties height: 450
                       width: "100%"
                       overflow: "hidden"
                       position: "relative"
                       cursor: "pointer")
    (style/inline type: "text/css"
      "#impress .present .show-on-present {display:block}"            
      "#impress .show-on-present {display:none}"
      "#impress .step {opacity:0.3}"
      "#impress .step.present {opacity:1}")
    (impress
      #:transition-duration 300
      #:body-scrollbar? #t
      (with-depth 3
                  (ring->steps
                    (ring
                      (click-me)))))
    (update-quest-bar-on-visits
      (list "nice" 
            "video-hunt"
            "intro-video" 
            "assessment-video"
            "tips"))))

(define (assess)
 (flash-cards 'intro))



