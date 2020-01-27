#lang at-exp racket

 (require mc-scripts)

 ;--- Define pkg(s) test(s)
 (define healer-animal-foods-test
   @~a{#lang healer-animal-foods
       (start horse (grapes onion apple))})

 (define healer-animal-friends-test
   @~a{#lang healer-animal-friends
       (start
        (apple yellow)
        (kiwi banana)
        (cow pig rabbit))})

 (define healer-animal-enemies-test
   @~a{#lang healer-animal-enemies
       (start
        rand
        ((apple yellow 5))
        ((apple blue 5))
        ((apple green 5)))})

 ;--- Check pkg(s)
 (system "raco pkg remove --force reprovide-lang") ;<--- remove old pkg

 (check-pkg (list "healer-animal-foods"
                  "healer-animal-friends"
                  "healer-animal-enemies")
            (list "https://github.com/thoughtstem/TS-K2-Languages.git?path=healer-animal-foods"
                  "https://github.com/thoughtstem/TS-K2-Languages.git?path=healer-animal-friends"
                  "https://github.com/thoughtstem/TS-K2-Languages.git?path=healer-animal-enemies")
            (list healer-animal-foods-test
                  healer-animal-friends-test
                  healer-animal-enemies-test)
            "setup-ratchet")