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

(define (donate-toggle)
  (div class: "btn-group btn-group-toggle"
       style: (properties width: "100%"
                          margin-bottom: 10)
       'data-toggle: "buttons"
       (label class: "btn btn-secondary active"
              style: (properties width: "50%")
              data-target: "#donate-carousel"
              data-slide-to: "0"
              (input type: "radio"
                     name: "options"
                     id: "give-once"
                     ;autocomplete: "off"
                     )
              "GIVE ONCE")
       (label class: "btn btn-secondary"
              style: (properties width: "50%")
              data-target: "#donate-carousel"
              data-slide-to: "1"
              (input type: "radio"
                     name: "options"
                     id: "give-monthly"
                     ;autocomplete: "off"
                     )
              "MONTHLY")))

(define (jumbotron-main-section)
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
                                              margin-bottom: 20)
       "Help Students Code Today")
   (container
    (style/inline type: "text/css"
                  ".donate-color { height: 42px; width: 42px; margin-right:10px; fill: #ffc107; }
                   .btn.btn-secondary:not(:disabled):not(.disabled).active {background-color:#545b62;}")
    (row class: "align-items-center p-4"
         style: (properties color: "white"
                            background: "rgba(0,0,0,0.5)")
         (col-sm-6 style: (properties color: "black")
          (donate-toggle)
          (br)
          (carousel id: "donate-carousel"
                    class: "slide"
                    (div class: "carousel-inner" style: (properties 'min-height: 250)
                         (donate-card #:class "carousel-item active"
                                      #:items (list (cons 50  "sku_GD6NBPpcmYF6fR")
                                                    (cons 100 "sku_GD6OrlkqZLH3K3")
                                                    (cons 150 "sku_GD6OcHeBdyHpuT")
                                                    (cons 200 "sku_GD6PFx9kiwqUuA")))
                         (donate-card #:class "carousel-item"
                                      #:mode 'monthly
                                      #:items (list (cons 30  "plan_GD4oRQ1V1LVp4i")
                                                    (cons 60  "plan_GD4plj20Iywhi7")
                                                    (cons 90  "plan_GD4pLEXRTNJDjd")
                                                    (cons 120 "plan_GD4qJmEqRQehal")))
                     )))
         (col-sm-6 
          (h4 "WHAT YOUR DONATIONS SUPPORT")
          (br)
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
    (normal-content-wide
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
