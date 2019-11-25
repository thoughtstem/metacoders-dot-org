#lang at-exp racket

(provide clicker-cartoon.rkt)

(require website)

(define clicker-cartoon-script
  @~a{
 #lang racket

 (define racket-version
  (version))

 (define home-path
  (find-system-path 'home-dir))

 (define test-path
  (~a  home-path "Desktop/TEST-FILES/"))

 (define (pkg-path pkg)
  (~a home-path ".racket/" racket-version "/pkgs/" pkg))

 (define (msg-alert s)
 (println "#######################################")
 (println (~a "# " s " ..."))
 (println "#######################################"))

 (define (update-pkg pkg)
 (msg-alert (~a "Package " pkg " is installed, updating ..."))
 (system (~a "raco pkg update --auto --update-deps --batch --skip-uninstalled --no-setup " pkg)))

 (define (install-pkg pkg url)
 (msg-alert (~a "Package " pkg " is not installed, installing ..."))
 (system (~a "raco pkg install --auto --update-deps --batch --skip-installed --no-setup " url)))

 (define (check-pkg pkg url)
 (if (directory-exists? (pkg-path pkg))
 (update-pkg pkg) 
 (install-pkg pkg url)))

 (define (add-tests)
 (if (directory-exists? test-path)
 (make-test-files)
 (begin
 (system (~a "mkdir " test-path))
 (make-test-files))))

 ;^^^ ALL SCRIPTS SHOULD HAVE THE SAME CODE ABOVE THIS LINE ^^^

 ;--- Define pkg(s) test(s)
 (define clicker-cartoon-collect-test
 (~a "#lang clicker-cartoon-collect "
 "(start-fantasy dragon (mushroom rand))"))

 (define clicker-cartoon-avoid-test
 (~a "#lang clicker-cartoon-avoid "
 "(start-fantasy (knight red) (fruit cow) (goblin))"))

 (define clicker-cartoon-special-test
 (~a "#lang clicker-cartoon-special "
 "(start-fantasy "
 "spaceship "
 "((gem red) (zombie 4)) "
 "((knight 1 yellow) dragon) "
 "((coin 200 purple)))"))

 ;--- Create command to add test files to test folder
 (define (make-test-files)  ;<--- KEEP THIS NAME
 (system (~a "echo '" clicker-cartoon-collect-test "' > " test-path "clicker-cartoon-collect-test.rkt;"
 "echo '" clicker-cartoon-avoid-test   "' > " test-path "clicker-cartoon-avoid-test.rkt;"
 "echo '" clicker-cartoon-special-test "' > " test-path "clicker-cartoon-special-test.rkt;")))


 ;--- Check pkg(s)
 (msg-alert "Removing reprovide-lang")
 (system "raco pkg remove --force reprovide-lang") ;<--- remove old pkg

 (check-pkg "clicker-cartoon-collect"
 "https://github.com/thoughtstem/TS-K2-Languages.git?path=clicker-cartoon-collect");
 (check-pkg "clicker-cartoon-avoid"
 "https://github.com/thoughtstem/TS-K2-Languages.git?path=clicker-cartoon-avoid")
 (check-pkg "clicker-cartoon-special"
 "https://github.com/thoughtstem/TS-K2-Languages.git?path=clicker-cartoon-special")

 ;--- Setting up pkg(s)
 (msg-alert "Running raco setup on clicker-cartoon-collect, avoid, special")
 (system "raco setup clicker-cartoon-collect clicker-cartoon-avoid clicker-cartoon-special")

 ;--- Adding file(s) to test folder
 (msg-alert "Adding test files")
 (add-tests)
      })

(define clicker-cartoon.rkt
  (page clicker-cartoon.rkt
        clicker-cartoon-script))
