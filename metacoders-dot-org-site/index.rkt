#lang at-exp racket

(provide index)

(require metacoders-dot-org-lib)

(define (index)
  (page index-path
        (homepage-content
          (big-image 
            "https://picsum.photos/id/201/1900/1080?grayscale&blur=5"
            #:offset-y -1500
            (div
              class: "text-center"
              (img src: 
                   ;Gross...
                   (pathify 
                     (add-path-prefix logo-img-path)))))

          (lindsey-quote)

          (big-image 
            "https://picsum.photos/id/1073/1900/1080?grayscale")

          (sara-quote #:right? #f)
          
          (big-image 
            "https://picsum.photos/id/491/1900/1080?grayscale"
            #:offset-y -200)

          (jason-quote)

          (big-image 
            "https://picsum.photos/id/486/1900/1080?grayscale"
            #:offset-y -650)

          (sonny-quote #:right? #f)
(big-image "https://picsum.photos/id/24/1900/1080?grayscale"
            #:offset-y -200)

          (jordan-quote)

          (big-image 
            "https://picsum.photos/id/7/1900/1080?grayscale"
            #:offset-y -400)

          (judith-quote #:right? #f)

          (big-image 
            "https://picsum.photos/id/885/1900/1080?grayscale")

          (stephen-quote)

          (big-image 
            "https://picsum.photos/id/534/1900/1080?grayscale")

          )))


(define (lindsey-quote #:right? (right #t))
  (big-quote
    #:right? right
    #:title "Go Meta" 
    #:tagline "The world needs meta-coders"
    #:content @~a{
    "The MetaCoders concept is simple. No matter your city, country, or continent -- we'll to teach you to code and pay you to learn. The catch? You have to be ready, from day one, to give back. You have to be ready to reinvest your coding education in more coding education: for yourself and the community you live in. You have to teach what you've learned." }
    #:image-src lindsey-img-path
    #:attribution (list
                    (span "Lindsey D. Handley, Ph.D.")
                    (br)
                    "MetaCoders.org, Founding Member")))

(define (sara-quote #:right? (right #t)  )
  (big-quote
    #:right? right
    #:title "Storytelling"
    #:tagline "The stories of our future are being written -- not just in our native tongues... but in code."
    #:content @~a{
    "Writing code is a form of storytelling -- where the stories actually come true. That's the magic of our time. With that alone, teachers and students can rewrite education as we know it. MetaCoders paves the way."}
    #:image-src sara-img-path
    #:attribution (list
                    (span "Sara Lucchini")
                    (br)
                    "MetaCoders.org, Founding Member")))


(define (jason-quote #:right? (right #t)  )
  (big-quote
    #:right? right
    #:title "Coding is bigger than coding"
    #:tagline "If we just think bigger, we can solve coding education, and a lot more..."
    #:content @~a{
    "The moment we realized coding education could transform everything -- from math and sciences to history and language arts -- that was when we decided to found MetaCoders. You don't leave something broken when you know how to fix it."}
    #:image-src jason-img-path
    #:attribution (list
                    (span "Jason Le")
                    (br)
                    "MetaCoders.org, Founding Member")))


(define (sonny-quote #:right? (right #t)  )
  (big-quote
    #:right? right
    #:title "Write your 1st line"
    #:tagline "If you don't understand software, you don't understand the world."
    #:content @~a{
    "Pick any object and ask, How did this get here? Odds are, its design, manufacturing, and distribution was shaped by code. We write these stories at a rate of 111 billion lines per year. MetaCoders can help you write your first line, or your millionth." }
    #:image-src sonny-img-path
    #:attribution (list
                    (span "Salvador Najar")
                    (br)
                    "MetaCoders.org, Founding Member")))




(define (jordan-quote #:right? (right #t)  )
  (big-quote
    #:right? right
    #:title "People, not Computers"
    #:tagline "If your code isn't going to help someone, don't write it."
    #:content @~a{
    "If a tree falls in the forest, who cares? If your code doesn't do something worthwhile in the world, who cares? MetaCoders teachs you how to write code that matters -- code that changes people for the better." }
    #:image-src jordan-img-path
    #:attribution (list
                    (span "Jordan Hisamoto")
                    (br)
                    "MetaCoders.org, Founding Member")))


(define (judith-quote #:right? (right #t)  )
  (big-quote
    #:right? right
    #:title "Language is technology"
    #:tagline "Coding is the most powerful language technology since the invention of the written word in 3300 BC."
    #:content @~a{
    "Coding is a linguistic tool with historically unprecedented power. MetaCoder education grants access to the most powerful language technology since the invention of the written word in 3300 BC. Yeah, everyone should know this stuff." }
    #:image-src judith-img-path
    #:attribution (list
                    (span "Judith Eisenberg")
                    (br)
                    "MetaCoders.org, Founding Member")))


(define (stephen-quote #:right? (right #t)  )
  (big-quote
    #:right? right
    #:title "Language of Code"
    #:tagline "Learning to code is a form of language acquisition."
    #:content @~a{
    "Put a coder in an fMRI, and what lights up? The language parts. The better the coder, the more their brains look like they are reading English while reading code. I designed MetaCoders education around this simple neuroscientific insight: learning to code is a form of language acquisition." }
    #:image-src stephen-img-path
    #:attribution (list
                    (span "Stephen Foster")
                    (br)
                    "MetaCoders.org, Founding Member")))




