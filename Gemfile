source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.3.0"

# Rails 8
gem "rails", "~> 8.0.0"

# Database
gem "pg", "~> 1.1"

# Server
gem "puma", ">= 5.0"

# Modern JavaScript (replaces Webpacker)
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"

# JSON APIs
gem "jbuilder"

# Authentication
gem "devise", "~> 4.9"

# UI Framework - Updated Bootstrap
gem 'bootstrap', '~> 5.3.0'
gem 'jquery-rails'
gem 'sassc-rails'

# Performance
gem "bootsnap", require: false

# File handling
gem "image_processing", "~> 1.2"

group :development, :test do
  gem "debug", platforms: %i[ mri windows ]
  gem 'rspec-rails'
  gem 'factory_bot_rails'
end

group :development do
  gem 'listen'
  gem "web-console"
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]