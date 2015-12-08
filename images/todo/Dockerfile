FROM todo/base:0.1.0

MAINTAINER Jeroen van Baarsen "https://twitter.com/jvanbaarsen"

RUN useradd todo -s /bin/bash -m -U &&\
      mkdir -p /var/www && cd /var/www
RUN git clone https://github.com/jvanbaarsen/rails-example.git /var/www/todo &&\
      chown -R todo:todo /var/www/todo &&\
      cd /var/www/todo &&\
      sudo -u todo bundle install --deployment \
      --without test --without development
