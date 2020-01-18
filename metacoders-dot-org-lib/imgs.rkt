#lang racket

(provide imgs
         lindsey-img-path
         judith-img-path
         sonny-img-path
         sara-img-path
         brain-svg-path
         games-svg-path
         story-svg-path
         takes-a-village-path
         takes-a-village-2-path
         takes-a-village-3-path
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
         volunteer-coder-banner-path
         tech-coordinator-img-path
         tech-coordinator-banner-path
         in-school-img-path
         city-summer-camp-img-path
         city-summer-camp-pricing-img-path
         city-weekly-class-img-path
         weekly-classes-img-path
         donate-banner-path
         world-img-path
         partners-img-path

         chula-vista-banner-path
         dallas-banner-path
         minneapolis-banner-path
         poway-banner-path
         reno-banner-path
         temecula-banner-path
         washington-dc-banner-path
         new-orleans-banner-path

         battlearena-mp4-path
         k2-animal-mp4-path
         k2-clicker-cartoon-mp4-path
         survival-mp4-path

         battlearena-webm-path
         k2-animal-webm-path
         k2-clicker-cartoon-webm-path
         survival-webm-path
         )

(require website/bootstrap
         (only-in 2htdp/image bitmap/file)
         racket/runtime-path)

(define-runtime-path img "img")

(define homepage-banner-path
  (list "img" "home" "child-coding-in-weekly-class-camp.jpg"))
(define lindsey-img-path
  (list "img" "home" "lindsey-handley-metacoders-co-founder-vice-president.jpg"))
(define judith-img-path
  (list "img" "home" "judith-eisenberg-coding-educator.jpg"))
(define sara-img-path
  (list "img" "home" "sara-lucchini-computer-science-curriculum-developer.jpg"))
(define sonny-img-path
  (list "img" "home" "sonny-najar-programming-language-developer.jpg"))
(define games-svg-path
  (list "img" "home" "games-classroom-gamification.svg"))
(define brain-svg-path
  (list "img" "home" "brain-metacognition.svg"))
(define story-svg-path
  (list "img" "home" "storytelling-for-education.svg"))
(define takes-a-village-path
  (list "img" "home" "coding-summer-camp-interns-fun.jpg"))
(define takes-a-village-2-path
  (list "img" "home" "computer-science-summer-educators-collage.jpg"))
(define takes-a-village-3-path
  (list "img" "home" "coding-coaches-for-grassroots-education.jpg"))
(define summer-camps-img-path
  (list "img" "learn-more" "summer-computer-science-camps-for-students.jpg"))
(define join-our-team-banner-path
  (list "img" "learn-more" "fun-at-coding-camps-for-k-12-lg.jpg"))
(define in-school-img-path
  (list "img" "learn-more" "in-school-coding-educators-for-k-12.jpg"))
(define weekly-classes-img-path
  (list "img" "learn-more" "weekly-coding-classes-for-kids-k-12.jpg"))
(define coding-coach-img-path
  (list "img" "join-our-team" "jobs-teaching-kids-coding-computer-science.jpg"))
(define learn-more-banner-path
  (list "img" "join-our-team" "coding-coach-teaches-computer-science-to-kids.jpg"))
(define volunteer-scientist-img-path
  (list "img" "join-our-team" "volunteer-learning-scientist-position-improving-classrooms.jpg"))
(define volunteer-coder-img-path
  (list "img" "join-our-team" "volunteer-position-coding-computer-science-curriculum.jpg"))
(define summer-camp-intern-img-path
  (list "img" "join-our-team" "summer-coding-education-intern-bonding-with-student.jpg"))
(define tech-coordinator-img-path
  (list "img" "join-our-team" "tech-coordinator-managing-computers.jpg"))
(define coding-coach-banner-path
  (list "img" "coaches" "coding-coach-teaching-students.jpg"))
(define volunteer-scientist-banner-path
  (list "img" "scientists" "volunteer-learning-scientist-studying-coding-classroom.jpg"))
(define volunteer-coder-banner-path
  (list "img" "coders" "volunteer-coding-computer-science-curriculum-for-students.jpg"))
