#lang at-exp racket

(provide impress-metapolis)

(require (except-in website/impress site time) 
         (except-in website/bootstrap col site time)  
         (except-in 2htdp/image frame text)
         (prefix-in svg: website/svg)
         impress)

(require metapolis-stories
         stories
         posn)

(define s 10)

(define (place->svg w h name)
  (div
    style: (properties position: "relative"
                       width: w
                       height: h)

    (div
      style: (properties position: "absolute")
      class: "place-name"
      name)

    (div 
      class: "place-rectangle"
      style: (properties width: w
                         height: h
                         background-color: "rgba(0,0,0,0.1)"))))

(define (place-id pl)
  (urlify (place-name pl)))

(define (place-middle pl)
  (posn-scale 0.5
              (posn-add (place-posn pl)
                        (place-posn2 pl))))

(define (place->step-posn pl)
  (posn (* s (posn-x (place-middle pl)))  
        (* s (posn-y (place-middle pl)))))

(define (place->level pl)
  (define parent
    (node 
      #:id (place-id pl)
      (posn-x (place->step-posn pl))
      (posn-y (place->step-posn pl))
      (place->svg (* s (place-width pl))  
                  (* s (place-height pl))  
                  (place-name pl))))

  (define landing-node
    (node 
      0 0
      (div
        (div
          class: "place-data"
          style: (properties width: 300)
          (place-data pl)))))

  (level parent 
         (ring
           landing-node
           (place->story-nodes pl))))

(define (place->story-nodes pl)
  (define stories (filter-stories-by-place stories:all pl))
  (define (story->node s y)
     (node
      (+ 300 250) y
      (div
        style: (properties width: 500)
        ;Wrong class.. testing
        (h4 class: "place-name" (story-name s)))))

  (map story->node stories (range 0 (* 100 (length stories))
                                  100)))

(define (impress-metapolis)
  (define steps 
    (ring->steps
      (apply ring
        (map place->level places:all))))

  (list
    (style/inline type: "text/css"
                  "#impress .place-name { transform: scale(0.5); -webkit-transform-origin: top left; color: gray; top: -10px; width: 500px;}"
                  "#impress .present .place-name { transform: scale(1); color: black; top: -20px}"
                  "#impress .present .place-rectangle { border: 1px solid black; }"

                  "#impress .place-data { opacity: 0.1; }" 
                  "#impress .present .place-data { opacity: 1; }"
                  )
    (impress 
      #:transition-duration 300
      steps))
  
  )



