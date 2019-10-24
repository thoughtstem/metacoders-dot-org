#lang racket

(require website metacoders-dot-org-site)

(with-prefix "metacoders-dot-org"
             (render (metacoders.org) #:to "out"))
