FROM ruby:2.7.1

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY Gemfile /usr/src/app
COPY Gemfile.lock /usr/src/app

RUN bundle install

COPY . /usr/src/app

CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]