#lang at-exp racket 

(provide course-card
         location-courses)

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
   style: (properties
           margin: 10
           height: 1000
           width:  600)
   (h1 style:(properties text-align: "center")
       title)
   (card-body
    (h3 topic)
    (h5 (strong "Grades: " age-range))
    (h5 (strong "Start Date: ") (first meeting-dates) " @ " start-time)
    (card-img-top
     src: image-url
     style: (properties
             width: 550))
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
    style: (properties
            position: "absolute"
            left: "50%"
            margin-left: -600)
    (row
     (col-5
      course-1)
     (col-5
      style:
      (properties
       margin-left: 50)
      course-2)))
   (div style: (properties height: 1000))
  ))