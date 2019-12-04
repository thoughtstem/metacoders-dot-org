#lang at-exp racket 

(provide city-page
         course-card
         location-courses
         donate-card
         school-year-courses
         summer-courses)

(require website/bootstrap
         "./html-helpers.rkt"
         "./imgs.rkt")


(define (city-page-links-section)
  (jumbotron class: "mb-0 pt-4 pb-4 text-center"
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
  (jumbotron class: "mb-0 pt-5 pb-5 text-center bg-white"
    (container
      (h2 "MetaCoders Classes and Camps Inspire Students to Create with Technology")
      (row class: "align-items-center" ;abstract to responsive-row-lg?
           (div class: "col-lg-6 col-xs-12 p-4"
                (img src: (prefix/pathify takes-a-village-path) 
                     class: "img-fluid rounded"))
           (div class: "col-lg-6 col-xs-12 p-4 text-left"
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
         #:locations-list [l '()]
         #:school-year-courses [school-year-courses '()]
         #:summer-courses [summer-courses '()])
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
   l
   school-year-courses
   summer-courses
   (have-questions-section)
   ))

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

   var quantity = parseInt(
          document.getElementById("student-quantity-@sku").value
        );
        
   stripe.redirectToCheckout({
    items: [{sku: '@sku', quantity: quantity}],
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

(define (camp-buy-button price sku key)
  (list (button-primary id:(~a "checkout-button-" sku)
                        class: "m-0 col-sm-4" 
                        style: (properties border-radius: "0 0 0.20rem 0")
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

   var quantity = parseInt(
          document.getElementById("modal-student-quantity-@sku").value
        );
        
   stripe.redirectToCheckout({
    items: [{sku: '@sku', quantity: quantity}],
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

(define (student-spinner sku price)
  (list (div class: "btn-group d-flex justify-content-center"
              (button-warning id: (~a "student-subtract-" sku)
                              'onclick: (~a "updateStudents" sku "(event);")
                              "-")
              (input type: "text"
                     class: "text-center col-2"
                     id: (~a "student-quantity-" sku)
                     'value: 1)
              (button-warning id: (~a "student-add-" sku)
                              'onclick: (~a "updateStudents" sku "(event);")
                               "+"))
@script/inline{
 var updateStudents@sku = function(evt) {
  if (evt && evt.type === "keypress" && evt.keyCode !== 13) {
   return;
  }
  var isAdding = evt.target.id === "student-add-@sku";
  var inputEl = document.getElementById("student-quantity-@sku");
  var currentQuantity = parseInt(inputEl.value);
  document.getElementById("student-add-@sku").disabled = false;
  document.getElementById("student-subtract-@sku").disabled = false;
  var quantity = isAdding ? currentQuantity + 1 : currentQuantity - 1;
  inputEl.value = quantity;
  document.getElementById("checkout-button-@sku").textContent = "Enroll Now for $" + quantity * @price;
  // Disable the button if the customers hits the max or min
  if (quantity === 1) {
   document.getElementById("student-subtract-@sku").disabled = true;
  }
  if (quantity === 10) {
   document.getElementById("student-add-@sku").disabled = true;
  }
}}
         (p class: "m-0 text-secondary text-center" "Number of Students")))

(define (modal-student-spinner sku price)
  (list (div class: "btn-group d-flex justify-content-center"
              (button-warning id: (~a "modal-student-subtract-" sku)
                              'onclick: (~a "modalUpdateStudents" sku "(event);")
                              "-")
              (input type: "text"
                     class: "text-center col-2"
                     id: (~a "modal-student-quantity-" sku)
                     'value: 1)
              (button-warning id: (~a "modal-student-add-" sku)
                              'onclick: (~a "modalUpdateStudents" sku "(event);")
                               "+"))
@script/inline{
 var modalUpdateStudents@sku = function(evt) {
  if (evt && evt.type === "keypress" && evt.keyCode !== 13) {
   return;
  }
  var isAdding = evt.target.id === "modal-student-add-@sku";
  var inputEl = document.getElementById("modal-student-quantity-@sku");
  var currentQuantity = parseInt(inputEl.value);
  document.getElementById("modal-student-add-@sku").disabled = false;
  document.getElementById("modal-student-subtract-@sku").disabled = false;
  var quantity = isAdding ? currentQuantity + 1 : currentQuantity - 1;
  inputEl.value = quantity;
  document.getElementById("modal-checkout-button-@sku").textContent = "Enroll Now for $" + quantity * @price;
  // Disable the button if the customers hits the max or min
  if (quantity === 1) {
   document.getElementById("modal-student-subtract-@sku").disabled = true;
  }
  if (quantity === 10) {
   document.getElementById("modal-student-add-@sku").disabled = true;
  }
}}
         (p class: "m-0 text-secondary text-center" "Number of Students")))

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
         (student-spinner sku price)
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
              (buy-button price sku key))
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
                       #:quantity-spinner (modal-student-spinner sku price)
                       #:buy-button (modal-buy-button price sku key)))
        )
  )

(define (camp-calendar . camps)
  (define dummy-camp-enroll
    (a href: "#" ;class: "m-0 p-0"
                 'data-toggle: "modal" 'data-target: "#enroll-modal-sku_GG43XFZEQxqgmG"
                 (button-primary class: "btn-sm"
                                 "Enroll")))
  (define dummy-camp-modal
    (am-camp-modal #:id            "enroll-modal-sku_GG43XFZEQxqgmG"
                   #:topic         "Point & Click Games Camp!"
                   #:image-url     "https://s3-us-west-1.amazonaws.com/ts-email-assets-and-stuff/DSC_0603_370_200.jpg"
                   #:description   "In our Summer program, students at La Jolla will learn how to code their own whack-a-mole style games that utilize the mouse. Students will learn how to customize their game with near endless possible combinations: Are you a UFO collecting cows? Or a kid eating up their favorite foods and avoiding their least favorites? Or a ninja nabbing fruit and not the bombs? Their games will feature a point system, and students will code in-game items such that they gain or lose points when the player clicks on them. This course will not only strengthen students’ coding skills, but also their keyboard and mouse skills. Throughout the course, students will earn physical badges that demonstrate their mastery and inspire them to keep coding!"
                   #:age-range     "K - 2nd"
                   #:meeting-dates (list "7/15/2020" "7/16/2020" "7/17/2020" "7/18/2020" "7/19/2020") ;full list of meeting dates
                   #:location      "Gallaudet University"
                   #:address       "800 Florida Ave NE, Washington, DC 20002"
                   #:address-link  "https://goo.gl/maps/Yypsi9LRZB7sFTjc9"
                   #:price         300
                   #:buy-button    (camp-buy-button 300 "sku_GG43XFZEQxqgmG" "pk_test_Jd6aRCVssUu8YfSvltaT3tvU00je9fQbkA")))
  (table class: "table table-striped table-bordered bg-white"
         (thead (tr (th 'scope: "col" "Courses")
                    (th 'scope: "col" "Jun 15 - 19")
                    (th 'scope: "col" "Jun 22 - 26")
                    (th 'scope: "col" "Jun 29 - Jul 3")
                    (th 'scope: "col" "July 6 - 10")
                    (th 'scope: "col" "July 13 - 17")))
         (tr (td "Awesome Animals" (br)
                 "Ages: 5-7" (br)
                 (button-secondary class: "btn-sm mt-2" "Course Info"))
             (td dummy-camp-enroll (br)
                 "9am-1pm" (br)
                 "$300"
                 dummy-camp-modal)
             (td) (td) (td) (td))
         (tr (td  "Superhero Adventure" (br)
                  "Ages: 5-7" (br)
                 (button-secondary class: "btn-sm mt-2" "Course Info"))
             (td)
             (td dummy-camp-enroll (br)
                 "9am-1pm" (br)
                 "$300"
                 dummy-camp-modal)
             (td) (td) (td))))

(define (location-courses
         #:location-name [name "TBA"]
         #:course-1 [course-1 (p "Coming soon!")]
         #:course-2 [course-2 (p "Coming soon!")])
  (list (school-year-courses course-1)
        (summer-courses course-2)
        ))

(define (school-year-courses . course-cards)
  (jumbotron  id: "school-year-classes"
              class: "mb-0 pt-5 pb-5 text-center"
              (container
               (h2 "Register for School-Year Classes")
               (if (> (length course-cards) 1)
                   (apply row (map (curry div class: "col-md-6 col-xs-12 my-3 mx-auto")
                               course-cards))
                   (apply row (map (curry div class: "col-lg-6 col-md-8 col-xs-12 my-3 mx-auto")
                               course-cards)))
               (p "By enrolling in any of these sessions, you agree to the " (link-to "http://thoughtstem.com"
                                                                                      "terms and conditions") ".")
               )
              ))

(define (summer-camps-links-section)
  (row id: "summer-buttons" ;abstract to responsive-row-md?
   (div class: "col-md-6 col-xs-12 my-2"
        (a href: "#summer-buttons" style: (properties 'text-decoration: "none")
           (button-primary class: "btn-lg btn-block"
                           "K-2nd Summer Options")))
   (div class: "col-md-6 col-xs-12 my-2"
        (a href: "#3-6-summer-options" style: (properties 'text-decoration: "none")
           (button-primary class: "btn-lg btn-block"
                           "3rd-6th Summer Options")))))

(define (summer-camps-info-section location-name)
  (row class: "align-items-center" ;abstract to responsive-row-lg?
       (div class: "col-lg-6 col-xs-12 p-4 text-left"
            (h5 class: "text-center" "What Makes MetaCoders Camps Different?")
            (ul class: "pl-4"
                (li (p (b "Affordable: ") (~a "We bring summer technology education to local students at a more affordable price. "
                                              "Additional discoutns are available for multiple registrations.")))
                (li (p (b "Flexible: ") (~a "Choose between half-day camps or full-day camps; morning-only  camps include lunch in "
                                            location-name "'s delicious dining halls. ") (strong "Extended daycare") " also available!"))
                (li (p (b "Prestigous Location: ") (~a "Students receive an authentic college experience on the beautiful " location-name " campus.")))
                (li (p (b "Awesome Instructors: ") (~a "MetaCoders instructors teach computer science year-round. We strive for a 1:5 "
                                                       "mentor:student ratio during the summer, which ensures students get the hands-on "
                                                       "attention they deserve.")))
                ))
       (div class: "col-lg-6 col-xs-12 p-4"
            (img src: (prefix/pathify takes-a-village-path) 
                 class: "img-fluid rounded"))
       ))

(define (summer-camp-pricing-at location-name)
  (row class: "align-items-center"
       (div class: "col-lg-4 col-xs-12 p-4"
            (img src: (prefix/pathify takes-a-village-path)
                 class: "img-fluid rounded"))
       (div class: "col-lg-8 col-xs-12 p-4 text-left"
            (h2 class: "mb-4" "Summer Camp Pricing at " location-name)
            (strong "Purchasing 1 Half-Day Morning or Afternoon Camp? Purchase using the table above.")
            (ul
             (li "Morning Only (9am - 1pm): $370, includes lunch at the dining hall")
             (li "Afternoon Only (1pm - 4pm): $290"))
            (strong "Purchasing More than 1 Half-Day Camp? Fill out the registration form "
                    (link-to "form.pdf" "here") ", and email it to "
                    (a href: "mailto:contact@metacoders.org" "contact@metacoders.org"))
            (ul
             (li "Full Day, 1-week (9am - 4pm): $594, includes lunch at the dining hall")
             (li "Want to buy more than 1 week of camp? We'll take an extra 10% off your entire order")))))


(define (have-questions-section)
  (jumbotron class: "mb-0 pt-5 pb-5 text-center"
             (container
              (h2 "Have Questions?")
              (p "Email us at "
                 (a href: "mailto:contact@metacoders.org" "contact@metacoders.org")
                 " or call " (strong "858-869-9430")))))

(define (summer-courses #:location-name [location-name "TBA"]
                        . course-cards)
  (list (jumbotron  id: "summer-camps"
              class: "mb-0 pt-5 pb-5 text-center bg-white"
              (container
               (h2  "Register for Summer Camps")
               (summer-camps-info-section location-name)
               (summer-camps-links-section)
               ;))
        ;(jumbotron  id: "k-2-summer-options"
        ;      class: "mb-0 pt-0 pb-0 text-center bg-white"
        ;      (container
               ;(summer-camps-links-section)
               (h5 class: "mt-5"
                   "Summer Camp Schedule for K-2nd")
               (camp-calendar)
               (br id: "3-6-summer-options")
               (h5 class: "mt-5"
                   "Summer Camp Schedule for 3rd-6th")
               (camp-calendar)
               ;))
        ;(jumbotron  id: "summer-camps"
        ;      class: "mb-0 text-center"
        ;      (container
               (summer-camp-pricing-at location-name)
               (p "By enrolling in any of these sessions, you agree to the " (link-to "http://thoughtstem.com"
                                                                                      "terms and conditions") ".")
               ))
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
