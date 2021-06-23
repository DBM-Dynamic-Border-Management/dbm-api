source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.0"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', "~> 6.1.3.1"
# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1.4'
# puma
gem 'puma', '~> 5.0'
# Use SCSS for stylesheets
gem 'slim-rails'
# cors
gem 'rack-cors'
# has_scope
gem 'has_scope'
# Background jobs
gem 'sidekiq'
  

group :development, :test do
  gem 'awesome_print'
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'listen', '~> 3.0.5'
  gem 'rspec-rails'
  gem 'rspec_junit_formatter'
  gem 'rubocop'
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :development do
  gem 'annotate', '>= 2.5.0'
  gem 'better_errors'
  gem 'brakeman', require: false
  gem 'bundler-audit', '>= 0.5.0', require: false
    gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'factory_bot_rails'
  gem 'simplecov', require: false
  gem 'timecop'
  gem 'webmock'
  # ruby-prof
  gem 'ruby-prof', '>= 0.17.0', require: false
  gem 'stackprof', '>= 0.2.9', require: false
  gem 'test-prof'
end

group :production do
  gem 'activerecord-nulldb-adapter'
  # Bug tracker
  gem 'rollbar'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
