#lang at-exp racket

(provide donate)

(require metacoders-dot-org-lib)

;(define grad-cap-icon-path (list "img" "graduation-cap.svg"))
;(define laptop-icon-path (list "img" "laptop.svg"))
;(define dollar-sign-icon-path (list "img" "dollar-sign.svg"))
;(define school-supplies-icon-path (list "img" "school-supplies.svg"))

(define grad-cap-icon
  (img src: (prefix/pathify grad-cap-icon-path)
       height: 42
       style: (properties margin-right: 10)))

(define laptop-icon
  (img src: (prefix/pathify laptop-icon-path)
       height: 42
       style: (properties margin-right: 10)))

(define dollar-sign-icon
  (img src: (prefix/pathify dollar-sign-icon-path)
       height: 42
       style: (properties margin-right: 10)))

(define school-supplies-icon
  (img src: (prefix/pathify school-supplies-icon-path)
       height: 42
       style: (properties margin-right: 10)))

(define (donate-options)
  (div class: "btn-group btn-group-toggle"
       style: (properties width: "100%"
                          margin-bottom: 10)
       'data-toggle: "buttons"
       (label class: "btn btn-success active"
              style: (properties width: "50%")
              (input type: "radio"
                     name: "options"
                     id: "give-once"
                     ;autocomplete: "off"
                     "GIVE ONCE"))
       (label class: "btn btn-secondary"
              style: (properties width: "50%")
              (input type: "radio"
                     name: "options"
                     id: "give-monthly"
                     ;autocomplete: "off"
                     "MONTHLY"))))

(define (donate-amounts)
  (define (donate-amount amount)
    (button-secondary id:(~a "donate-amount-" amount)
                      style: (properties margin: 4)
                      (~a "$" amount)))
  (apply (curry container style: (properties height: "60%"
                                       margin-bottom: 10))
       (map donate-amount (list 50 100 150 200 "other"))))

(define (donate-button amount sku)
  (button-success id:(~a "donate-button-" sku)
                  (~a "Donate $" amount)))

(define (jumbotron-main-section)
  (define price 50) ;dummy data
  (define sku "")
  (define key "")
  (jumbotron
   style: (properties
           text-align: "center"
           margin-bottom: 0
           background-image: (string-append "url(" (prefix/pathify homepage-cover-img-path) ")")
           background-size: "cover"
           height: "80%")
   class: "d-flex align-items-center"
   (container
    (row class: "align-items-center"
         style: (properties 'min-height "50%"
                            padding: 15
                            color: "white"
                            background: "rgba(0,0,0,0.5)")
         (col-sm-6 style: (properties height: "80%"
                                      color: "black")
          (donate-options)
           (br)
           (card-deck
            (card
             ;(card-img-top src: (prefix/pathify games-img-path)) 
             (card-body
              (container style: (properties height: "20%"
                                            margin-bottom: 10)
                   (card-title "Choose an amount to give"))
              (donate-amounts)
              (container style: (properties height: "20%")
                   (donate-button price sku))
              ))))
         (col-sm-6 
          (h4 "WHAT YOUR DONATIONS SUPPORT")
          (table style: (properties color: "white")
                 (tr (td grad-cap-icon)
                     (td (h5 "Full/Partial Scholarships")))
                 (tr (td laptop-icon)
                     (td (h5 "Customized Chromebooks for Student Use")))
                 (tr (td dollar-sign-icon)
                     (td (h5 "Reduced Overall Costs for Students")))
                 (tr (td school-supplies-icon)
                     (td (h5 "Classroom Supplies"))))
          )))))

(define (donate) 
  (page donate-path
    (normal-content 
      (h1 "Help Students Code Today")
      (jumbotron-main-section))))
