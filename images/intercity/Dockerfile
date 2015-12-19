FROM intercity/base:0.1.1

MAINTAINER Jeroen van Baarsen "https://twitter.com/jvanbaarsen"

RUN useradd intercity -s /bin/bash -m -U &&\
      mkdir -p /var/www && cd /var/www
RUN git clone https://github.com/intercity/intercity-next.git /var/www/intercity &&\
      chown -R intercity:intercity /var/www/intercity &&\
      cd /var/www/intercity &&\
      sudo -u intercity bundle install --deployment \
      --without test development
