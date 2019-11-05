#lang at-exp racket

(provide impress-metapolis)

(require (except-in website/impress site time) 
         (except-in website/bootstrap col site time)  
         (except-in 2htdp/image frame text) (prefix-in svg: website/svg)
         impress)

(require metapolis-stories
         stories
         posn
         (only-in 2htdp/image star text))

(define s 10)

(define quest (make-parameter '()))

(define (star-icon color i)
  (overlay
    (text (~a i) 12 'black)
    (star 20 'solid color)))

(define quest-items
  (list
    (star-icon 'red 1)
    (star-icon 'orange 2)
    (star-icon 'yellow 3)
    (star-icon 'green 4)
    (star-icon 'blue 5)
    (star-icon 'purple 6)))

(define (quest-item-index s)
  (index-of (quest) s))

(define (quest-item-icon s)
  (define i (quest-item-index s))
  (when i
    (write-img
      (list-ref quest-items i))))

(define (place->div w h pl)
  (div
    style: (properties position: "relative"
                       width: w
                       height: h)

    (div
      style: (properties position: "absolute")
      class: "place-name"
      (quest-item-icon pl)
      (place-name pl))

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
      (place->div (* s (place-width pl))  
                  (* s (place-height pl))  
                  pl)))

  (define landing-node
    (node 
      0 200 ;Adjust for content-window height...
      (content-window
        (h3 (quest-item-icon pl) 
            (place-name pl))
        (place-data pl))))

  (level parent 
         (ring
           landing-node
           (place->story-nodes pl))))

(define (place->story-nodes pl)
  (define stories (filter-stories-by-place stories:all pl))
  (define (story->node s y)
    (level
      (node
        (+ 300 250) y
        (div
          style: (properties width: 500)
          (story-preview s)))
      (ring 
        (node 0 0
              (content-window
                (h3 (quest-item-icon s) 
                    (story-name s))
                (story-data s))))))

  (map story->node stories (range 0 (* 100 (length stories))
                                  100)))


(define (content-window . content)
  (div
    style: (properties width: "500px"
                       height: "400px"
                       'overflow-y: "auto")
    content))

(define (story-preview s)
  (local-require (only-in gregor ~t))
  (card
    class: "story-card"
    (card-body 
      (card-title 
        (quest-item-icon s)
        (story-name s))
      (card-subtitle
        (~t (time-start (story-time s))
            "E, MMMM d h:mm a")))))

(define (impress-metapolis #:quest (qs (list)))
  (define (metapolis? p)
    (string=? (string-downcase (place-name p)) "metapolis"))

  (define steps 
    (parameterize ([quest qs])
      (with-depth 50
                  (ring->steps
                    (apply ring
                           (map place->level 
                                (filter-not metapolis? places:all)))))))

  (list
    (style/inline type: "text/css"
                  ;Place name effects
                  "#impress .place-name { transform: scale(0.5); -webkit-transform-origin: top left; color: gray; top: -10px; width: 500px;}"

                  "#impress .present .place-name { transform: scale(1); color: black; top: -20px}"

                  ;Place rectangle effects
               
                  "#impress .present .place-rectangle { border: 1px solid black; }"


                  ;After entering place

                  "#impress .place-data { opacity: 0.1; }" 
                  "#impress .present .place-data { opacity: 1; }"

                  ;Story name effects  

                  "#impress .present .story-card { transform: scale(1.1);}")
    (span "Recommended path: " (map write-img (take quest-items (length qs))))
    (div 
     style: (properties cursor: "pointer")
     (impress 
       #:transition-duration 300
       steps)))
  
  )



