FROM ruby:2.2.0

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev

# for postgres
RUN apt-get install -y libpq-dev

# for nokogiri
RUN apt-get install -y libxml2-dev libxslt1-dev

# for capybara-webkit
RUN apt-get install -y libqt4-webkit libqt4-dev xvfb

# for a JS runtime
RUN apt-get install -y nodejs

RUN mkdir /app
WORKDIR /app

ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
RUN bundle install --deployment
ADD . /app

EXPOSE 8080
CMD []
ENV RACK_ENV production
ENV RAILS_ENV production

# Build static assets
RUN bundle exec rake assets:precompile --trace

# Setup DB
# RUN bundle exec rake db:create db:migrate --trace

ENTRYPOINT bundle exec rails s -p 8080 -e $RAILS_ENV
