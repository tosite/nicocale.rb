# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.5.1"

gem "rails", "~> 5.2.2"

gem "mysql2"
gem "rubocop"
gem "puma", "~> 3.11"
gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0"
gem "coffee-rails", "~> 4.2"
gem "turbolinks", "~> 5"
gem "jbuilder", "~> 2.5"
gem "mini_magick", "~> 4.8"
gem "bootsnap", ">= 1.1.0", require: false
gem "slim-rails"
gem "html2slim"
gem "devise"
gem "rails-i18n", "~> 5.1"
gem "dotenv-rails"
gem "slack-api"

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "letter_opener_web"
  gem "rspec-rails", ">= 2.8.0"
  gem "rails-controller-testing"
  gem "factory_bot_rails"
  gem "factory_bot"
  gem "faker"
  gem "rspec"
  gem "simplecov"
  gem "rails-erd"
end

group :development do
  gem "web-console", ">= 3.3.0"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"

  gem "better_errors"
  gem "meta_request"
  gem "binding_of_caller"
  gem "rack-mini-profiler"
  gem "bullet"
end

group :test do
  gem "capybara", ">= 2.15"
  gem "selenium-webdriver"
  gem "chromedriver-helper"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
# gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
