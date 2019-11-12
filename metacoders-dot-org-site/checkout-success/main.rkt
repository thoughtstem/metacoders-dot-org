#lang at-exp racket

(provide checkout-success)
(require metacoders-dot-org-lib)

(define (checkout-success)
  (page checkout-success-top-path
        (normal-content
          (h1 "Payment Success!")
          (p "You will receive an email with your receipt shortly.")
          (br)
          (h4 "Now we need the student's details!")
          (p "Click on the button below to open the form.")
          (a href:"https://docs.google.com/forms/d/e/1FAIpQLSeo6vHe7gyNLl-BLNfOWIGmHyj3tN7Y7WNhsfH49DokINyt5Q/viewform"
             class:"btn btn-info"
             'role: "button"
             "Finish Enrollment")
          (br)
          )))
