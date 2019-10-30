#lang at-exp racket

(provide asp-first-day-of-class
         asp-first-day-of-class/checkin)

(require metacoders-dot-org/metacoders-dot-org-lib/stories-lib)

(define (asp-first-day-of-class)
  (story
    "ASP First Day Of Class"
    lovelace-elementary
    @div{
      This is Bruce's first time at this location, however Meta Coders has been here before (Ruby taught here last session!) 
    }
    (list 
      (story-link 
        "The Checkin"
        (asp-first-day-of-class/checkin)))))


(define (asp-first-day-of-class/checkin)
  (story
    "ASP First Day Of Class - Checking in"
    lovelace-elementary
    @container{
   Important Points

   @ul{
     @li{Arrive early to park} 
     @li{Friendly, confident with the office staff }
     @li{Asks for help from office staff! }}

@(hr)

Today is the first day of class at Lovelace Elementary's Coding After School Program: Spring session. More importantly, it is Bruce's very first class ever!

@(br)
@(br)

Bruce received an email a couple days ago with a bunch of information about what to do and expect at this location -- when and where to pick up equipment, where to park, etc. Bruce parks in the visitor spots of the school lot and arrives in the the school's office with the equipment 30 minutes before class starts.

@(br)
@(br)

The office staff look pretty busy; two of the three people are on phones and the third is talking to a parent. Bruce waits patiently, until one of the three staff frees up, then introduces himself:

@(br)
@(br)

"Hi, I'm Bruce, I am the coach for the Meta Coders after school program that starts up today."

@(br)
@(br)

Bruce then double checks the room the class is in (the staff isn't sure) and asks for directions (they do know that!). He also makes sure he knows what the school needs him to do to sign in each day -- the email with information did tell him that the school used a computer log-in system and printed name tags, but Bruce asked just to be sure nothing had changed since last session.

@(br)
@(br)

The staff was obviously busy and didn't seem to know a lot about the after school programs, but Bruce knows that being friendly with location staff is important in any case. The staff should know who he is so they are able to assist him, parents, or students in his class if needed! 

@;Temp. TODO: Add a footer to normal-content
@(br)
@(br)
@(br)
@(br)
@(br)
@(br)

    }
    '()))

