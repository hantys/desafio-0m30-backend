release: rake db:migrate && bundle exec rails assets:precompile RAILS_ENV=production

web: bundle exec puma -t 5:5 -p ${PORT:-5000} -e $RAILS_ENV
worker: bundle exec sidekiq -C config/sidekiq.yml
