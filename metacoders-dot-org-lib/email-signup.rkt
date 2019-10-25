#lang racket 

(provide email-signup)

(require website/bootstrap)

(define (email-signup)
  (card
    (card-body
      (card-title "Apply Now!")
      (form action: "https://docs.google.com/forms/d/1UqofwuTFtEfSGx_szpUBHyG2ueNnPHVWTHOhUcC-2b0/formResponse"
            (p "Email?")
            (input type: "text" name: "entry.1940980908")
            (p "Message?")
            (textarea name: "entry.746928416" rows: "10" cols: "40")
            (input class: "btn btn-sm bt-green" type: "submit" name: "submit")
            ))))

#|
<form action="https://docs.google.com/forms/d/1UqofwuTFtEfSGx_szpUBHyG2ueNnPHVWTHOhUcC-2b0/formResponse" id="ss-form">
  <ol style="padding-left: 0">
   <div class="ss-form-question errorbox-good"></div> 
   <div class="ss-q-help ss-secondary-text" dir="ltr"></div> 

   <p class="highlight">What is your email address?</p> 
   <input type="text" name="entry.1940980908" class="ss-q-short" id="entry_1940980908" dir="auto" style="width:100%"> 
   <div class="error-message"></div> 
   <br> 
   <div class="ss-form-question errorbox-good">
    <p class="highlight">What is your message?</p> 
    <div dir="ltr" class="ss-item ss-item-required ss-paragraph-text">
     <div class="ss-form-entry">
      <textarea name="entry.746928416" rows="10" cols="40" class="ss-q-long" id="entry_746928416" dir="auto" style="width:100%"></textarea> 
      <div class="error-message"></div></div></div></div> 
   <input type="hidden" name="draftResponse" value="[]
            "> 
   <input type="hidden" name="pageHistory" value="0"> 
   <div class="ss-item ss-navigate">
    <table id="navigation-table">
     <tbody>
      <tr>
       <td class="ss-form-entry goog-inline-block" id="navigation-buttons" dir="ltr">
        <input type="submit" class="btn btn-sm btn-green" name="submit" value="Submit" id="ss-submit" style="font-size: 16px"></td></tr></tbody></table></div></ol></form>"
|#
