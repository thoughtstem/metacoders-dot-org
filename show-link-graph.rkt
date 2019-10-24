#lang racket

;You can run this and paste it into http://www.webgraphviz.com/
;  * TODO: Make that process a bit fancier.  Maybe use racket-graphviz?

(require website/graph website 
         graph 
         (only-in graphviz dot->pict)
         (only-in pict show-pict)
         racket/gui/base)
(require metacoders-dot-org-site)

(define (only-main-content p)
  (define path (page-path p))
  (page path
        (findf-element
          (query div id: "main") 
          (page-content p))))

(define (html-page p)
  (string-contains? (pathify (page-path p)) "html"))

(show-pict
  (dot->pict
    (graphviz (page-graph->link-graph 
                (site->page-graph 
                  (map 
                    only-main-content
                    (filter
                      html-page
                      (metacoders.org))))))))
