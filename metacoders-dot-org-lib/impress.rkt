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
         (only-in 2htdp/image star text)
         "./imgs.rkt")


(define quest (make-parameter '()))

(define all-stories (make-parameter '()))


(define (place->div w h pl)
  (div
    class: "place-name-and-rect"
    'data-toggle: "tooltip"
    'data-placement: "top" 
    'title: (~a (place-name pl))
    style: (properties position: "relative"
                       width: w
                       height: h)

    (quest-item-icon pl)     

    (div 
      class: "place-rectangle"
      style: (properties width: w
                         height: h
                         border-radius: "5%"
                         background-color: 
                         (if (member pl (quest))
                           "forestgreen"
                           "black"))
      
      (card class: "show-on-present"
        style: (properties height: h
                           min-width: 200
                           min-height: 250
                           max-height: 400)
        (card-header class: "text-truncate" (h5 (place-name pl)))
        (card-body class: "h-100"
          (card-text 
            (if (member pl (quest))
              @p{There are stories here for your current quest}
              @p{There are @b{no} stories here for your current quest})))
        (card-footer class: "m-0 p-0"
         (div class: "button-group m-0 p-0"
          (button-danger 
            style: (properties border-radius: "0 0 0 0.18rem")
            class: "col-sm-6" 'onClick: @~a{setTimeout(()=>{impress().goto("top")},2)} "Exit")
          (button-success 
            style: (properties border-radius: "0 0 0 0.18rem")
            class: "col-sm-6" "Enter")))
        ))))

(define (place-id pl)
  (string->node-id (place-name pl)))

(define (story-id pl)
  (string->node-id (story-name pl)))

(define (place-middle pl)
  (posn-scale 0.5
              (posn-add (place-posn pl)
                        (place-posn2 pl))))


(define s 100)

(define (place->step-posn pl)
  (posn (* s (posn-x (place-middle pl)))  
        (* s (posn-y (place-middle pl)))))

(define (place->level pl)
  (define h (* s (place-height pl)))
  (define w (* s (place-width pl)))   

  (define parent
    (node 
      (posn-x (place->step-posn pl))
      (posn-y (place->step-posn pl))
      (place->div w h pl)))

  (define landing-node
    (node 
      #:id (place-id pl)
      0 200 ;Adjust for content-window height...
      (content-window
        (quest-item-icon pl)  
        (h3 (place-name pl))

        (place-data pl))))

  (define reader-id
    (~a "story-reader-" (place-id pl)))

  (define stories-here
   (filter-stories-by-place (all-stories) pl))

  (define story-nav-node
    (node 600 200
          (content-window
           (h2 "Story Table of Contents")
           (if (empty? stories-here)
            (p "No stories here at this time.  Look elsewhere!")
            (map (curryr story->story-preview reader-id)
             stories-here)))))

  (define story-reader-node
    (node 1300 200
          (div
             style: (properties height: "500px"
                                width: "700px"
                                'overflow-y: "auto")
            (div class: "p-3" id: reader-id ))))

    (level
      parent
      (ring
        landing-node
        story-nav-node
        story-reader-node)) )

(define (story->story-preview s target-for-full)
  (div
    style: (properties width: 500)
    (story-preview s target-for-full)))

(define (content-window . content)
  (div
    style: (properties height: "400px"
                       width: "500px"
                       'overflow-y: "auto")
    content))

(define (reduce-h h)
  (define hs (list h1 h2 h3 h4 h5 h6))   
  (define i (add1 (index-of hs h)))

  (list-ref hs (min i (sub1 (length hs)))))


(define (dump d)
  (~s
    (regexp-replaces 
      (with-output-to-string (thunk (output-xml d)))
      '([#rx"\n" ""]))))

(define (story-data-and-links s target-for-full)
  (list
    (h3 (quest-item-icon s)     
        (story-name s))
    (story-data s)
    (expandable-linked-stories s h3)))

(define (expandable-linked-stories s h)
  (when (not (empty? (story-links s)))
    (list
      (hr)
      (map (curryr story-expand (reduce-h h)) 
           (story-links s)))) )

(define (show-in-reader-link wrap target-for-full s)
  (define id (gensym 'hidden-story))
  (list
    (template id: id 
          (story-data-and-links s target-for-full))
    (a 'data-toggle: "collapse" href: (~a "#collapse-" (story-name s)) 'aria-expanded: "false" 'aria-controls: "collapseExample" 'onClick: (show-story-js target-for-full id s) 
       (wrap (story-name s))))
  )

(define (show-story-js target-for-full id s)
 @~a{
    document.getElementById("@target-for-full").innerHTML = "";
    document.getElementById("@target-for-full").appendChild(document.importNode(document.getElementById("@id").content, true)); 
    @(update-quest-bar (story-id s));})

(define (expand-link wrap s)
  (a 'data-toggle: "collapse" href: (~a "#expand-collapse-" (story-name s)) 'aria-expanded: "false" 'aria-controls: "expand-collapseExample" 'onClick: (update-quest-bar (story-id s)) 
     (wrap (story-name s))))

(define (preview-linked-stories s target-for-full h)
  (when (not (empty? (story-links s)))
    (list
      (hr)
      (p "Sub-stories:")
      (map (curryr story-preview target-for-full (reduce-h h)) 
           (story-links s)))))

(define (story-preview s target-for-full (h h3))
  (local-require (only-in gregor ~t))
  (card
    class: "story-card"
    (card-body 
      (card-text
        (quest-item-icon s)     

        (show-in-reader-link h target-for-full s)
        
        (card-subtitle
          (~t (time-start (story-time s))
              "E, MMMM d h:mm a"))

        (div class: "collapse" id: (~a "collapse-" (story-name s))
             (div 
               (p "Read the full story to the right: " (i class: "fas fa-arrow-right"))
               (preview-linked-stories s target-for-full h) )) ))))

(define (story-expand s (h h3))
  (local-require (only-in gregor ~t))
  (card
    class: "story-card"
    (card-body 
      (card-text
        (quest-item-icon s)     

        (expand-link h s)
        
        (card-subtitle
          (~t (time-start (story-time s))
              "E, MMMM d h:mm a"))

        (div class: "collapse" id: (~a "expand-collapse-" (story-name s))
             (div 
               (story-data s)
               (expandable-linked-stories s h) )) ))))


(define (impress-metapolis #:quest (qs (list)))
  (parameterize ([all-stories (append (filter story? qs)
                                      (all-stories))])
    (define (metapolis? p)
      (string=? (string-downcase (place-name p)) "metapolis"))

    (define steps 
      (list
        (step 
          #:x 4000 #:y 2500 #:scale 10
          id: "top")

        #; ;Pretty, but makes the zoom animations jittery :(
        (step 
          #:x 4000 #:y 2500 #:scale 10
          id: "river"
          (img src: (pathify (add-path-prefix river-img-path))))
        (parameterize ([quest qs])
          (with-depth 10
                      (ring->steps
                        (apply ring
                               (map place->level 
                                    (filter-not metapolis? places:all))))))))

    (list

      (style/inline type: "text/css"
                    @~a{
                    #impress .show-on-present {visibility:hidden}
                    #impress .present .show-on-present {visibility:visible}

                    #impress .present .place-name-and-rect .place-name { display:none }
                    })

      (div 
        style: (properties cursor: "pointer")
        (impress 
          #:transition-duration 1000
          #:body-scrollbar? #t
          steps))

      (update-quest-bar-on-visits (map get-id qs)))))

(define (update-quest-bar id)
  @~a{
    window.nodes_to_visit = window.nodes_to_visit || 
    @(empty-js-quest-visited-hash (map get-id (quest)));
    window.nodes_to_visit["@id"] = true;
    var vals    = Object.values(window.nodes_to_visit);
    var trues   = vals.filter((v)=>v);
    var percent = Math.floor((trues.length / vals.length) * 100);

    document.getElementById("quest-completion-bar").style.width = percent + "%";
    document.getElementById("quest-completion-bar").innerHTML = percent + "%";
  })

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
    [else 
      (displayln x)
      (error "Only places and stories can be quest stops")]))

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

(define (quest-item-index s)
  (index-of (quest) s))

(define (quest-item-icon s)
  (define i (quest-item-index s))
  (when i
    (div class: "badge badge-pill badge-success"
           (~a (add1 i) " of " (length (quest))))))



