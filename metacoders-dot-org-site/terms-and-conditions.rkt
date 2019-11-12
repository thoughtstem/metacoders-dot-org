#lang racket

(provide terms-and-conditions)

(require metacoders-dot-org-lib)

(define (terms-and-conditions)
  (page terms-and-conditions-path
        (normal-content
          (h1 "Terms and Conditions")
          (terms-for-refunds)
          (terms-for-late-pickup-fees)
          (terms-for-multi-session-discounts)
          (terms-for-students-arriving-to-class)
          (terms-for-student-pickup-after-class)
          (terms-for-phonecalls-texts)
          (terms-for-media-policy)
          (privacy-policy)
          (miscellaneous)         
)))



(define (terms-for-refunds)
  (container
    (h3 "MetaCoders Refund/Cancellation Policy")
    (p "Parents who wish to cancel an enrollment for a future class may do so for a full refund except as follows:")
    (ul
      (li "Cancellations less than 24 hours before class start will be eligible for a full refund minus a $40 cancellation fee.")
      (li "Cancellations less than 1 week before class start will be eligible for a full refund minus a $20 cancellation fee.")
      (li "Cancellations/withdrawals after the first meeting but before the second class meeting will be a partial refund (we will charge for the cost of the single class) minus a $40 cancellation fee.")
      (li "Cancellations from the second class meeting to the halfway point of the session will be a refund of 50% of the tuition.")
      (li "No refund after the halfway point of the session."))
    (p "NOTE: These terms and conditions only apply when purchases are made on ThoughtSTEM’s website (http://secure.thoughtstem.com). Purchases of ThoughtSTEM programs made on other websites, like on Fleet Science Center or Del Mar Union websites, have their own Terms and Conditions which supersede these.")))
          


(define (terms-for-late-pickup-fees)
  (container
      (h3 "MetaCoders Late Pick-up Fee")))

(define (terms-for-multi-session-discounts)
  (container
      (h3 "MetaCoders Multi-Session Discount")))

(define (terms-for-students-arriving-to-class)
  (container
      (h3 "Students Arriving to Class Policy")))

(define (terms-for-student-pickup-after-class)
  (container
      (h3 "Student Pick-up After Class Policy")))

(define (terms-for-phonecalls-texts)
  (container
      (h3 "Auto Opt-in to Phonecalls & Non-Automated Texts")))

(define (terms-for-media-policy)
  (container
      (h3 "MetaCoders Media Policy")))

(define (privacy-policy)
  (container
      (h3 "MetaCoders Privacy Policy")))

(define (miscellaneous)
  (container
      (h3 "Miscellaneous Policies")))
          
          
          
          
          
          
                   
