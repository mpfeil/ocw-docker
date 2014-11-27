FROM polleverywhere/rbenv

MAINTAINER Matthias Pfeil <matthias.pfeil@wwu.de>

RUN apt-get update && apt-get install --fix-missing -q -y --force-yes git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libpq-dev libxslt1-dev libmysqlclient-dev libcurl4-openssl-dev python-software-properties

RUN rbenv install 1.9.3-p550 && rbenv global 1.9.3-p550

RUN gem install bundler --no-ri --no-rdoc
RUN rbenv rehash

RUN gem install rails -v 4.0.2 --no-ri --no-rdoc
RUN rbenv rehash

RUN apt-get install -q -y nodejs

RUN cd /home/ && rails new fossgis --skip-bundle

RUN cd /home/fossgis && echo 'gem "open_conference_ware","~> 1.0.0.pre"'>>Gemfile && bundle install

RUN cd /home/fossgis/bin && yes | rails generate open_conference_ware:install

EXPOSE 3000

WORKDIR /home/fossgis/bin

CMD ["rails", "server"]