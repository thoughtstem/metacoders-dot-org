#lang at-exp racket 

(provide course-card
         location-courses
         donate-card)

(require website/bootstrap)


(define (buy-button price sku key)
  (list (button-secondary id:(~a "checkout-button-" sku)
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
         #:meeting-dates [meeting-dates '("TBA")]
         #:start-time    [start-time "TBA"]
         #:end-time      [end-time "TBA"]
         #:location      [location "TBA"]
         #:address       [address "TBA"]
         #:price         [price "TBA"]
         #:sku           [sku ""]
         #:key           [key ""])
  (card
   class: "m-4"
   ;style: (properties
   ;        margin: 10
   ;        height: 1000
   ;        width:  600)
   (h1 style:(properties text-align: "center")
       title)
   (card-body
    (h3 topic)
    (h5 (strong "Grades: " age-range))
    (h5 (strong "Start Date: ") (first meeting-dates) " @ " start-time)
    (card-img-top
     src: image-url
     ;style: (properties
     ;        width: 550)
     )
    (p)
    (card-text description)
    (p (strong "Times:") " from " start-time " to " end-time ".")
    (p (strong "Dates: ") (print-dates meeting-dates))
    (p (strong "Location: ") location " - " address ".")
    (buy-button price sku key))))

(define (location-courses name course-1 [course-2 (p)])
  (div
   (div
    style: (properties
            text-align: "center")
    (br)
    (h1 (~a "Sign up for courses at " name "!"))
    (br))
            
   (div
    (card-deck
          course-1
          course-2)
    ;style: (properties
    ;        position: "absolute"
    ;        left: "50%"
    ;        margin-left: -600)
    ;(row
    ; (col-5
    ;  course-1)
    ; (col-5
    ;  style:
    ;  (properties
    ;   margin-left: 50)
    ;  course-2))
    )
   ;(div style: (properties height: 1000))
  ))

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