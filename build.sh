#Exit if commands fail.  Fail fast!
set -e

echo "**************************"
echo "INSTALLING metacoders-dot-org-lib"
echo "**************************"
raco pkg install --deps search-auto --no-setup https://github.com/thoughtstem/metacoders-dot-org.git?path=metacoders-dot-org-lib#$TRAVIS_BRANCH

echo "**************************"
echo "RUNNING raco setup metacoders-dot-org-lib"
echo "**************************"
raco setup --no-docs --fail-fast metacoders-dot-org-lib

echo "**************************"
echo "INSTALLING metacoders-dot-org-site"
echo "**************************"
raco pkg install --deps search-auto --no-setup https://github.com/thoughtstem/metacoders-dot-org.git?path=metacoders-dot-org-site#$TRAVIS_BRANCH

echo "**************************"
echo "RUNNING raco setup mode-lambda (hack)"
echo "**************************"
raco setup --no-docs --fail-fast mode-lambda

echo "**************************"
echo "RUNNING raco setup metacoders-dot-org-site"
echo "**************************"
raco setup --no-docs --fail-fast metacoders-dot-org-site

racket metacoders-dot-org/main.rkt && bash deploy.sh