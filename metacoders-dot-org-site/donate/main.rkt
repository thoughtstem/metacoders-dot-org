#lang at-exp racket

(provide donate)

(require metacoders-dot-org-lib
         racket/runtime-path)

(define-runtime-path grad-cap-path "./graduation-cap.svg")
(define-runtime-path laptop-path "./laptop.svg")
(define-runtime-path dollar-sign-path "./dollar-sign.svg")
(define-runtime-path school-supplies-path "./school-supplies.svg")

(define grad-cap-icon
  (html/inline (string-replace (file->string grad-cap-path) "<svg" "<svg class=\"donate-color\"")))

(define laptop-icon
  (html/inline (string-replace (file->string laptop-path) "<svg" "<svg class=\"donate-color\"")))

(define dollar-sign-icon
  (html/inline (string-replace (file->string dollar-sign-path) "<svg" "<svg class=\"donate-color\"")))

(define school-supplies-icon
  (html/inline (string-replace (file->string school-supplies-path) "<svg" "<svg class=\"donate-color\"")))

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
   class: "align-items-center"
   (h1 id: "donate-header" style: (properties color: "white"
                                              'text-shadow: "-2px 2px black"
                                              margin-bottom: 20) "Help Students Code Today")
   (container
    (style/inline type: "text/css"
                  ".donate-color { height: 42px; width: 42px; margin-right:10px; fill: #ffc107; }")
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
      (jumbotron-main-section)
      (script/inline type: "text/javascript"
                   "function randomColor(){
                      var icons = document.getElementsByClassName('donate-color');
                      var buttons = document.getElementsByClassName('btn-success');
                      var myColors = ['#dc3545','#ffc107','#28a745','#007bff','#17a2b8'];
                      var aColor = myColors[Math.floor(Math.random() * myColors.length)];
                      for (const icon of icons){
                        icon.style.fill = aColor;
                      }
                      for (const button of buttons){
                        button.style.backgroundColor = aColor;
                        button.style.borderColor = aColor;
                      }
                      var header = document.getElementById('donate-header');
                      header.style.textShadow = '-2px 2px ' + aColor;
                    }
                    randomColor();"))))
