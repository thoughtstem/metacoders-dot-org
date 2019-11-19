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
       (label class: "btn btn-secondary active"
              style: (properties width: "50%")
              data-target: "#donate-mode"
              data-slide-to: "0"
              (input type: "radio"
                     name: "options"
                     id: "give-once"
                     ;autocomplete: "off"
                     "GIVE ONCE"))
       (label class: "btn btn-secondary"
              style: (properties width: "50%")
              data-target: "#donate-mode"
              data-slide-to: "1"
              (input type: "radio"
                     name: "options"
                     id: "give-monthly"
                     ;autocomplete: "off"
                     "MONTHLY"))))

(define (donate-amounts)
  (define (donate-amount amount)
    (button-secondary id:(~a "donate-amount-" amount)
                      class: "m-1"
                      'onclick: (~a "setDonate" amount "();")
                      @script/inline{
function setDonate@amount() {
  var donateBtn = document.getElementById('donate-button');
  donateBtn.innerHTML = "Donate $@amount";
}}
                     (~a "$" amount)))
  (apply container
       (map donate-amount (list 50 100 150 200 "other"))))

(define (donate-button)
  (define key "pk_test_BZvU77rH9zfNQvab1EpKB7GK00ZxANulPE")
  (list (button-success id:(~a "donate-button")
                  class: "btn-block"
                  style: (properties display: "inline-block"
                                     border-radius: "0 0 0.18rem 0.18rem")
                  (~a "Donate $50"))
        ;TODO: Add stripe script
        (script src:"https://js.stripe.com/v3")
        @script/inline{
 (function() {
  var stripe = Stripe('@key');
  var donateButton = document.getElementById('donate-button');
  donateButton.addEventListener('click', function () {
   var currentButton = document.getElementById('donate-button');
   var buttonStr = currentButton.innerText.match(/(\d+)/);
   var numberStr;
   if (buttonStr){
    numberStr = buttonStr[0];
    }else{
    numberStr = "0"
   }
   var donateSku;
   switch(numberStr){
    case "50":
    donateSku = "sku_G7REBMxlyd6Oh1";
    break;
    case "100":
    donateSku = "sku_GA18hKlhrjqjfj";
    break;
    default:
    donateSku = "sku_G7REBMxlyd6Oh1";
   }
   stripe.redirectToCheckout({
    items: [{sku: donateSku, quantity: 1}],
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
  })();}))

(define (donate-amounts-monthly)
  (define (donate-amount amount)
    (button-secondary id:(~a "donate-amount-monthly-" amount)
                      class: "m-1"
                      'onclick: (~a "setMonthlyDonate" amount "();")
                      @script/inline{
function setMonthlyDonate@amount() {
  var donateBtn = document.getElementById('monthly-donate-button');
  donateBtn.innerHTML = "Donate $@(~a amount "/mo")";
}}
                      (~a "$" amount "/mo")))
  (apply container
       (map donate-amount (list 30 60 90 120 "other"))))

(define (monthly-donate-button)
  (button-success id:(~a "monthly-donate-button")
                  class: "btn-block"
                  style: (properties display: "inline-block"
                                     border-radius: "0 0 0.18rem 0.18rem")
                  ;TODO: Add stripe script
                  (~a "Donate $30/mo")))

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
                                              margin-bottom: 20) "Help Students Code Today")
   (container
    (style/inline type: "text/css"
                  ".donate-color { height: 42px; width: 42px; margin-right:10px; fill: #ffc107; }
                   .btn.btn-secondary:not(:disabled):not(.disabled).active {background-color:#545b62;}")
    (row class: "align-items-center p-4"
         style: (properties color: "white"
                            background: "rgba(0,0,0,0.5)")
         (col-sm-6 style: (properties color: "black")
          (donate-options)
          (br)
          (carousel id: "donate-mode"
                    class: "slide"
                    ;data-ride: "carousel"
                    (div class: "carousel-inner" style: (properties 'min-height: 250)
                     (card class: "carousel-item active mt-2 mb-2"
                           (card-body class: "p-2" style: (properties 'min-height: "12rem")
                            (card-title "Choose an amount to give")
                            (donate-amounts))
                           (card-footer class: "text-center"
                                        style: (properties padding: 0
                                                           background-color: "transparent"
                                                           border-top: "none")
                                        (donate-button)))
                     (card class: "carousel-item mt-2 mb-2"
                           (card-body class: "p-2" style: (properties 'min-height: "12rem")
                            (card-title "Choose an amount to give")
                            (donate-amounts-monthly))
                           (card-footer class: "text-center"
                                        style: (properties padding: 0
                                                           background-color: "transparent"
                                                           border-top: "none")
                                        (monthly-donate-button))))))
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
