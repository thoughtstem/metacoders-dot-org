#lang racket

(provide imgs
         logo-img-path
         lindsey-img-path
         judith-img-path
         sonny-img-path
         sara-img-path
         brain-img-path
         games-img-path
         story-img-path
         takes-a-village-path
         takes-a-village-2-path
         takes-a-village-3-path
         takes-a-village-4-path
         homepage-banner-path
         join-our-team-banner-path
         coding-coach-img-path
         summer-camp-intern-img-path
         summer-camp-intern-banner-path
         volunteer-scientist-img-path
         volunteer-coder-img-path
         equipment-img-path
         tech-coordinator-img-path
         
         world-img-path
         partners-img-path
         )

(require website/bootstrap
         (only-in 2htdp/image bitmap/file)
         racket/runtime-path)

(define-runtime-path img "img")

(define logo-img-path
  (list "img" "logo.png"))

(define lindsey-img-path
  (list "img" "lindsey.jpg"))
(define judith-img-path
  (list "img" "judith.jpg"))
(define sara-img-path
  (list "img" "sara.jpg"))
(define sonny-img-path
  (list "img" "sonny.jpg"))
(define games-img-path
  (list "img" "games.png"))
(define brain-img-path
  (list "img" "brain.png"))
(define story-img-path
  (list "img" "story.png"))
(define takes-a-village-path
  (list "img" "takes-a-village.jpg"))
(define takes-a-village-2-path
  (list "img" "takes-a-village-2.jpg"))
(define takes-a-village-3-path
  (list "img" "takes-a-village-3.jpg"))
(define takes-a-village-4-path
  (list "img" "takes-a-village-4.jpg"))
(define homepage-banner-path
  (list "img" "homepage-banner.jpg"))
(define join-our-team-banner-path
  (list "img" "join-our-team-banner.jpg"))
(define coding-coach-img-path
  (list "img" "coding-coach.jpg"))
(define volunteer-scientist-img-path
  (list "img" "volunteer-scientist.jpg"))
(define volunteer-coder-img-path
  (list "img" "volunteer-coder.jpg"))
(define summer-camp-intern-img-path
  (list "img" "summer-camp-intern.jpg"))
(define summer-camp-intern-banner-path
  (list "img" "summer-camp-intern-banner.jpg"))
(define tech-coordinator-img-path
  (list "img" "tech-coordinator.jpg"))
(define equipment-img-path
  (list "img" "equipment.jpg"))

(define river-img-path
  (list "img" "river.png"))

(define world-img-path
  (list "img" "world-map.jpg"))

(define partners-img-path
  (list "img" "partners-banner.jpg"))

(define (imgs)
  (list 
    (page lindsey-img-path
          (bitmap/file (build-path img "lindsey.jpg"))) 
    (page judith-img-path
          (bitmap/file (build-path img "judith.jpg"))) 
    (page sara-img-path
          (bitmap/file (build-path img "sara.jpg"))) 
    (page sonny-img-path
          (bitmap/file (build-path img "sonny.jpg"))) 
    (page games-img-path
          (bitmap/file (build-path img "games.png")))
    (page brain-img-path
          (bitmap/file (build-path img "brain.png")))
    (page story-img-path
          (bitmap/file (build-path img "story.png")))
    (page takes-a-village-path
          (bitmap/file (build-path img "takes-a-village.jpg")))
    (page takes-a-village-2-path
          (bitmap/file (build-path img "takes-a-village-2.jpg")))
    (page takes-a-village-3-path
          (bitmap/file (build-path img "takes-a-village-3.jpg")))
    (page takes-a-village-4-path
          (bitmap/file (build-path img "takes-a-village-4.jpg")))
    (page homepage-banner-path
          (bitmap/file (build-path img "homepage-banner.jpg")))
    (page logo-img-path
          (bitmap/file (build-path img "logo.png")))
    (page join-our-team-banner-path
          (bitmap/file (build-path img "join-our-team-banner.jpg")))
    (page coding-coach-img-path
          (bitmap/file (build-path img "coding-coach.jpg")))
    (page volunteer-scientist-img-path
          (bitmap/file (build-path img "volunteer-scientist.jpg")))
    (page summer-camp-intern-img-path
          (bitmap/file (build-path img "summer-camp-intern.jpg")))
    (page summer-camp-intern-banner-path
          (bitmap/file (build-path img "summer-camp-intern-banner.jpg")))

    (page volunteer-coder-img-path
          (bitmap/file (build-path img "volunteer-coder.jpg")))
    (page tech-coordinator-img-path
          (bitmap/file (build-path img "tech-coordinator.jpg")))
    (page equipment-img-path
          (bitmap/file (build-path img "equipment.jpg")))

    (page river-img-path
          (bitmap/file (build-path img "river.png")))
    (page world-img-path
          (bitmap/file (build-path img "world-map.jpg")))
    (page partners-img-path
          (bitmap/file (build-path img "partners-banner.jpg")))

    ))