(define summer-camp-intern-banner-path
  (list "img" "summer-interns" "summer-coding-education-intern-leadership-opportunity.jpg"))
(define tech-coordinator-banner-path
  (list "img" "tech-coordinators" "tech-coordinator-at-home-with-hardware.jpg"))
(define partners-img-path
  (list "img" "partners" "girls-making-friends-at-coding-camp.jpg"))
(define world-img-path
  (list "img" "locations" "metacoders-camps-classes-across-us-world.jpg"))
(define city-summer-camp-img-path
  (list "img" "locations" "coding-summer-camp-for-k-12.jpg"))
(define city-summer-camp-pricing-img-path
  (list "img" "locations" "coding-student-learning-video-game-design.jpg"))
(define city-weekly-class-img-path
  (list "img" "locations" "young-girl-learning-computer-science.jpg"))
(define donate-banner-path
  (list "img" "donate" "donate-to-support-coding-camps-for-k-12.jpg"))

(define river-img-path
  (list "img" "river.png"))


; ==== CITY BANNER PATHS ====
(define chula-vista-banner-path
  (list "img" "locations" "banners" "city-chula-vista-ca.jpg"))
(define dallas-banner-path
  (list "img" "locations" "banners" "city-dallas-tx.jpg"))
(define minneapolis-banner-path
  (list "img" "locations" "banners" "city-minneapolis-mn.jpg"))
(define poway-banner-path
  (list "img" "locations" "banners" "city-poway-ca.jpg"))
(define reno-banner-path
  (list "img" "locations" "banners" "city-reno-nv.jpg"))
(define temecula-banner-path
  (list "img" "locations" "banners" "city-temecula-ca.jpg"))
(define washington-dc-banner-path
  (list "img" "locations" "banners" "city-washington-dc.jpg"))
(define new-orleans-banner-path
  (list "img" "locations" "banners" "city-new-orleans-la.jpg"))

; ==== COURSE VIDEO PATHS ====
(define battlearena-mp4-path
  (list "img" "videos" "battlearena.mp4"))
(define k2-animal-mp4-path
  (list "img" "videos" "k2-animal.mp4"))
(define k2-clicker-cartoon-mp4-path
  (list "img" "videos" "k2-clicker-cartoon.mp4"))
(define survival-mp4-path
  (list "img" "videos" "survival.mp4"))

(define battlearena-webm-path
  (list "img" "videos" "battlearena.webm"))
(define k2-animal-webm-path
  (list "img" "videos" "k2-animal.webm"))
(define k2-clicker-cartoon-webm-path
  (list "img" "videos" "k2-clicker-cartoon.webm"))
(define survival-webm-path
  (list "img" "videos" "survival.webm"))

