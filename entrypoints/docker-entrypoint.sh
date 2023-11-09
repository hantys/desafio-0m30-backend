#!/bin/sh

set -e

mkdir -p tmp/pids
touch log/development.log
touch log/sidekiq.log
touch log/bullet.log

if [ -f tmp/pids/server.pid ]; then
  rm tmp/pids/server.pid
fi

bundle exec sidekiq &
bundle exec rails s -b 0.0.0.0
