#lang at-exp racket

 (require mc-scripts)

 ;--- Define pkg(s) test(s)
 (define clicker-cartoon-collect-test
   @~a{#lang clicker-cartoon-collect
       (start-fantasy dragon (mushroom rand))})

 (define clicker-cartoon-avoid-test
   @~a{#lang clicker-cartoon-avoid
       (start-fantasy (knight red) (fruit cow) (goblin))})

 (define clicker-cartoon-special-test
   @~a{#lang clicker-cartoon-special
       (start-fantasy
       spaceship
       ((gem red) (zombie 4))
       ((knight 1 yellow) dragon)
       ((coin 200 purple)))})

 ;--- Check pkg(s)
 (system "raco pkg remove --force reprovide-lang") ;<--- remove old pkg

 (check-pkg (list "clicker-cartoon-collect"
                  "clicker-cartoon-avoid"
                  "clicker-cartoon-special")
            (list "https://github.com/thoughtstem/TS-K2-Languages.git?path=clicker-cartoon-collect"
                  "https://github.com/thoughtstem/TS-K2-Languages.git?path=clicker-cartoon-avoid"
                  "https://github.com/thoughtstem/TS-K2-Languages.git?path=clicker-cartoon-special")
            (list clicker-cartoon-collect-test
                  clicker-cartoon-avoid-test
                  clicker-cartoon-special-test))
