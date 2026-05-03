source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "4.0.1"

gem "rails", "~> 7.0.0"

gem "pg"
gem "puma", "~> 5.6"

gem "bootsnap", "~> 1.16", require: false
gem "devise", "~> 4.9"
gem 'bootstrap', '~> 4.6'
gem 'jquery-rails'
gem 'sassc-rails', '~> 2.1.2'
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "sprockets-rails" # If it isn't already there for CSS
gem 'uglifier', '>= 1.3.0'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'racc', '~> 1.6'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]