#lang racket

(provide imgs
         logo-img-path
         lindsey-img-path
         judith-img-path
         sonny-img-path
         sara-img-path
         brain-svg-path
         games-svg-path
         story-svg-path
         takes-a-village-path
         takes-a-village-2-path
         summer-camps-img-path
         homepage-banner-path
         join-our-team-banner-path
         learn-more-banner-path
         coding-coach-img-path
         coding-coach-banner-path
         summer-camp-intern-img-path
         summer-camp-intern-banner-path
         volunteer-scientist-img-path
         volunteer-scientist-banner-path
         volunteer-coder-img-path
         tech-coordinator-img-path
         tech-coordinator-banner-path
         in-school-img-path
         weekly-classes-img-path
         donate-banner-path
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
(define games-svg-path
  (list "img" "games.svg"))
(define brain-svg-path
  (list "img" "brain.svg"))
(define story-svg-path
  (list "img" "story.svg"))
(define takes-a-village-path
  (list "img" "takes-a-village.jpg"))
(define takes-a-village-2-path
  (list "img" "takes-a-village-2.jpg"))
(define summer-camps-img-path
  (list "img" "summer-camps.jpg"))
(define homepage-banner-path
  (list "img" "homepage-banner.jpg"))
(define join-our-team-banner-path
  (list "img" "join-our-team-banner.jpg"))
(define learn-more-banner-path
  (list "img" "learn-more-banner.jpg"))
(define coding-coach-img-path
  (list "img" "coding-coach.jpg"))
(define coding-coach-banner-path
  (list "img" "coding-coach-banner.jpg"))
(define volunteer-scientist-img-path
  (list "img" "volunteer-scientist.jpg"))
(define volunteer-scientist-banner-path
  (list "img" "volunteer-scientist-banner.jpg"))
(define volunteer-coder-img-path
  (list "img" "volunteer-coder.jpg"))
(define summer-camp-intern-img-path
  (list "img" "summer-camp-intern.jpg"))
(define summer-camp-intern-banner-path
  (list "img" "summer-camp-intern-banner.jpg"))
(define tech-coordinator-img-path
  (list "img" "tech-coordinator.jpg"))
(define tech-coordinator-banner-path
  (list "img" "tech-coordinator-banner.jpg"))
(define in-school-img-path
  (list "img" "in-school.jpg"))
(define weekly-classes-img-path
  (list "img" "weekly-classes.jpg"))
(define donate-banner-path
  (list "img" "donation-banner.jpg"))

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
    (page games-svg-path
          (file->string (build-path img "games.svg")))
    (page brain-svg-path
          (file->string (build-path img "brain.svg")))
    (page story-svg-path
          (file->string (build-path img "story.svg")))
    (page takes-a-village-path
          (bitmap/file (build-path img "takes-a-village.jpg")))
    (page takes-a-village-2-path
          (bitmap/file (build-path img "takes-a-village-2.jpg")))
    (page summer-camps-img-path
          (bitmap/file (build-path img "summer-camps.jpg")))
    (page homepage-banner-path
          (bitmap/file (build-path img "homepage-banner.jpg")))
    (page logo-img-path
          (bitmap/file (build-path img "logo.png")))
    (page join-our-team-banner-path
          (bitmap/file (build-path img "join-our-team-banner.jpg")))
    (page learn-more-banner-path
          (bitmap/file (build-path img "learn-more-banner.jpg")))
    (page coding-coach-img-path
          (bitmap/file (build-path img "coding-coach.jpg")))
    (page coding-coach-banner-path
          (bitmap/file (build-path img "coding-coach-banner.jpg")))
    (page volunteer-scientist-img-path
          (bitmap/file (build-path img "volunteer-scientist.jpg")))
    (page volunteer-scientist-banner-path
          (bitmap/file (build-path img "volunteer-scientist-banner.jpg")))
    (page summer-camp-intern-img-path
          (bitmap/file (build-path img "summer-camp-intern.jpg")))
    (page summer-camp-intern-banner-path
          (bitmap/file (build-path img "summer-camp-intern-banner.jpg")))

    (page volunteer-coder-img-path
          (bitmap/file (build-path img "volunteer-coder.jpg")))
    (page tech-coordinator-img-path
          (bitmap/file (build-path img "tech-coordinator.jpg")))
    (page tech-coordinator-banner-path
          (bitmap/file (build-path img "tech-coordinator-banner.jpg")))
    (page weekly-classes-img-path
          (bitmap/file (build-path img "weekly-classes.jpg")))
    (page donate-banner-path
          (bitmap/file (build-path img "donation-banner.jpg")))
    (page in-school-img-path
          (bitmap/file (build-path img "in-school.jpg")))

    (page river-img-path
          (bitmap/file (build-path img "river.png")))
    (page world-img-path
          (bitmap/file (build-path img "world-map.jpg")))
    (page partners-img-path
          (bitmap/file (build-path img "partners-banner.jpg")))

    ))
