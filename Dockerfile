FROM srfoster/mc-racket-docker

RUN apt-get update
RUN apt-get install tzdata

USER root

COPY . metacoders-dot-org

RUN raco pkg install --no-setup --auto metacoders-dot-org/metacoders-dot-org-lib
RUN raco pkg install --no-setup --auto metacoders-dot-org/metacoders-dot-org-site

WORKDIR "/metacoders-dot-org"

