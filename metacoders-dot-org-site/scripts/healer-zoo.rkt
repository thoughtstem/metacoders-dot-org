#lang at-exp racket

 (require mc-scripts)

 ;--- Define pkg(s) test(s)
 (define healer-zoo-foods-test
   @~a{#lang healer-zoo-foods
       (start hippo (fish grapes apple))})

 (define healer-zoo-friends-test
   @~a{#lang healer-zoo-friends
       (start
         (hippo orange)
         ((fish yellow) (tomato green) (apple 2))
         ((monkey 2) (rand purple)))})

 (define healer-zoo-enemies-test
   @~a{#lang healer-zoo-enemies 
       (start
         hippo
         ((apple yellow 5))
         ((apple blue 5))
         ((apple green 5)))})

 ;--- Check pkg(s)
 (system "raco pkg remove --force reprovide-lang") ;<--- remove old pkg

 (check-pkg (list "healer-zoo-foods"
                  "healer-zoo-friends"
                  "healer-zoo-enemies")
            (list "https://github.com/thoughtstem/TS-K2-Languages.git?path=healer-zoo-foods"
                  "https://github.com/thoughtstem/TS-K2-Languages.git?path=healer-zoo-friends"
                  "https://github.com/thoughtstem/TS-K2-Languages.git?path=healer-zoo-enemies")
            (list healer-zoo-foods-test
                  healer-zoo-friends-test
                  healer-zoo-enemies-test))