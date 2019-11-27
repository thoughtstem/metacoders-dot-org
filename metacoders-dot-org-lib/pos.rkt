#lang at-exp racket 

(provide city-page
         course-card
         location-courses
         donate-card)

(require website/bootstrap
         "./html-helpers.rkt"
         "./imgs.rkt")


(define (city-page-links-section)
  (jumbotron class: "mb-0 p-4 text-center bg-white"
    (container
      (row ;abstract to responsive-row-md?
       (div class: "col-md-6 col-xs-12 my-2"
            (a href: "#school-year-classes" style: (properties 'text-decoration: "none")
               (button-primary class: "btn-lg btn-block"
                               "Enroll in School-Year Classes")))
       (div class: "col-md-6 col-xs-12 my-2"
            (a href: "#summer-camps" style: (properties 'text-decoration: "none")
               (button-primary class: "btn-lg btn-block"
                               "Enroll in Summer Camps")))))))

(define (city-page-fold-section)
  (jumbotron class: "mb-0 text-center"
    (container
      #|(responsive-row #:columns 2
                      (a href: "#school-year-classes" style: (properties 'text-decoration: "none")
                               (button-primary class: "btn-lg btn-block"
                                      "Enroll in School-Year Classes"))
                      (a href: "#summer-camps" style: (properties 'text-decoration: "none")
                               (button-primary class: "btn-lg btn-block"
                                      "Enroll in Summer Camps")))
      (hr)|#
      (h2 "MetaCoders Classes and Camps Inspire Students to Create with Technology")
      (row class: "align-items-center" ;abstract to responsive-row-lg?
           (div class: "col-lg-6 col-xs-12 p-4"
                (img src: (prefix/pathify takes-a-village-path) 
                     class: "img-fluid rounded"))
           (div class: "col-lg-6 col-xs-12 p-4 text-left"
                ;(h5 "MetaCoders Classes and Camps Inspire Students to Create with Technology")
                (ul class: "pl-4"
                    (li (p (b "Technolgy Is The Future: ") (~a "More than ever, K-12 students need to prepare for the future by "
                                                               "becoming fluent in coding, and they're not being taught enough coding in schools!")))
                    (li (p (b "Awesome Instructors: ") (~a "MetaCoders instructors teach computer science year-round. We strive for a 1:10 mentor:student "
                                                           "ratio that ensures students get the hands-on attention they deserve.")))
                    (li (p (b "Focus on Engagement: ") (~a "We belive it's important for students to not only understand technology, but also enjoy creating with "
                                                           "it! We want to inspire the next generation of engineers, web developers, and computer scientists.")))
                    ))))))


(define (city-page
         #:city-name [city-name ""]
         #:banner-url [img-url ""]
         #:locations-list [l '()])
  (normal-content-wide
   (section class: "jumbotron d-flex align-items-center mb-0 text-center"
    style: (properties
            background-image: (string-append "url(" img-url ")")
            background-size: "cover"
            background-position: "center"
            height: "60%")
    (container
     (div style: (properties
                  display: "inline-block"
                  padding: 15
                  color: "white"
                  background: "rgba(0, 0, 0, 0.5)")
          (h1 "Coding Classes & Camps in")
          (h1 city-name))))
   (city-page-links-section)
   (city-page-fold-section)
   l))

(define (buy-button price sku key)
  (list (button-primary id:(~a "checkout-button-" sku)
                        class: "m-0 col-sm-6" 
                        style: (properties border-radius: "0 0 0.18rem 0")
                          (~a "Enroll Now for $" price))
        (div id:(~a "error-message" sku))
        (script src:"https://js.stripe.com/v3")
        @script/inline{
 (function() {
  var stripe = Stripe('@key');

  var checkoutButton = document.getElementById('checkout-button-@sku');
  checkoutButton.addEventListener('click', function () {

   stripe.redirectToCheckout({
    items: [{sku: '@sku', quantity: 1}],
    successUrl: 'https://metacoders-dot-org/checkout-success.html',
    cancelUrl: 'https://metacoders-dot-org/checkout-fail.html',
    billingAddressCollection: 'required',
    })
   .then(function (result) {
    if (result.error) {
     var displayError = document.getElementById('error-message@sku');
     displayError.textContent = result.error.message;
    }
    });
   });
  })();}))

(define (modal-buy-button price sku key)
  (list (button-primary id:(~a "modal-checkout-button-" sku)
                        class: "m-0 col-sm-6" 
                        style: (properties border-radius: "0 0 0.18rem 0")
                          (~a "Enroll Now for $" price))
        (div id:(~a "error-message" sku))
        (script src:"https://js.stripe.com/v3")
        @script/inline{
 (function() {
  var stripe = Stripe('@key');

  var checkoutButton = document.getElementById('modal-checkout-button-@sku');
  checkoutButton.addEventListener('click', function () {

   stripe.redirectToCheckout({
    items: [{sku: '@sku', quantity: 1}],
    successUrl: 'https://metacoders-dot-org/checkout-success.html',
    cancelUrl: 'https://metacoders-dot-org/checkout-fail.html',
    billingAddressCollection: 'required',
    })
   .then(function (result) {
    if (result.error) {
     var displayError = document.getElementById('error-message@sku');
     displayError.textContent = result.error.message;
    }
    });
   });
  })();}))

(define (print-dates dates [s ""])   
  (if (> (length dates) 1)
      (begin (set! s (~a s (first dates) ", "))
             (print-dates (rest dates) s))
      (begin (set! s (~a s (first dates) "."))
             s)))

(define (course-card
         #:title         [title "NEW COURSE"]
         #:image-url     [image-url ""]
         #:topic         [topic "TBA"]
         #:description   [description "TBA"]
         #:age-range     [age-range "TBA"]
         #:meeting-dates [meeting-dates '("10/1/2012")]
         #:start-time    [start-time "TBA"]
         #:end-time      [end-time "TBA"]
         #:location      [location "TBA"]
         #:address       [address "TBA"]
         #:address-link  [address-link (~a "https://www.google.com/maps/place/" (string-replace address " " "+"))]
         #:price         [price "TBA"]
         #:sku           [sku ""]
         #:key           [key ""])
  ;define course modal
  #;(card
   class: "m-4"
   (h1 style:(properties text-align: "center")
       title)
   (card-body
    (h3 topic)
    (h5 (strong "Grades: " age-range))
    (h5 (strong "Start Date: ") (first meeting-dates) " @ " start-time)
    (card-img-top
     src: image-url)
    (p)
    (card-text description)
    (p (strong "Times:") " from " start-time " to " end-time ".")
    (p (strong "Dates: ") (print-dates meeting-dates))
    (p (strong "Location: ") location " - " address ".")
    (buy-button price sku key)))
  (card class: "h-100 text-center"
        (img src: image-url
             class: "card-img-top")
        ;(card-header (h5 class: "m-0 p-0" (~a topic " (" age-range ")")))
        (card-body
         (h5 class: "card-title" (~a topic " (" age-range ")"))
         ;(img src: image-url
         ;     class: "img-fluid rounded")
         (table class: "table table-sm table-borderless text-left"  ;class: "text-left mt-3 pl-0" style: (properties 'list-style-type: "none")
              (tr (td (strong "Start Date: ")) (td (first meeting-dates) " @ " start-time))
              (tr (td (strong "Schedule: ") (td (~a (meeting-date->weekday (first meeting-dates)) "s, "
                                                    (length meeting-dates) " weeks"))))
              (tr (td (strong "Location: ") (td location (br) (a target:"_blank" href: address-link address)))))
        )
        (card-footer class: "text-center"
                     style: (properties padding: 0
                                        background-color: "transparent"
                                        ;border-top: "none"
                                        )
         (div class: "btn-group w-100"
              (a href: "#" class: "col-sm-6 m-0 p-0"
                 'data-toggle: "modal" 'data-target: (~a "#details-modal-" sku)
                 (button-secondary class: "w-100" 
                                   style: (properties border-radius: "0 0 0 0.18rem")
                                   "Class Details"))
              (modal-buy-button price sku key))
         (course-modal #:id (~a "details-modal-" sku)
                       #:topic         topic
                       #:description   description
                       #:age-range     age-range
                       #:meeting-dates meeting-dates
                       #:start-time    start-time
                       #:end-time      end-time
                       #:location      location
                       #:address       address
                       #:address-link  address-link
                       #:price         price
                       #:buy-button (buy-button price sku key)))
        )
  )

(define (location-courses
         #:location-name [name "TBA"]
         #:course-1 [course-1 (p)]
         #:course-2 [course-2 (p)])
  (list (jumbotron  id: "school-year-classes"
                    class: "mb-0 text-center bg-white"
                    (container
                     (h2 "Register for School-Year Classes")
                     (row ;abstract to responsive-row-md?
                      (div class: "col-md-6 col-xs-12 my-3"
                           course-1)
                      (div class: "col-md-6 col-xs-12 my-3"
                           course-1 ;dummy duplicate for now
                           ))
                     ))
        (jumbotron id: "summer-camps"
                   class: "mb-0 text-center"
                   (container
                    (h2  "Register for Summer Camps")
                    (row 
                     (div class: "col-md-6 col-xs-12 my-3"
                          course-1)
                     (div class: "col-md-6 col-xs-12 my-3"
                          course-1 ;dummy duplicate for now
                          ))
                    ))))

;Donate Card
(define (donate-amounts items)
  (define (donate-amount amount #:class [class ""])
    (label class: (~a "btn btn-secondary m-1" class #:separator " ")
           'onclick: (~a "setDonate" amount "();")
           (input type: "radio"
                  name: "amount-options"
                  id:(~a "donate-amount-" amount)
                  )
           @script/inline{
function setDonate@amount() {
  var donateBtn = document.getElementById('donate-button');
  donateBtn.innerHTML = "Donate $@amount";
}}
                     (~a "$" amount)))
  (apply (curry div class: "btn-group-toggle"
                'data-toggle: "buttons")
         (append (list (donate-amount (car (first items)) #:class "active"))
                 (map (compose donate-amount
                               car)
                      (rest items)))))

(define (donate-button items #:mode [mode 'give-once])
  (define key "pk_test_Jd6aRCVssUu8YfSvltaT3tvU00je9fQbkA")  ;MetaCoders Stripe
  ;(define key "pk_test_BZvU77rH9zfNQvab1EpKB7GK00ZxANulPE") ;Sonny's Stripe
  (define button-id (if (eq? mode 'monthly)
                        "monthly-donate-button"
                        "donate-button"))
  (define (generate-js-switch items)
    (~a "switch(amount){ "
        (apply ~a (map (λ(item)
                         (~a "case "(car item)": "
                             "donateSku = \"" (cdr item) "\"; "
                             "break; "))
                       items))
        "} "))
  (list (button-success id: button-id
                        class: "btn-block"
                        style: (properties display: "inline-block"
                                           border-radius: "0 0 0.18rem 0.18rem")
                        (if (eq? mode 'monthly)
                            (~a "Donate $" (car (first items)) "/mo")
                            (~a "Donate $" (car (first items)))))
        (script src:"https://js.stripe.com/v3")
        (if (eq? mode 'monthly)
            @script/inline{
 (function() {
  var stripe = Stripe('@key');
  var donateButton = document.getElementById('@button-id');
  donateButton.addEventListener('click', function () {
   var currentButton = document.getElementById('@button-id');
   var buttonStr = currentButton.innerText.match(/(\d+)/);
   var amount;
   if (buttonStr){
    amount = parseInt(buttonStr[0]);
    }else{
    amount = 0;
   }
   var donateSku;
   
   @(generate-js-switch items)
   
   stripe.redirectToCheckout({
    items: [{plan: donateSku, quantity: 1}],
    successUrl: 'https://metacoders-dot-org/checkout-success.html',
    cancelUrl: 'https://metacoders-dot-org/checkout-fail.html',
    billingAddressCollection: 'required',
    })
   .then(function (result) {
    if (result.error) {
     var displayError = document.getElementById('error-message-' + donateSku);
     displayError.textContent = result.error.message;
    }
    });
   });
  })();}
            @script/inline{
 (function() {
  var stripe = Stripe('@key');
  var donateButton = document.getElementById('@button-id');
  donateButton.addEventListener('click', function () {
   var currentButton = document.getElementById('@button-id');
   var buttonStr = currentButton.innerText.match(/(\d+)/);
   var amount;
   if (buttonStr){
    amount = parseInt(buttonStr[0]);
    }else{
    amount = 0;
   }
   var donateSku;
   
   @(generate-js-switch items)
   
   stripe.redirectToCheckout({
    items: [{sku: donateSku, quantity: 1}],
    successUrl: 'https://metacoders-dot-org/checkout-success.html',
    cancelUrl: 'https://metacoders-dot-org/checkout-fail.html',
    billingAddressCollection: 'required',
    submitType: 'donate',
    })
   .then(function (result) {
    if (result.error) {
     var displayError = document.getElementById('error-message-' + donateSku);
     displayError.textContent = result.error.message;
    }
    });
   });
  })();})))

(define (monthly-donate-amounts items)
  (define (donate-amount amount #:class [class ""])
    (label class: (~a "btn btn-secondary m-1" class #:separator " ")
           'onclick: (~a "setMonthlyDonate" amount "();")
           (input type: "radio"
                  name: "monthly-amount-options"
                  id:(~a "donate-amount-monthly-" amount))  
           @script/inline{
function setMonthlyDonate@amount() {
  var donateBtn = document.getElementById('monthly-donate-button');
  donateBtn.innerHTML = "Donate $@(~a amount "/mo")";
}}
                      (~a "$" amount "/mo")))
  (apply (curry div class: "btn-group-toggle"
                'data-toggle: "buttons")
       (append (list (donate-amount (car (first items)) #:class "active"))
               (map (compose donate-amount
                     car)
                    (rest items)))))

(define (donate-card
         #:class       [class ""]
         #:mode        [mode 'give-once]
         #:items       [items (list (cons 50  "sku_G7REBMxlyd6Oh1")
                                    (cons 100 "sku_GA18hKlhrjqjfj")
                                    (cons 150 "sku_G7REBMxlyd6Oh1")
                                    (cons 200 "sku_G7REBMxlyd6Oh1"))])

  (card class: (~a "mt-2 mb-2 " class)
        (card-body class: "p-2" style: (properties 'min-height: "12rem")
                   (card-title "Choose an amount to give")
                   (if (eq? mode 'monthly)
                       (monthly-donate-amounts items)
                       (donate-amounts items))
                   #;(div class: "input-group m-1 mx-auto"
                        style: "width:10rem;"
                        (div class: "input-group-prepend"
                             (span class: "input-group-text" "$"))
                        (input type: "text"
                               class: "form-control"
                               id: "donate-form-input"
                               'placeholder: "Other Amount")
                        #;(div class: "input-group-append"
                             (span class:"input-group-text" ".00"))
                        )         
                   )
        (card-footer class: "text-center"
                     style: (properties padding: 0
                                        background-color: "transparent"
                                        border-top: "none")
                     (if (eq? mode 'monthly)
                         (donate-button items #:mode 'monthly)
                         (donate-button items)))))