#lang racket

(provide imgs
         jpg-path->webp-path
         png-path->webp-path
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
(define/provide/image stephen-img-path stephen-img-webp-path
  (list "img" "home" "stephen-r-foster-co-founder-and-president.jpg"))
(define/provide/image judith-img-path judith-img-webp-path
  (list "img" "home" "judith-eisenberg-coding-educator.jpg"))
(define/provide/image sara-img-path sara-img-webp-path
  (list "img" "home" "sara-lucchini-computer-science-curriculum-developer.jpg"))
(define/provide/image sonny-img-path sonny-img-webp-path
  (list "img" "home" "sonny-najar-programming-language-developer.jpg"))
(define/provide/image jason-img-path jason-img-webp-path
  (list "img" "home" "jason-le-senior-curriculum-developer.jpg"))
(define/provide/image jordan-img-path jordan-img-webp-path
  (list "img" "home" "jordan-hisamoto-senior-operations-manager.jpg"))
(define/provide/image eunice-img-path eunice-img-webp-path
  (list "img" "home" "eunice-baes-senior-operations-manager.jpg"))
(define/provide/svg tall-logo-svg-path
  (list "img" "home" "metacoders-logo-tall.svg"))

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

; QCC Start
(define/provide/svg metacoders-diagram-path
  (list "img" "online" "mc-diagram.svg")) 
(define/provide/image discord-img-path discord-img-webp-path
  (list "img" "online" "discord-bots.jpg")) 
(define/provide/image graphic-design-img-path graphic-design-img-webp-path
  (list "img" "online" "graphic-design.jpg"))
(define/provide/image metacognition-img-path metacognition-img-webp-path
  (list "img" "online" "metacognition.jpg"))
(define/provide/image music-img-path music-img-webp-path
  (list "img" "online" "music.jpg"))
(define/provide/image racket-logo-img-path racket-logo-img-webp-path
  (list "img" "online" "racket-programming-language-logo.jpg"))
(define/provide/image video-editing-img-path video-editing-img-webp-path
  (list "img" "online" "video-editing.jpg"))
(define/provide/image web-development-img-path web-development-img-webp-path
  (list "img" "online" "web-development.jpg"))
(define/provide/image artificial-intelligence-img-path artificial-intelligence-img-webp-path
  (list "img" "online" "artificial-intelligence.jpg"))
(define/provide/image dont-teach-coding-img-path dont-teach-coding-img-webp-path
  (list "img" "online" "dont-teach-coding-until-your-read-this-book-cover.jpg"))
(define/provide/image online-banner-path online-banner-webp-path
  (list "img" "online" "student-coding-in-quarantine.jpg"))
(define/provide/image covid-class-img-path covid-class-img-webp-path
  (list "img" "online" "coders-conquering-covid-19-childrens-drawing.jpg"))
(define/provide/image conquering-covid-img-path conquering-covid-img-webp-path
  (list "img" "online" "coders-conquering-covid-19.jpg"))
(define/provide/image circuit-img-path circuit-img-webp-path
  (list "img" "online" "circuits-background.jpg"))
(define/provide/image adventures-in-coding-img-path adventures-in-coding-img-webp-path
  (list "img" "online" "two-girls-coding-having-fun.jpg"))
(define/provide/image conquering-covid-b-img-path conquering-covid-b-img-webp-path
  (list "img" "online" "teenager-at-coding-camp-learning-programming.jpg"))
(define/provide/image coding-club-img-path coding-club-img-webp-path
  (list "img" "online" "online-coding-club-in-session-screenshot.jpg"))
(define/provide/image paper-coding-img-path paper-coding-img-webp-path
  (list "img" "online" "students-coding-on-paper.jpg"))
(define/provide/image scratch-img-path scratch-img-webp-path
  (list "img" "online" "scratch-coding-software-for-kids.jpg"))
(define/provide/image digital-art-img-path digital-art-img-webp-path
  (list "img" "online" "coding-digital-art-in-wescheme.jpg"))
(define/provide/image 3d-exploration-img-path 3d-exploration-img-webp-path
  (list "img" "online" "3d-exploration-coding.jpg"))
(define/provide/image 3d-orbit-img-path 3d-orbit-img-webp-path
  (list "img" "online" "3d-orbit-coding.jpg"))
(define/provide/video endless-runner-mp4-path endless-runner-webm-path
  (list "videos" "endless-runner-harry-potter-game.mp4"))
(define/provide/video maze-mp4-path maze-webm-path
  (list "videos" "coding-maze-pokemon-game.mp4"))
(define/provide/image python-img-path python-img-webp-path
  (list "img" "online" "python-game-with-code.jpg"))
(define/provide/image seniors-zoom-coding-path seniors-zoom-coding-webp-path
  (list "img" "tech-ed" "seniors-zoom-coding.jpg"))
(define/provide/image cpx-img-path cpx-img-webp-path
  (list "img" "online" "virtual-engineering-cpx.jpg"))
;; QCC End

;Topics
(define/provide/image cpx-icon-path cpx-icon-webp-path
  (list "img" "topics" "cpx.png"))
(define/provide/image drracket-icon-path drracket-icon-webp-path
  (list "img" "topics" "drracket.png"))
(define/provide/image ltm-icon-path ltm-icon-webp-path
  (list "img" "topics" "ltm.png"))
(define/provide/image python-icon-path python-icon-webp-path
  (list "img" "topics" "python.png"))
(define/provide/image scratch-icon-path scratch-icon-webp-path
  (list "img" "topics" "scratch.png"))
(define/provide/image tech-skills-icon-path tech-skills-icon-webp-path
  (list "img" "topics" "techskills.png"))
(define/provide/image web-icon-path web-icon-webp-path
  (list "img" "topics" "web.png"))
(define/provide/image wescheme-icon-path wescheme-icon-webp-path
  (list "img" "topics" "wescheme.png"))

;banners
(define/provide/image students-in-row-path students-in-row-webp-path
  (list "img" "coding-for-pods" "students-in-row.jpg"))
(define/provide/image summer-camp-intern-banner-path summer-camp-intern-banner-webp-path
  (list "img" "summer-interns" "summer-coding-education-intern-leadership-opportunity.jpg"))
(define/provide/image tech-coordinator-banner-path tech-coordinator-banner-webp-path
  (list "img" "tech-coordinators" "tech-coordinator-at-home-with-hardware.jpg"))
(define/provide/image partners-img-path partners-img-webp-path
  (list "img" "partners" "girls-making-friends-at-coding-camp.jpg"))
(define/provide/image senior-hands-on-keyboard-path senior-hands-on-keyboard-webp-path
  (list "img" "tech-ed" "senior-hands-on-keyboard.jpg"))
(define/provide/image girl-on-computer-path girl-on-computer-webp-path
  (list "img" "genentech" "girl-on-computer.jpg"))
(define/provide/image over-shoulder-game-path over-shoulder-game-webp-path
  (list "img" "genentech" "over-shoulder-game.jpg"))


(define/provide/image 3-teens-smiling-while-coding-path 3-teens-smiling-while-coding-webp-path
  (list "img" "genentech" "3-teens-smiling-while-coding.jpg"))
(define/provide/image proud-coder-path proud-coder-webp-path
  (list "img" "genentech" "proud-coder.jpg"))
(define/provide/image genentech-logo-path genentech-logo-webp-path
  (list "img" "genentech" "genentech-logo.jpg"))

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

; ==== LOGO AND FAVICONS ====
(define/provide/svg navbar-logo7-wide-path
  (list "img" "logo7-wide.svg"))

(define/provide/svg favicon-svg-path
  (list "." "favicon.svg"))

(define/provide/img favicon-ico-path
  (list "." "favicon.ico"))

(define/provide/svg mask-icon-path
  (list "." "mask-icon.svg"))

(define/provide/img apple-touch-icon-path
  (list "." "apple-touch-icon.png"))

(define/provide/img google-touch-icon-path
  (list "." "google-touch-icon.png"))

(define/provide/file manifest-path
  (list "." "manifest.json"))

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
(define/provide/video cpx-makecode-mp4-path cpx-makecode-webm-path
  (list "videos" "cpx-makecode.mp4"))

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

(define (png-path->webp-path png-path)
  (and (list? png-path)
       (append (take png-path (sub1 (length png-path)))
               (list (string-replace (last png-path) "png" "webp")))))

(define (mp4-path->webm-path mp4-path)
  (and (list? mp4-path)
       (append (take mp4-path (sub1 (length mp4-path)))
               (list (string-replace (last mp4-path) "mp4" "webm")))))
