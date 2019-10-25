#lang racket 

(provide email-signup)

(require website/bootstrap)

(define (email-signup)
  (card
    (card-body
      (card-title "Apply Now!")
      (form action: "https://docs.google.com/forms/u/1/d/e/1FAIpQLScqxPx0LO9PLJF0mltgUlWbUv7t1urtmsWa3UN6om-XYAYcqw/formResponse"
            (b "Email")
            (br)
            (input type: "text" name: "entry.2688262")
            (br)
            (br)
            (b "Message")
            (br)
            (textarea name: "entry.1000001" rows: "3" cols: "40")
            (br)
            (br)
            (button-secondary type: "submit" name: "submit"
                              "Submit")
            ))))
