#lang racket

(provide imgs
         logo-img-path
         stephen-img-path
         lindsey-img-path
         judith-img-path
         jordan-img-path
         jason-img-path
         sonny-img-path
         sara-img-path
         brain-img-path
         games-img-path
         story-img-path
         takes-a-village-path
         homepage-cover-img-path)

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
(define games-img-path
  (list "img" "games.png"))
(define brain-img-path
  (list "img" "brain.png"))
(define story-img-path
  (list "img" "story.png"))
(define takes-a-village-path
  (list "img" "takes-a-village.png"))
(define homepage-cover-img-path
  (list "img" "homepage-cover.png"))

(define river-img-path
  (list "img" "river.png"))

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
    (page games-img-path
          (bitmap/file (build-path img "games.png")))
    (page brain-img-path
          (bitmap/file (build-path img "brain.png")))
    (page story-img-path
          (bitmap/file (build-path img "story.png")))
    (page takes-a-village-path
          (bitmap/file (build-path img "takes-a-village.png")))
    (page homepage-cover-img-path
          (bitmap/file (build-path img "homepage-cover.png")))
    (page logo-img-path
          (bitmap/file (build-path img "logo.png"))) 

    (page river-img-path
          (bitmap/file (build-path img "river.png"))) 
    ))



