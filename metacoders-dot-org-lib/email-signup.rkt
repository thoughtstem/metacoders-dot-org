#lang racket 

(provide email-signup)

(require website/bootstrap)

(define (email-signup
          #:class [classes ""]
          )
  (card class: classes
   ;(card-header "Reach Out To Us")
    (card-body
      ;(card-title "Reach out for more information:")
      (form action: "https://docs.google.com/forms/u/1/d/e/1FAIpQLScqxPx0LO9PLJF0mltgUlWbUv7t1urtmsWa3UN6om-XYAYcqw/formResponse"
        (div class:"form-group"
          (label "Email")
          (input type:"email" class: "form-control" name: "entry.2688262"))
        (div class:"form-group"  
          (label "Message")
          (textarea class: "form-control" name: "entry.1000001" rows: "3" cols: "40"))
        (button-primary type: "submit" name: "submit"
                          "Submit")))))
