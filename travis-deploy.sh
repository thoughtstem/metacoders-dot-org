#Exit if commands fail.  Don't want to push weird stuff to docs.
set -e

if [ "$TRAVIS_BRANCH" = "master" ]
then
  if [ "$TRAVIS_EVENT_TYPE" != "pull_request" ]
  then
    git remote rm origin 
    git remote add origin https://$GH_TOKEN@github.com/thoughtstem/metacoders-dot-org.git
    
    rm -rf out &>/dev/null
    git branch gh-pages &>/dev/null
    git worktree prune
    git worktree add out gh-pages

    touch out/site_prefix #Temporary hack.  raco website-preview should be smarter about this

    racket main.rkt 

    cd out/
    echo "metacoders.org" > CNAME
    git add . -f
    git commit -m "Travis Build: $TRAVIS_BUILD_NUMBER"
    git push -f origin gh-pages

  else
    echo "PULL REQUEST, SO NOT PUSHING DOC" 
  fi
else
  echo "NOT MASTER, SO NOT PUSHING DOCS"
fi
