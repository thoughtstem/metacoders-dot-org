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
  (div class: "btn-group btn-group-toggle mb-2"
       style: (properties width: "100%")
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
           height: "60%")
   class: "d-flex align-items-center"
   (container
    (col-sm-8 class: "p-4 mx-auto"
         style: (properties color: "white"
                            background: "rgba(0,0,0,0.5)")
         (h1 id: "donate-header" class: "mb-4"
             style: (properties color: "white"
                                'text-shadow: "-2px 2px #28a745")
             "Help Students Code Today")
         (div ;class: "mx-auto"
              style: (properties color: "black")
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
         #;(col-sm-6 
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
          )
         ))))

(define (what-your-donations-support)
  (jumbotron class: "mb-0 text-center"
             style: (properties background: "white")
    (container ;class: "col-sm-8 mx-auto"
      (h3 "What Your Donations Support")
      (br)
      (table class: "mx-auto"
             (tr (td grad-cap-icon)
                 (td (h6 (b "Financial aid") " to help all students have the opportunity to learn how to code no matter their financial means.")))
             (tr (td laptop-icon)
                 (td (h6 (b "Customized Chromebooks") " filled with MetaCoder curriculum and programming languages for students to use during classes and camps.")))
             (tr (td dollar-sign-icon)
                 (td (h6 (b "Reduced overall costs") " of classes and camps for all families.")))
             (tr (td school-supplies-icon)
                 (td (h6 (b "Classroom supplies") " and learning materials that help keep students engaged. This includes things like badges to earn, toys to earn, kata cards, and more!")))))))

(define (more-ways-to-donate-section)
  (jumbotron  class: "mb-0 text-center"
              (container ;class: "col-sm-8 mx-auto"
                         (h3 "Other Ways to Donate")
                         (br)
                         (div class: "text-left"
                              (p "At this time, MetaCoders primarily accepts monetary donations to support our efforts in computer science education. There are a few other ways you can donate besides through the donation form above:")
                              (ul
                               (li "Mail a check to our headquarters at 2635 Camino del Rio South, Ste 103, San Diego, CA 92108. Please include your return mailing address and phone number so that we can send you a donation receipt.")
                               (li "Call us at 858-869-9430 with payment details.")
                               (li "If you have a non-monetary donation, please email us at contact@metacoders.org to see if we can accept your donation."))))))

(define (more-ways-to-donate-deck-section)
  (jumbotron  class: "mb-0 text-center"
              (container ;class: "col-sm-8 mx-auto"
                         (h3 "Other Ways to Donate")
                         (br)
                         (div class: "text-left"
                              (p "At this time, MetaCoders primarily accepts monetary donations to support our efforts in computer science education. There are a few other ways you can donate besides through the donation form above:")
                              (responsive-row #:columns 3
                                    (card class: "h-100"
                                     (card-header (h6 class: "m-0" "Donate by Mail"))
                                     (card-body (p "Mail a check to our headquarters at:")
                                                (p (b "2635 Camino del Rio South, Ste 103, San Diego, CA 92108"))
                                                (p "Please include your return mailing address and phone number so that we can send you a donation receipt.")))
                                    (card class: "h-100"
                                     (card-header (h6 class: "m-0" "Donate by Phone"))
                                     (card-body "Call us at "
                                                (b "858-869-9430")
                                                " with payment details."))
                                    (card class: "h-100"
                                     (card-header (h6 class: "m-0" "Donate by Email"))
                                     (card-body "If you have a non-monetary donation, please email us at "
                                                (a href: "mailto:contact@metacoders.org" "contact@metacoders.org")
                                                " to see if we can accept your donation."))
                               )))))

(define (donate) 
  (page donate-path
    (normal-content-wide
     (style/inline type: "text/css"
                   (~a ".donate-color { height: 42px; width: 42px; margin-right:10px; fill: #28a745; }"
                       ".btn.btn-secondary:not(:disabled):not(.disabled).active {background-color:#222;}"
                       ".card-header {background-color: #28a745; color: white;}"))
      (jumbotron-main-section)
      (what-your-donations-support)
      (more-ways-to-donate-deck-section)
      #;(script/inline type: "text/javascript"
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
