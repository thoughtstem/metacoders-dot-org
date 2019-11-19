#lang at-exp racket

(provide coaches)

(require metacoders-dot-org-lib
         "./training.rkt")

(define (coaches)
  (list (coaches-top)
        (training)))

(define (jumbotron-header)
  (jumbotron style: (properties
                      text-align: "center"
                      margin-bottom: 0
                      background-image: (string-append "url(" (prefix/pathify coding-coach-img-path) ")")
                      background-size: "cover"
                      height: "60%")
              class: "d-flex align-items-center"
              (container
                (div style: (properties
                                    display: "inline-block"
                                    padding: 15
                                    color: "white"
                                    background: "rgba(0, 0, 0, 0.5)")
              (h1 "Become a Coding Coach")
              (h6 "Teach kids in your community how to code!")))))

(define (job-description-section)
  (container
    (br)
    (h1 "Coding Coach")
    (h3 "Part-time Position")
    (h6 "Locations Where We’re Currently Hiring for This Position:")
    (ul
      (li "Dallas, Texas")
      (li "Minneapolis, Minnesota")
      (li "Raleigh, North Carolina")
      (li "Reno, Nevada"))
    (h6 "Description")
    (p "We are currently seeking energetic, passionate individuals who will be \"Coding Coaches\" for computer science classes & camps in your area. Candidates do not necessarily need to be experienced in computer science, but should be excited to learn coding with us!")
    (p "Coding Coaches guide students as they learn computer science using MetaCoders’ innovative curriculum. During the school year, Coding Coaches work with students in Kindergarten through 6th grade in weekly 1-2 hour classes. Over the summer, Coding Coaches predominantly work with students in Kindergarten through 10th grade in summer camps, which operate from 9am-4pm.")
    (h6 "Expectations and Responsibilities")
    (ul
      (li "Guide students through the curriculum; engaging students with different experience levels and motivating everyone with your can-do attitude!")
      (li "Create a safe and fun learning environment using classroom management skills and correcting student behavior when needed. We can help you learn the techniques for accomplishing this.")
      (li "Teach independently with 5-10 students or co-teach with other instructors in larger classes. Monitor all students and keep them safe from arrival to dismissal.")
      (li "Arrive dressed appropriately at the scheduled arrival time to set up before class begins. Finish tidying after class ends.")
      (li "Communicate with MetaCoders staff before, during, and after class on attendance, behavior and student progress."))
    (h6 "Other Duties") 
    (ul
      (li "Train on MetaCoders technology, languages, and curriculum to effectively coach students and answer questions.")
      (li "Read and respond in a timely manner to emails from MetaCoders staff regarding scheduling, curriculum, and other updates.")
      (li "Attend all classes, training sessions, and other programs committed to, barring emergencies or significant illness. In cases of emergency or significant illness, coaches must alert MetaCoders with as much advance notice as possible."))
    (p "Learn more about employment requirements and apply for employed positions here:")
    (button-primary class: "mb-4"
                    id: "main-button" 
                    "Apply Here")))

(define (start-now-section)
  (container
    (h3 "Or, Start Your Own Classes Today!")
    (p "If we're not in your city yet, there's no reason you can't use our tools to start teaching free classes in your own community! Alternatively, you can help us start official classes in your community and get paid as an official MetaCoders Coding Coach. Email us to learn more and start your training here:")
    (row
      (col-6
        (email-signup))
      (col-6
        (begin-training 
          (training-top))))))


(define (coaches-top)
  (page coaches-top-path
        (normal-content-wide
          (jumbotron-header)
          (job-description-section)
          (start-now-section))))
