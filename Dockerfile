FROM ruby:4.0.1-slim

EXPOSE 3000

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install --no-install-recommends -y build-essential libpq-dev libyaml-dev

# FIXME: isolate the gem-related file to leverage Docker caching
WORKDIR /app

COPY . ./

RUN bundle install

WORKDIR /app/spec/dummy

CMD ["bundle", "exec", "rails", "s", "-b", "0.0.0.0"]