(define (imgs)
  (list 
    (page homepage-banner-path
          (build-path img "home" "child-coding-in-weekly-class-camp.jpg"))
    (page lindsey-img-path
          (build-path img "home" "lindsey-handley-metacoders-co-founder-vice-president.jpg")) 
    (page judith-img-path
          (build-path img "home" "judith-eisenberg-coding-educator.jpg")) 
    (page sara-img-path
          (build-path img "home" "sara-lucchini-computer-science-curriculum-developer.jpg")) 
    (page sonny-img-path
          (build-path img "home" "sonny-najar-programming-language-developer.jpg")) 
    (page games-svg-path
          (build-path img "home" "games-classroom-gamification.svg"))
    (page brain-svg-path
          (build-path img "home" "brain-metacognition.svg"))
    (page story-svg-path
          (build-path img "home" "storytelling-for-education.svg"))
    (page takes-a-village-path
          (build-path img "home" "coding-summer-camp-interns-fun.jpg"))
    (page takes-a-village-2-path
          (build-path img "home" "computer-science-summer-educators-collage.jpg"))
    (page takes-a-village-3-path
          (build-path img "home" "coding-coaches-for-grassroots-education.jpg"))
    (page summer-camps-img-path
          (build-path img "learn-more" "summer-computer-science-camps-for-students.jpg"))
    (page learn-more-banner-path
          (build-path img "learn-more" "fun-at-coding-camps-for-k-12-lg.jpg"))
    (page weekly-classes-img-path
          (build-path img "learn-more" "weekly-coding-classes-for-kids-k-12.jpg"))
    (page in-school-img-path
          (build-path img "learn-more" "in-school-coding-educators-for-k-12.jpg"))
    (page join-our-team-banner-path
          (build-path img "join-our-team" "jobs-teaching-kids-coding-computer-science.jpg"))
    (page coding-coach-img-path
          (build-path img "join-our-team" "coding-coach-teaches-computer-science-to-kids.jpg"))
    (page volunteer-scientist-img-path
          (build-path img "join-our-team" "volunteer-learning-scientist-position-improving-classrooms.jpg"))
    (page summer-camp-intern-img-path
          (build-path img "join-our-team" "summer-coding-education-intern-bonding-with-student.jpg"))
    (page volunteer-coder-img-path
          (build-path img "join-our-team" "volunteer-position-coding-computer-science-curriculum.jpg"))
    (page tech-coordinator-img-path
          (build-path img "join-our-team" "tech-coordinator-managing-computers.jpg"))
    (page coding-coach-banner-path
          (build-path img "coaches" "coding-coach-teaching-students.jpg"))
    (page volunteer-scientist-banner-path
          (build-path img "scientists" "volunteer-learning-scientist-studying-coding-classroom.jpg"))
    (page summer-camp-intern-banner-path
          (build-path img "summer-interns" "summer-coding-education-intern-leadership-opportunity.jpg"))
    (page volunteer-coder-banner-path
          (build-path img "coders" "volunteer-coding-computer-science-curriculum-for-students.jpg"))
    (page tech-coordinator-banner-path
          (build-path img "tech-coordinators" "tech-coordinator-at-home-with-hardware.jpg"))
    (page partners-img-path
          (build-path img "partners" "girls-making-friends-at-coding-camp.jpg"))
    (page donate-banner-path
          (build-path img "donate" "donate-to-support-coding-camps-for-k-12.jpg"))
    (page world-img-path
          (build-path img "locations" "metacoders-camps-classes-across-us-world.jpg"))
    (page city-summer-camp-img-path
          (build-path img "locations" "coding-summer-camp-for-k-12.jpg"))
    (page city-summer-camp-pricing-img-path
          (build-path img "locations" "coding-student-learning-video-game-design.jpg"))
    (page city-weekly-class-img-path
          (build-path img "locations" "young-girl-learning-computer-science.jpg"))
    (page river-img-path
          (build-path img "river.png"))

; ==== CITY BANNER PATHS ====
    (page chula-vista-banner-path
          (build-path img "locations" "banners" "city-chula-vista-ca.jpg"))
    (page dallas-banner-path
          (build-path img "locations" "banners" "city-dallas-tx.jpg"))
    (page minneapolis-banner-path
          (build-path img "locations" "banners" "city-minneapolis-mn.jpg"))
    (page poway-banner-path
          (build-path img "locations" "banners" "city-poway-ca.jpg"))
    (page reno-banner-path
          (build-path img "locations" "banners" "city-reno-nv.jpg"))
    (page temecula-banner-path
          (build-path img "locations" "banners" "city-temecula-ca.jpg"))
    (page washington-dc-banner-path
          (build-path img "locations" "banners" "city-washington-dc.jpg"))
    (page new-orleans-banner-path
          (build-path img "locations" "banners" "city-new-orleans-la.jpg"))

    (page battlearena-mp4-path
          (build-path img "videos" "battlearena.mp4"))
    (page k2-animal-mp4-path
          (build-path img "videos" "k2-animal.mp4"))
    (page k2-clicker-cartoon-mp4-path
          (build-path img "videos" "k2-clicker-cartoon.mp4"))
    (page survival-mp4-path
          (build-path img "videos" "survival.mp4"))

    (page battlearena-webm-path
          (build-path img "videos" "battlearena.webm"))
    (page k2-animal-webm-path
          (build-path img "videos" "k2-animal.webm"))
    (page k2-clicker-cartoon-webm-path
          (build-path img "videos" "k2-clicker-cartoon.webm"))
    (page survival-webm-path
          (build-path img "videos" "survival.webm"))

    ))
