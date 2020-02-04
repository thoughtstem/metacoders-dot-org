#lang info
(define collection "metacoders-dot-org-site")
(define deps '("base"
               "threading"
               "https://github.com/thoughtstem/metacoders-dot-org.git?path=metacoders-dot-org-lib"


               ; --- all cities
               "https://github.com/thoughtstem/metacoders-dot-org-dc.git?path=metacoders-dot-org-dc-site"
               "https://github.com/thoughtstem/metacoders-dot-org-reno.git?path=metacoders-dot-org-reno-site"
               "https://github.com/thoughtstem/metacoders-dot-org-dallas.git?path=metacoders-dot-org-dallas-site"
               "https://github.com/thoughtstem/metacoders-dot-org-temecula.git?path=metacoders-dot-org-temecula-site"
               "https://github.com/thoughtstem/metacoders-dot-org-minneapolis.git?path=metacoders-dot-org-minneapolis-site"
               "https://github.com/thoughtstem/metacoders-dot-org-poway.git?path=metacoders-dot-org-poway-site"
               "https://github.com/thoughtstem/metacoders-dot-org-chula-vista.git?path=metacoders-dot-org-chula-vista-site"
               "https://github.com/thoughtstem/metacoders-dot-org-core-pages.git"
               "https://github.com/thoughtstem/mc-classmaps.git"

               ; --------------
               "https://github.com/thoughtstem/mc-social-media.git" 
               "https://github.com/thoughtstem/mc-coach-training.git"
               "https://github.com/thoughtstem/website.git"
               "https://github.com/thoughtstem/impress.git"
               "https://github.com/thoughtstem/mc-classmaps.git"))

(define compile-omit-paths '("scripts/"))
