#lang at-exp racket

(provide impress-metapolis
         quest-completion-bar
         update-quest-bar-on-visits)

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
  (string->node-id (place-name pl)))

(define (story-id pl)
  (string->node-id (story-name pl)))

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
      (posn-x (place->step-posn pl))
      (posn-y (place->step-posn pl))
      (place->div (* s (place-width pl))  
                  (* s (place-height pl))  
                  pl)))

  (define landing-node
    (node 
      #:id (place-id pl)
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
              #:id (story-id s)
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
      (with-depth 5
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

    (div 
      style: (properties cursor: "pointer")
      (impress 
        #:transition-duration 300
        steps))

      (update-quest-bar-on-visits (map get-id qs))))

(define (update-quest-bar-on-visits ids)
  ;Look, Mom!  Javascript inside of Racket!
  @on-node-visit{
    window.nodes_to_visit = window.nodes_to_visit || 
    @(empty-js-quest-visited-hash ids)

    if(!window.nodes_to_visit[currentStep.id] && currentStep.id in window.nodes_to_visit){
      window.nodes_to_visit[currentStep.id] = true         

      var vals    = Object.values(window.nodes_to_visit)
      var trues   = vals.filter((v)=>v)
      var percent = Math.floor((trues.length / vals.length) * 100)

      document.getElementById("quest-completion-bar").style.width = percent + "%"
      document.getElementById("quest-completion-bar").innerHTML = percent + "%"
    } 
  })

(define (get-id x)
  (cond
    [(place? x) (place-id x)]
    [(story? x) (story-id x)]
    [else (error "Only places and stories can be quest stops")]))

(define (empty-js-quest-visited-hash ids)
  (define kvs (map (lambda (i)
                     @~a{"@i": false}) 
                   ids))

  (define joined (string-join kvs ","))

  ;We return something like this -- a js object:
  ;  {"babbage-university": false, "lovelace-elementary": false}

  ;Last step just puts the braces around it
  @~a{{@joined}} )

(define (quest-completion-bar percent)
  (div class: "progress"
       (div 
         id: "quest-completion-bar"
         class: "progress-bar bg-success"
         'role: "progressbar"
         style: (properties width: (~a percent "%"))
         'aria-valuenow: "25"
         'aria-valuemin: "0" 
         'aria-valuemax: "100" )))

(define (star-icon color i)
  (overlay
    (text (~a i) 12 'black)
    (circle 10 'solid color)))

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

