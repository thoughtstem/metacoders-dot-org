#lang at-exp racket

(require mc-scripts)
(require pkg/name pkg/lib pkg setup/setup)

 ;--- Define pkg(s) test(s)
 (define clicker-pokemon-collect-test
   @~a{#lang clicker-pokemon-collect
       (start-snow rand ((water-stone 4)))})

 (define clicker-pokemon-avoid-test
   @~a{#lang clicker-pokemon-avoid
       (start-forest (ivysaur red) (leaf-stone fire-stone) (jessie))})

 (define clicker-pokemon-special-test
   @~a{#lang clicker-pokemon-special
       (start-forest charizard (fire-stone) (james) (ice-power))})

 ;--- Check pkg(s)
 (system "raco pkg remove --force reprovide-lang") ;<--- remove old pkg


(define (installed? s)
 (pkg-directory s))

(if (installed? "racket-chipmunk")
 (begin
  (displayln "racket-chipmunk detected.  Fixing the version.")
  (pkg-update-command
   "https://github.com/thoughtstem/racket-chipmunk.git#master"
    #:deps 'search-auto #:no-setup #t))
 (displayln "No racket-chipmunk.  No need to fix things."))


 (check-pkg (list "clicker-pokemon-collect"
                  "clicker-pokemon-avoid"
                  "clicker-pokemon-special")
            (list "https://github.com/thoughtstem/TS-K2-Languages.git?path=clicker-pokemon-collect"
                  "https://github.com/thoughtstem/TS-K2-Languages.git?path=clicker-pokemon-avoid"
                  "https://github.com/thoughtstem/TS-K2-Languages.git?path=clicker-pokemon-special")
            (list clicker-pokemon-collect-test
                  clicker-pokemon-avoid-test
                  clicker-pokemon-special-test)
            "setup-ratchet")