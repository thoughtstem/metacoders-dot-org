#lang racket

(provide imgs
         jpg-path->webp-path
         mp4-path->webm-path
         )

(require website/bootstrap
         (only-in 2htdp/image bitmap/file)
         racket/runtime-path)

(define-runtime-path img "img")
(define-runtime-path videos "videos")
(define-runtime-path files "files")

(define imgs-list
  '())

(define videos-list
  '())

(define files-list
  '())

(define-syntax-rule (define/provide/image img-path webp-path path)
  (begin
    (provide img-path webp-path)
    (define img-path path)
    (define webp-path (append (take img-path (sub1 (length img-path)))
                              (list (string-replace (last img-path)
                                                    (cond [(string-suffix? (last img-path) "png") "png"]
                                                          [(string-suffix? (last img-path) "gif") "gif"]
                                                          [(string-suffix? (last img-path) "jpg") "jpg"]
                                                          [else ""])
                                                    "webp"))))
    (set! imgs-list
          (append imgs-list
                  (list (page img-path
                              (apply build-path
                                     (append (list img)
                                             (drop img-path 1))))
                        (page webp-path
                              (apply build-path
                                     (append (list img)
                                             (drop webp-path 1))))
                        )))                                           
    ))

(define-syntax-rule (define/provide/img img-path path)
  (begin
    (provide img-path)
    (define img-path path)
    (set! imgs-list
          (append imgs-list
                  (list (page img-path
                              (apply build-path
                                     (append (list img)
                                             (drop img-path 1))))
                        )))                                           
    ))

(define-syntax-rule (define/provide/svg svg-path path)
  (begin
    (provide svg-path)
    (define svg-path path)
    (set! imgs-list
          (append imgs-list
                  (list (page svg-path
                              (apply build-path
                                     (append (list img)
                                             (drop svg-path 1))))
                        )))                                           
    ))

(define-syntax-rule (define/provide/video mp4-path webm-path path)
  (begin
    (provide mp4-path webm-path)
    (define mp4-path path)
    (define webm-path (append (take mp4-path (sub1 (length mp4-path)))
                              (list (string-replace (last mp4-path) "mp4" "webm"))))
    (set! videos-list
          (append videos-list
                  (list (page mp4-path
                              (apply build-path
                                     (append (list videos)
                                             (drop mp4-path 1))))
                        (page webm-path
                              (apply build-path
                                     (append (list videos)
                                             (drop webm-path 1))))
                        )))                                         
    ))

(define-syntax-rule (define/provide/file file-path path)
  (begin
    (provide file-path)
    (define file-path path)
    (set! files-list
          (append files-list
                  (list (page file-path
                              (apply build-path
                                     (append (list files)
                                             (drop file-path 1))))
                        )))                                           
    ))

(define/provide/svg games-svg-path
  (list "img" "home" "games-classroom-gamification.svg"))
(define/provide/svg brain-svg-path
  (list "img" "home" "brain-metacognition.svg"))
(define/provide/svg story-svg-path
  (list "img" "home" "storytelling-for-education.svg"))

(define/provide/image homepage-banner-path homepage-banner-webp-path
  (list "img" "home" "child-coding-in-weekly-class-camp.jpg"))
(define/provide/image lindsey-img-path lindsey-img-webp-path
  (list "img" "home" "lindsey-handley-metacoders-co-founder-vice-president.jpg"))
(define/provide/image judith-img-path judith-img-webp-path
  (list "img" "home" "judith-eisenberg-coding-educator.jpg"))
(define/provide/image sara-img-path sara-img-webp-path
  (list "img" "home" "sara-lucchini-computer-science-curriculum-developer.jpg"))
(define/provide/image sonny-img-path sonny-img-webp-path
  (list "img" "home" "sonny-najar-programming-language-developer.jpg"))
(define/provide/image takes-a-village-path takes-a-village-webp-path
  (list "img" "home" "coding-summer-camp-interns-fun.jpg"))
(define/provide/image takes-a-village-2-path takes-a-village-2-webp-path
  (list "img" "home" "computer-science-summer-educators-collage.jpg"))
(define/provide/image takes-a-village-3-path takes-a-village-3-webp-path
  (list "img" "home" "coding-coaches-for-grassroots-education.jpg"))

(define/provide/image summer-camps-img-path summer-camps-img-webp-path
  (list "img" "learn-more" "summer-computer-science-camps-for-students.jpg"))
(define/provide/image learn-more-banner-path learn-more-banner-webp-path
  (list "img" "learn-more" "fun-at-coding-camps-for-k-12-lg.jpg"))
(define/provide/image in-school-img-path in-school-img-webp-path
  (list "img" "learn-more" "in-school-coding-educators-for-k-12.jpg"))
(define/provide/image weekly-classes-img-path weekly-classes-img-webp-path
  (list "img" "learn-more" "weekly-coding-classes-for-kids-k-12.jpg"))

(define/provide/image join-our-team-banner-path join-our-team-banner-webp-path 
  (list "img" "join-our-team" "jobs-teaching-kids-coding-computer-science.jpg"))
(define/provide/image coding-coach-img-path coding-coach-img-webp-path
  (list "img" "join-our-team" "coding-coach-teaches-computer-science-to-kids.jpg"))
(define/provide/image volunteer-scientist-img-path volunteer-scientist-img-webp-path
  (list "img" "join-our-team" "volunteer-learning-scientist-position-improving-classrooms.jpg"))
(define/provide/image volunteer-coder-img-path volunteer-coder-img-webp-path
  (list "img" "join-our-team" "volunteer-position-coding-computer-science-curriculum.jpg"))
(define/provide/image summer-camp-intern-img-path summer-camp-intern-img-webp-path
  (list "img" "join-our-team" "summer-coding-education-intern-bonding-with-student.jpg"))
(define/provide/image tech-coordinator-img-path tech-coordinator-img-webp-path
  (list "img" "join-our-team" "tech-coordinator-managing-computers.jpg"))

(define/provide/image coding-coach-banner-path coding-coach-banner-webp-path
  (list "img" "coaches" "coding-coach-teaching-students.jpg"))
(define/provide/image volunteer-scientist-banner-path volunteer-scientist-banner-webp-path
  (list "img" "scientists" "volunteer-learning-scientist-studying-coding-classroom.jpg"))
(define/provide/image volunteer-coder-banner-path volunteer-coder-banner-webp-path
  (list "img" "coders" "volunteer-coding-computer-science-curriculum-for-students.jpg"))
(define/provide/image summer-camp-intern-banner-path summer-camp-intern-banner-webp-path
  (list "img" "summer-interns" "summer-coding-education-intern-leadership-opportunity.jpg"))
(define/provide/image tech-coordinator-banner-path tech-coordinator-banner-webp-path
  (list "img" "tech-coordinators" "tech-coordinator-at-home-with-hardware.jpg"))
(define/provide/image partners-img-path partners-img-webp-path
  (list "img" "partners" "girls-making-friends-at-coding-camp.jpg"))

(define/provide/image world-img-path world-img-webp-path
  (list "img" "locations" "metacoders-camps-classes-across-us-world.jpg"))
(define/provide/image city-summer-camp-img-path city-summer-camp-img-webp-path
  (list "img" "locations" "coding-summer-camp-for-k-12.jpg"))
(define/provide/image city-summer-camp-pricing-img-path city-summer-camp-pricing-img-webp-path
  (list "img" "locations" "coding-student-learning-video-game-design.jpg"))
(define/provide/image city-weekly-class-img-path city-weekly-class-img-webp-path
  (list "img" "locations" "young-girl-learning-computer-science.jpg"))
(define/provide/image donate-banner-path donate-banner-webp-path
  (list "img" "donate" "donate-to-support-coding-camps-for-k-12.jpg"))

(define/provide/img stripe-k-2-course-img-path
  (list "img" "stripe" "stripe-k-2-course.jpg"))
(define/provide/img stripe-3-6-course-img-path
  (list "img" "stripe" "stripe-3-6-course.jpg"))
(define/provide/img stripe-7-10-course-img-path
  (list "img" "stripe" "stripe-7-10-course.jpg"))

(define/provide/img stripe-k-2-camp-img-path
  (list "img" "stripe" "stripe-k-2-camp.jpg"))
(define/provide/img stripe-3-6-camp-img-path
  (list "img" "stripe" "stripe-3-6-camp.jpg"))
(define/provide/img stripe-7-10-camp-img-path
  (list "img" "stripe" "stripe-7-10-camp.jpg"))

(define/provide/svg navbar-logo7-wide-path
  (list "img" "logo7-wide.svg"))
(define/provide/svg navbar-logo9-wide-path
  (list "img" "logo9-wide.svg"))
(define/provide/svg navbar-logo10-wide-path
  (list "img" "logo10-wide.svg"))
(define/provide/svg navbar-logo12-wide-path
  (list "img" "logo12-wide.svg"))
(define/provide/svg navbar-logo13-wide-path
  (list "img" "logo13-wide.svg"))
(define/provide/svg navbar-logo14-wide-path
  (list "img" "logo14-wide.svg"))

; ==== CITY BANNER PATHS ====
(define/provide/image chula-vista-banner-path chula-vista-banner-webp-path
  (list "img" "locations" "banners" "city-chula-vista-ca.jpg"))
(define/provide/image dallas-banner-path dallas-banner-webp-path
  (list "img" "locations" "banners" "city-dallas-tx.jpg"))
(define/provide/image minneapolis-banner-path minneapolis-banner-webp-path
  (list "img" "locations" "banners" "city-minneapolis-mn.jpg"))
(define/provide/image new-orleans-banner-path new-orleans-banner-webp-path
  (list "img" "locations" "banners" "city-new-orleans-la.jpg"))
(define/provide/image phoenix-banner-path phoenix-banner-webp-path
  (list "img" "locations" "banners" "city-phoenix-az.jpg"))
(define/provide/image poway-banner-path poway-banner-webp-path
  (list "img" "locations" "banners" "city-poway-ca.jpg"))
(define/provide/image reno-banner-path reno-banner-webp-path
  (list "img" "locations" "banners" "city-reno-nv.jpg"))
(define/provide/image temecula-banner-path temecula-banner-webp-path
  (list "img" "locations" "banners" "city-temecula-ca.jpg"))
(define/provide/image washington-dc-banner-path washington-dc-banner-webp-path
  (list "img" "locations" "banners" "city-washington-dc.jpg"))
(define/provide/image charlotte-banner-path charlotte-banner-webp-path
  (list "img" "locations" "banners" "city-charlotte-nc.jpg"))

; ==== COURSE VIDEO PATHS ====
(define/provide/video battlearena-mp4-path battlearena-webm-path
  (list "videos" "battlearena.mp4"))
(define/provide/video k2-animal-mp4-path k2-animal-webm-path
  (list "videos" "k2-animal.mp4"))
(define/provide/video k2-clicker-cartoon-mp4-path k2-clicker-cartoon-webm-path
  (list "videos" "k2-clicker-cartoon.mp4"))
(define/provide/video survival-mp4-path survival-webm-path
  (list "videos" "survival.mp4"))
(define/provide/video adventure-harrypotter-mp4-path adventure-harrypotter-webm-path
  (list "videos" "adventure-harrypotter.mp4"))
(define/provide/video adventure-mario-mp4-path adventure-mario-webm-path
  (list "videos" "adventure-mario.mp4"))
(define/provide/video battlearena-avengers-mp4-path battlearena-avengers-webm-path
  (list "videos" "battlearena-avengers.mp4"))
(define/provide/video battlearena-fortnite-mp4-path battlearena-fortnite-webm-path
  (list "videos" "battlearena-fortnite.mp4"))
(define/provide/video battlearena-starwars-mp4-path battlearena-starwars-webm-path
  (list "videos" "battlearena-starwars.mp4"))
(define/provide/video clicker-cartoon-mp4-path clicker-cartoon-webm-path
  (list "videos" "clicker-cartoon.mp4"))
(define/provide/video clicker-pokemon-mp4-path clicker-pokemon-webm-path
  (list "videos" "clicker-pokemon.mp4"))
(define/provide/video healer-animal-mp4-path healer-animal-webm-path
  (list "videos" "healer-animal.mp4"))
(define/provide/video healer-zoo-mp4-path healer-zoo-webm-path
  (list "videos" "healer-zoo.mp4"))
(define/provide/video survival-minecraft-mp4-path survival-minecraft-webm-path
  (list "videos" "survival-minecraft.mp4"))
(define/provide/video survival-pokemon-mp4-path survival-pokemon-webm-path
  (list "videos" "survival-pokemon.mp4"))
(define/provide/video 3d-orbit-mp4-path 3d-orbit-webm-path
  (list "videos" "3d-orbit.mp4"))

; ==== OTHER FILE PATHS ====
(define/provide/file camp-form-path
  (list "files" "metacoders-summer-camp-registration-form.pdf"))

(define (imgs)
  (append imgs-list
          videos-list
          files-list))

(define (jpg-path->webp-path jpg-path)
  (and (list? jpg-path)
       (append (take jpg-path (sub1 (length jpg-path)))
               (list (string-replace (last jpg-path) "jpg" "webp")))))

(define (mp4-path->webm-path mp4-path)
  (and (list? mp4-path)
       (append (take mp4-path (sub1 (length mp4-path)))
               (list (string-replace (last mp4-path) "mp4" "webm")))))
