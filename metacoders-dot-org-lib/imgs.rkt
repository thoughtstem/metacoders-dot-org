#lang racket

(provide imgs
         logo-img-path
         stephen-img-path
         lindsey-img-path
         judith-img-path
         jordan-img-path
         jason-img-path
         sonny-img-path
         sara-img-path)

(require website/bootstrap
         (only-in 2htdp/image bitmap/file)
         racket/runtime-path)

(define-runtime-path img "img")

(define logo-img-path
  (list "img" "logo.png"))

(define stephen-img-path
  (list "img" "stephen.png"))
(define lindsey-img-path
  (list "img" "lindsey.png"))
(define judith-img-path
  (list "img" "judith.png"))
(define jordan-img-path
  (list "img" "jordan.png"))
(define sara-img-path
  (list "img" "sara.png"))
(define jason-img-path
  (list "img" "jason.png"))
(define sonny-img-path
  (list "img" "sonny.png"))

(define (imgs)
  (list 
    (page stephen-img-path
          (bitmap/file (build-path img "stephen.png"))) 
    (page lindsey-img-path
          (bitmap/file (build-path img "lindsey.png"))) 
    (page judith-img-path
          (bitmap/file (build-path img "judith.png"))) 
    (page jordan-img-path
          (bitmap/file (build-path img "jordan.png"))) 
    (page sara-img-path
          (bitmap/file (build-path img "sara.png"))) 
    (page jason-img-path
          (bitmap/file (build-path img "jason.png"))) 
    (page sonny-img-path
          (bitmap/file (build-path img "sonny.png"))) 

    (page logo-img-path
          (bitmap/file (build-path img "logo.png"))) 

    ))



