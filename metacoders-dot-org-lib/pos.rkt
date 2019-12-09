#lang at-exp racket 

(provide city-page
         ;course->course-card
         donate-card
         (except-out (struct-out course) course)
         (rename-out (make-course course))
         (except-out (struct-out camp) camp)
         (rename-out (make-camp camp)))

(require website/bootstrap
         "./html-helpers.rkt"
         "./imgs.rkt"
         "./paths.rkt")


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
                (img src: (prefix/pathify city-weekly-class-img-path) 
                     class: "img-fluid rounded"))
           (div class: "col-lg-6 col-xs-12 p-4 text-left"
                (ul class: "pl-4"
                    (li (p (b "Technology Is The Future: ") (~a "More than ever, K-12 students need to prepare for the future by "
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
         #:summer-camps [summer-camps '()])
  (normal-content-wide
   (section class: "jumbotron d-flex align-items-center mb-0 text-center"
    style: (properties
            background-image: (string-append "url(" img-url ")")
            background-size: "cover"
            background-position: "center"
            height: "60%"
            position: "relative")
    (div style: (properties background-color: "rgba(0,0,0,0.6)"
                            width: "100%"
                            position: "absolute"
                            top: 0
                            left: 0
                            bottom: 0
                            right: 0
                            float: "left"))
    (container
      (div style: (properties
                  display: "inline-block"
                  padding: 15
                  color: "white"
                  position: "relative")
        (h1 (string-append "Coding Classes & Camps in " city-name)))))
   (city-page-links-section)
   (city-page-fold-section)
   
   ;l
   
   ;TODO: Use a course-struct and write (courses->course-registration ...)
   (cond [(and (empty? school-year-courses)
               (empty? summer-camps))  (jumbotron class: "mb-0 pt-5 pb-5 text-center"
                                                  (container (h2 "Coming Soon!")))]
         [(empty? school-year-courses) (list (jumbotron  id: "school-year-classes"
                                                         class: "mb-0 pt-5 pb-5 text-center"
                                                         (container
                                                          (h2 "Register for School-Year Classes")
                                                          (p "Coming Soon!")))
                                             (camps->camp-registration summer-camps))]
         [(empty? summer-camps) (list school-year-courses
                                      (jumbotron  id: "summer-camps"
                                                  class: "mb-0 pt-5 pb-5 text-center bg-white"
                                                  (container
                                                   (h2 "Register for Summer Camps")
                                                   (p "Coming Soon!"))))]
         [else (list (courses->course-registration school-year-courses)
                     (camps->camp-registration summer-camps))
          ])
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

(define (course-buy-button price sku key #:suffix [suffix ""])
  (list (button-primary id:(~a "checkout-button-" sku)
                        class: "m-0 col-sm-6" 
                        style: (properties border-radius: "0 0 0.18rem 0")
                          (~a "Enroll Now for $" price suffix))
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

(define (course-modal-buy-button price sku key #:suffix [suffix ""])
  (list (button-primary id:(~a "modal-checkout-button-" sku)
                        class: "m-0 col-sm-6" 
                        style: (properties border-radius: "0 0 0.18rem 0")
                          (~a "Enroll Now for $" price suffix))
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
  (div (div class: "btn-group d-flex justify-content-center"
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
  if (quantity <= 1) {
   document.getElementById("student-subtract-@sku").disabled = true;
  }
  if (quantity >= 5) {
   document.getElementById("student-add-@sku").disabled = true;
  }
}}
         (p class: "m-0 text-secondary text-center" "Number of Students")))

(define (modal-student-spinner sku price)
  (div (div class: "btn-group d-flex justify-content-center"
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
  if (quantity <= 1) {
   document.getElementById("modal-student-subtract-@sku").disabled = true;
  }
  if (quantity >= 5) {
   document.getElementById("modal-student-add-@sku").disabled = true;
  }
}}
         (p class: "m-0 text-secondary text-center" "Number of Students")))


(struct course (topic
                sku
                image-url
                description
                grade-range
                location
                address
                address-link
                price
                start-time
                end-time
                meeting-dates
                status       ; 'open 'almost-full 'full
                ))

(define (make-course #:topic         [topic "TBA"]
                     #:sku           [sku   ""]
                     #:image-url     [image-url ""]
                     #:description   [description "TBA"]
                     #:grade-range   [grade-range "TBA"]
                     #:location      [location "TBA"]
                     #:address       [address "TBA"]
                     #:address-link  [address-link (~a "https://www.google.com/maps/place/" (string-replace address " " "+"))]
                     #:price         [price "TBA"]
                     #:start-time    [start-time "TBA"]
                     #:end-time      [end-time "TBA"]
                     #:meeting-dates [meeting-dates '()]
                     #:status        [status 'open])
  (course topic sku image-url description grade-range location address address-link price start-time end-time meeting-dates status))

(define (course->waitlist-link course)
  (~a "mailto:contact@thoughtstem.com?subject=Waitlist - " (course-location course)
      ": " (course-topic course) " (" (course-grade-range course) ") starting on " (first (course-meeting-dates course))
      "&body=Hello, please add me to the waitlist for this class."))

(define (course->enroll-or-full-button course)
  (define key "pk_test_Jd6aRCVssUu8YfSvltaT3tvU00je9fQbkA")
  
  (define price (course-price course))
  (define sku (course-sku course))
  
  (cond [(eq? (course-status course) 'open) (course-buy-button price sku key)]
        [(eq? (course-status course) 'almost-full) (course-buy-button price sku key #:suffix " (Almost Full)")]
        [(eq? (course-status course) 'full) (a href: (course->waitlist-link course)
                                          class: "btn btn-secondary col-sm-6"
                                          style: (properties border-radius: "0 0 0.18rem 0")
                                          "Full (click to join waitlist)"
                                          )]))

(define (course->modal-enroll-or-full-button course)
  (define key "pk_test_Jd6aRCVssUu8YfSvltaT3tvU00je9fQbkA")
  
  (define price (course-price course))
  (define sku (course-sku course))
  
  (cond [(eq? (course-status course) 'open) (course-modal-buy-button price sku key)]
        [(eq? (course-status course) 'almost-full) (course-modal-buy-button price sku key #:suffix " (Almost Full)")]
        [(eq? (course-status course) 'full) (a href: (course->waitlist-link course)
                                          class: "btn btn-secondary col-sm-6"
                                          style: (properties border-radius: "0 0 0.18rem 0")
                                          "Full (click to join waitlist)"
                                          )]))

(define (course->course-card c)
  (define key "pk_test_Jd6aRCVssUu8YfSvltaT3tvU00je9fQbkA")

  (define topic (course-topic c))
  (define sku (course-sku c))
  (define image-url (course-image-url c))
  (define description (course-description c))
  (define grade-range (course-grade-range c))
  (define location (course-location c))
  (define address (course-address c))
  (define address-link (course-address-link c))
  (define price (course-price c))
  (define start-time (course-start-time c))
  (define end-time (course-end-time c))
  (define meeting-dates (course-meeting-dates c))
  (define status (course-status c))
  
  (card class: "h-100 text-center"
        (img src: image-url
             class: "card-img-top")
        (card-body
         (h5 class: "card-title" (~a topic " (" grade-range ")"))
         (table class: "table table-sm table-borderless text-left"
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
                          (course->enroll-or-full-button c))
                     (course-modal #:id (~a "details-modal-" sku)
                                   #:topic         topic
                                   #:description   description
                                   #:grade-range     grade-range
                                   #:meeting-dates meeting-dates
                                   #:start-time    start-time
                                   #:end-time      end-time
                                   #:location      location
                                   #:address       address
                                   #:address-link  address-link
                                   #:price         price
                                   #:quantity-spinner (modal-student-spinner sku price)
                                   #:buy-button (course->modal-enroll-or-full-button c)))
        )
  )

(define (courses->course-registration courses)
  (define course-cards (map course->course-card courses))
  (jumbotron  id: "school-year-classes"
              class: "mb-0 pt-5 pb-5 text-center"
              (container
               (h2 "Register for School-Year Classes")
               (if (> (length course-cards) 1)
                   (apply row (map (curry div class: "col-md-6 col-xs-12 my-3 mx-auto")
                               course-cards))
                   (apply row (map (curry div class: "col-lg-6 col-md-8 col-xs-12 my-3 mx-auto")
                               course-cards)))
               (p "By enrolling in any of these sessions, you agree to the " (link-to terms-and-conditions-path
                                                                                      "terms and conditions") ".")
               )
              ))

(define (summer-camps-links-section)
  (row id: "summer-buttons" ;abstract to responsive-row-md?
   (div class: "col-md-6 col-xs-12 my-2"
        (a href: "#k-2-summer-options" style: (properties 'text-decoration: "none")
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
            (img src: (prefix/pathify city-summer-camp-img-path) 
                 class: "img-fluid rounded"))
       ))

(define (summer-camp-pricing-at location-name)
  (row class: "align-items-center"
       (div class: "col-lg-4 col-xs-12 p-4"
            (img src: (prefix/pathify city-summer-camp-pricing-img-path)
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

(define (camps->camp-registration camps)
  (define location-name (camp-location (first camps)))
  
  (define (k-2-camp? c)
    (string-contains? (camp-grade-range c) "K - 2nd"))
  (define (3-6-camp? c)
    (string-contains? (camp-grade-range c) "3rd - 6th"))
  
  (define k-2-camps (filter k-2-camp? camps))
  (define 3-6-camps (filter 3-6-camp? camps))
  
  (list (jumbotron  id: "summer-camps"
              class: "mb-0 pt-5 pb-5 text-center bg-white"
              (container
               (h2  "Register for Summer Camps")
               (summer-camps-links-section)
               (summer-camps-info-section location-name)
               
               (br id: "k-2-summer-options")
               (h5 class: "mt-5"
                   "Summer Camp Schedule for Students Entering K-2nd")
               (camps->camp-calendar k-2-camps)
               (br id: "3-6-summer-options")
               (h5 class: "mt-5"
                   "Summer Camp Schedule for Students Entering 3rd-6th")
               (camps->camp-calendar 3-6-camps)
               (summer-camp-pricing-at location-name)
               (p "By enrolling in any of these sessions, you agree to the " (link-to terms-and-conditions-path
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

(struct camp (topic
              sku
              image-url
              description
              grade-range
              location
              address
              address-link
              price
              check-in-time
              camp-time
              lunch-time
              pickup-time
              meeting-dates
              status))

(define (make-camp #:topic         [topic ""]
                   #:sku           [sku   ""]
                   #:image-url     [image-url ""]
                   #:description   [description ""]
                   #:grade-range   [grade-range ""]
                   #:location      [location ""]
                   #:address       [address ""]
                   #:address-link  [address-link ""]
                   #:price         [price 300]
                   #:check-in-time [check-in-time ""]
                   #:camp-time     [camp-time ""]
                   #:lunch-time    [lunch-time  ""]
                   #:pickup-time   [pickup-time ""]
                   #:meeting-dates [meeting-dates '()]
                   #:status        [status 'open])
  (camp topic sku image-url description grade-range location address address-link price check-in-time camp-time lunch-time pickup-time meeting-dates status))

(define (course-modal #:id modal-id
                      #:topic topic
                      #:description   description
                      #:grade-range   grade-range
                      #:meeting-dates meeting-dates
                      #:start-time    start-time
                      #:end-time      end-time
                      #:location      location
                      #:address       address
                      #:address-link  address-link
                      #:price         price
                      #:quantity-spinner quantity-spinner
                      #:buy-button    buy-button)
  (modal id: modal-id 'tabindex: "-1" role: "dialog"
     (modal-dialog class: "modal-lg modal-dialog-centered"
        (modal-content
          (modal-header class: "bg-primary p-2 pl-3 pr-3 text-white h5 m-0" (~a location " - " topic " (" grade-range ")"))
          (modal-body
           (row class: "text-left"
                (col-lg-6 class: "col-xs-12"
                 (table class: "table table-striped table-bordered"
                  (tr (td (b "Grades: ")) (td grade-range))
                  (tr (td (b "Total Meetings: ")) (td (length meeting-dates)))
                  (tr (td (b "Meets on: ")) (td (~a (meeting-date->weekday (first meeting-dates)) "s")))
                  (tr (td (b "Time: ")) (td start-time " - " end-time))
                  (tr (td (b "Start Date: ")) (td (first meeting-dates)))
                  (tr (td (b "Location: ")) (td location (br) (a target:"_blank" href: address-link address)))
                  (tr (td (b "Price: ")) (td (~a "$" price)))
                  (tr (td (b "Schedule: ")) (td (print-dates meeting-dates)))))
                (col-lg-6 class: "col-xs-12 d-flex flex-column justify-content-between"
                 (div (h5 "Course Description:")
                      (p description))
                 quantity-spinner
                 )))
          (modal-footer class: "text-center p-0"
           (div class: "btn-group w-100"
                (button-secondary class: "m-0 col-sm-6"
                                  style: (properties border-radius: "0 0 0 0.18rem")
                                  'data-dismiss: "modal"
                   "Close")
                buy-button))))))

(define (camp->enroll-or-full-button camp)
  (cond [(eq? (camp-status camp) 'open) (a href: "#"
                                           class: "btn btn-primary btn-sm"
                                           'data-toggle: "modal" 'data-target: (~a "#camp-enroll-modal-" (camp-sku camp))
                                           ;(button-primary class: "btn-sm"
                                           "Enroll"
                                           ;)
                                           )]
        [(eq? (camp-status camp) 'almost-full) (a href: "#"
                                                  class: "btn btn-primary btn-sm"
                                                  'data-toggle: "modal" 'data-target: (~a "#camp-enroll-modal-" (camp-sku camp))
                                                  ;(button-primary class: "btn-sm"
                                                  "Enroll (Almost Full)"
                                                  ;)
                                                  )]
        [(eq? (camp-status camp) 'full) (a href: "#"
                                          class: "btn btn-secondary btn-sm"
                                          'data-toggle: "modal" 'data-target: (~a "#camp-full-modal-" (camp-sku camp))
                                          ;(button-secondary class: "btn-sm"
                                          "Full (click to join waitlist)"
                                          ;)
                                          )]))

(define (camps->camp-calendar camps)
  (define topics-list (remove-duplicates (map camp-topic camps)))

  (define (topic->row topic)
    (define topic-camps (filter (λ(c) (eq? (camp-topic c) topic)) camps))
    (define grade-range (camp-grade-range (first topic-camps)))
    (tr (td class: "p-1 align-middle"
            style: (properties border-right: "none"
                               width: "1rem")
            (img src: (camp-image-url (first topic-camps))
                 class: "rounded"
                 width: "100rem"
                 height: "100rem"
                 style: (properties object-fit: "cover")))
        (td class: "text-left"
            style: (properties border-left: "none")
            (strong topic) (br)
            "Grades: " grade-range (br)
            (a href: "#"
               'data-toggle: "modal" 'data-target: (~a "#topic-info-modal-" (camp-sku (first topic-camps)))
               (button-secondary class: "btn-sm mt-2" "Camp Info"))
            (camp->topic-info-modal (first topic-camps)))
        (td (camp->enroll-or-full-button (first topic-camps)) (br)
            (camp-camp-time (first topic-camps)) (br)
            (~a "$" (camp-price (first topic-camps)))
            (if (eq? (camp-status (first topic-camps)) 'full)
                (camp->camp-full-modal  (first topic-camps))
                (camp->camp-enroll-modal (first topic-camps))))
        (td) (td) (td) (td)))

  ;TODO: Make this a dynamic table
  (div class: "table-responsive"
   (apply (curry table class: "table table-striped table-bordered bg-white text-center"
                (thead (tr (th class: "text-left"
                               'scope: "col"
                               'colspan: 2
                               "Courses")
                           (th 'scope: "col" "Jun 15 - 19") ;earliest date-range of camps
                           (th 'scope: "col" "Jun 22 - 26")
                           (th 'scope: "col" "Jun 29 - Jul 3")
                           (th 'scope: "col" "July 6 - 10")
                           (th 'scope: "col" "July 13 - 17") ;latest date-range of camps
                           )))
         (map topic->row topics-list)

         ))
  )

(define (camp->camp-enroll-modal camp)
  (define location  (camp-location camp))
  (define topic     (camp-topic camp))
  (define sku       (camp-sku camp))
  (define grade-range (camp-grade-range camp))
  (define image-url (camp-image-url camp))
  (define check-in-time (camp-check-in-time camp))
  (define camp-time (camp-camp-time camp))
  (define lunch-time (camp-lunch-time camp))
  (define pickup-time (camp-pickup-time camp))
  (define meeting-dates (camp-meeting-dates camp))
  (define price (camp-price camp))
  (define description (camp-description camp))
  (define address (camp-address camp))
  (define address-link (camp-address-link camp))
  (define modal-id (~a "camp-enroll-modal-" sku))
  
  (define modal-buy-button (camp-buy-button price sku "pk_test_Jd6aRCVssUu8YfSvltaT3tvU00je9fQbkA"))
  
  (modal id: modal-id 'tabindex: "-1" role: "dialog"
     (modal-dialog class: "modal-lg modal-dialog-centered"
        (modal-content
          (modal-header class: "bg-primary p-2 pl-3 pr-3 text-white h5 m-0" (~a location " - " topic " (" grade-range ")"))
          (modal-body
           (row class: "text-left"
                (col-lg-6 class: "col-xs-12"
                 (img src: image-url
                      class: "img-fluid rounded")
                 (h5 class: "mt-4" "Camp Schedule")
                 (table class: "table table-striped table-bordered"
                   (tr (td (b "Check-in:")) (td check-in-time))
                   (tr (td (b "Camp Activities:")) (td camp-time)
                   (tr (td (b "Lunchtime:")) (td lunch-time))
                   (tr (td (b "Pick-up:")) (td pickup-time))
                   (tr (td (b "Grades: ")) (td grade-range))
                   (tr (td (b "Start Date: ")) (td (first meeting-dates)))
                   (tr (td (b "Location: ")) (td location (br) (a target:"_blank" href: address-link address)))
                   (tr (td (b "Price: ")) (td (~a "$" price)))
                   (tr (td (b "Dates: ")) (td (print-dates meeting-dates)))))
                 )
                (col-lg-6 class: "col-xs-12"
                 (h5 "Camp Description")
                 (p description)
                 (h5 "What's Included?")
                 (ul (li "6:1 student-to-instructor ratio")
                     (li "A week full of coding fun!")
                     (if lunch-time (li "All-you-can-eat lunch at the campus dining hall") '())
                     (li "Outdoor time, team-building, & teamerwork excercises"))
                 (h5 "How to Purchase")
                 (p "To purchase this one half-day camp, use the Enroll Now button below. Alternatively, if you plan to purchase multiple half-day camps, download our registration form below to receive additional discounts! The registration form is best if you plan to purchase both a morning & afternoon camp to make a full-day camp OR if you plan to purchase multiple camp weeks.")
                 (br)
                 (p "By enrolling in any of these sessions, you agree to the " (link-to terms-and-conditions-path
                                                                                      "terms and conditions") ".")
                 )))
          (modal-footer class: "text-center p-0"
           (div class: "btn-group w-100"
                (button-secondary class: "m-0 col-sm-4"
                                  style: (properties border-radius: "0 0 0 0.20rem")
                                  'data-dismiss: "modal"
                   "Close")
                (a href: "registration-form.pdf"
                   class: "btn btn-warning m-0 col-sm-4"
                   style: (properties border-radius: "0 0 0 0")
                   "Download Form")
                modal-buy-button))))))

(define (camp->waitlist-link camp)
  (~a "mailto:contact@thoughtstem.com?subject=Waitlist - " (camp-location camp)
      ": " (camp-topic camp) " (" (camp-grade-range camp) ") starting on " (first (camp-meeting-dates camp))
      "&body=Hello, please add me to the waitlist for this class."))

(define (camp->camp-full-modal camp)
  (define location  (camp-location camp))
  (define topic     (camp-topic camp))
  (define sku       (camp-sku camp))
  (define grade-range (camp-grade-range camp))
  (define image-url (camp-image-url camp))
  (define check-in-time (camp-check-in-time camp))
  (define camp-time (camp-camp-time camp))
  (define lunch-time (camp-lunch-time camp))
  (define pickup-time (camp-pickup-time camp))
  (define meeting-dates (camp-meeting-dates camp))
  (define price (camp-price camp))
  (define description (camp-description camp))
  (define address (camp-address camp))
  (define address-link (camp-address-link camp))
  (define modal-id (~a "camp-full-modal-" sku))
  
  ;(define modal-buy-button (camp-buy-button price sku "pk_test_Jd6aRCVssUu8YfSvltaT3tvU00je9fQbkA"))
  (define camp-full-button (a href: (camp->waitlist-link camp)
                              class: "btn btn-primary m-0 col-sm-6"
                              ;(button-primary
                              id:(~a "waitlist-button-") ;TODO: pass in info to a dynamic form if possible
                              ;class: "m-0 col-sm-6" 
                              style: (properties border-radius: "0 0 0.20rem 0")
                              (~a "Join Waitlist")
                              ;)
                              ))
  
  (modal id: modal-id 'tabindex: "-1" role: "dialog"
     (modal-dialog class: "modal-lg modal-dialog-centered"
        (modal-content
          (modal-header class: "bg-primary p-2 pl-3 pr-3 text-white h5 m-0" (~a location " - " topic " (" grade-range ")"))
          (modal-body
           (row class: "text-left"
                (col-lg-6 class: "col-xs-12"
                 (img src: image-url
                      class: "img-fluid rounded")
                 (h5 class: "mt-4" "Camp Schedule")
                 (table class: "table table-striped table-bordered"
                   (tr (td (b "Check-in:")) (td check-in-time))
                   (tr (td (b "Camp Activities:")) (td camp-time)
                   (tr (td (b "Lunchtime:")) (td lunch-time))
                   (tr (td (b "Pick-up:")) (td pickup-time))
                   (tr (td (b "Grades: ")) (td grade-range))
                   (tr (td (b "Start Date: ")) (td (first meeting-dates)))
                   (tr (td (b "Location: ")) (td location (br) (a target:"_blank" href: address-link address)))
                   (tr (td (b "Price: ")) (td (~a "$" price)))
                   (tr (td (b "Dates: ")) (td (print-dates meeting-dates)))))
                 )
                (col-lg-6 class: "col-xs-12"
                 (h5 "Camp Description")
                 (p description)
                 (h5 "What's Included?")
                 (ul (li "6:1 student-to-instructor ratio")
                     (li "A week full of coding fun!")
                     (if lunch-time (li "All-you-can-eat lunch at the campus dining hall") '())
                     (li "Outdoor time, team-building, & teamerwork excercises"))
                 (h5 "How to Purchase")
                 (p "Unfortunately, this camp is full. To join the waitlist, click the button below.")
                 (br)
                 (p "By enrolling in any of these sessions, you agree to the " (link-to terms-and-conditions-path
                                                                                      "terms and conditions") ".")
                 )))
          (modal-footer class: "text-center p-0"
           (div class: "btn-group w-100"
                (button-secondary class: "m-0 col-sm-6"
                                  style: (properties border-radius: "0 0 0 0.20rem")
                                  'data-dismiss: "modal"
                   "Close")
                camp-full-button))))))

(define (camp->topic-info-modal camp)
  (define location  (camp-location camp))
  (define topic     (camp-topic camp))
  (define sku       (camp-sku camp))
  (define grade-range (camp-grade-range camp))
  (define image-url (camp-image-url camp))
  
  (define description (camp-description camp))
  (define address (camp-address camp))
  (define address-link (camp-address-link camp))
  (define modal-id (~a "topic-info-modal-" sku))
  
  (modal id: modal-id 'tabindex: "-1" role: "dialog"
     (modal-dialog class: "modal-lg modal-dialog-centered"
        (modal-content
          (modal-header class: "bg-primary p-2 pl-3 pr-3 text-white h5 m-0" (~a location " - " topic " (" grade-range ")"))
          (modal-body
           (row class: "text-left"
                (col-lg-6 class: "col-xs-12"
                 (img src: image-url
                      class: "img-fluid rounded mb-4")
                 ;(h5 class: "mt-4" topic)
                 (table class: "table table-striped table-bordered"
                   (tr (td (b "Grades: ")) (td grade-range))
                   (tr (td (b "Location: ")) (td location (br) (a target:"_blank" href: address-link address))))
                 (h5 "What's Included?")
                 (ul (li "6:1 student-to-instructor ratio")
                     (li "A week full of coding fun!")
                     (li "All-you-can-eat lunch at the campus dining hall (morning camps only)")
                     (li "Outdoor time, team-building, & teamerwork excercises"))
                 )
                (col-lg-6 class: "col-xs-12"
                 (h5 "Camp Description")
                 (p description)
                 (h5 "How to Purchase")
                 (p "To purchase a half-day camp, choose a week from the schedule and click on Enroll.")
                 (p "Alternatively, if you plan to purchase multiple half-day camps, download our registration form below to receive additional discounts! The registration form is best if you plan to purchase both a morning & afternoon camp to make a full-day camp OR if you plan to purchase multiple camp weeks.")
                 (br)
                 (p "By enrolling in any of these sessions, you agree to the " (link-to terms-and-conditions-path
                                                                                      "terms and conditions") ".")
                 )))
          (modal-footer class: "text-center p-0"
           (div class: "btn-group w-100"
                (button-secondary class: "m-0 col-sm-6"
                                  style: (properties border-radius: "0 0 0 0.20rem")
                                  'data-dismiss: "modal"
                   "Close")
                (a href: "registration-form.pdf"
                   class: "btn btn-warning m-0 col-sm-6"
                   style: (properties border-radius: "0 0 0.20rem 0")
                   "Download Form")))))))
