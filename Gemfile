source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem "rails", "~> 8.1.3"

gem "sqlite3"
gem "puma", "~> 8.0"
gem "bootsnap", "~> 1.18", require: false
gem "devise", github: "heartcombo/devise", branch: "main"
gem "bootstrap", "~> 5.3"
gem "dartsass-sprockets"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "sprockets-rails"
gem "solid_cache"
gem "solid_queue"
gem "solid_cable"
gem "kamal", require: false
gem "thruster", require: false
gem "image_processing", "~> 1.2"

group :development, :test do
  gem "debug", platforms: [ :mri, :windows ]
  gem "bundler-audit", require: false
  gem "brakeman", require: false
  gem "rubocop-rails-omakase", require: false
end

group :development do
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "letter_opener"
end

gem "tzinfo-data", platforms: [ :windows, :jruby ]
