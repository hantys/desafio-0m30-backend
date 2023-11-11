FROM ruby:3.2.2-slim

RUN apt-get update && apt-get install -y \
  curl \
  git \
  build-essential \
  tzdata \
  curl \
  git \
  imagemagick \
  ruby-dev \
  libpq-dev \
  build-essential \
  libssl-dev \
  libreadline-dev \
  zlib1g-dev && \
  curl -sL https://deb.nodesource.com/setup_18.x | bash - && \
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
  apt-get update && apt-get install -y nodejs yarn tzdata postgresql-client

ENV TZ=America/Sao_Paulo

WORKDIR /app

COPY Gemfile Gemfile.lock ./

COPY . ./

RUN gem install bundler

# RUN gem update --system

RUN bundle install
RUN yarn install

COPY ./entrypoints/docker-entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/docker-entrypoint.sh

EXPOSE 3000

ENTRYPOINT ["docker-entrypoint.sh"]
