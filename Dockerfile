FROM ruby:2.6.6-alpine AS base

RUN apk add --no-cache \
    tzdata \
    postgresql-dev \
    build-base

WORKDIR /app

COPY . /app

RUN gem install bundler

RUN bundle install

EXPOSE 3000

CMD ["rails", "s", "-b", "0.0.0.0"]
