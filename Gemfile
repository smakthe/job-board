source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "4.0.1"

gem "rails", "~> 8.1.2"

gem "pg"
gem "puma", "~> 6.4"
gem "bootsnap", "~> 1.18", require: false
gem "devise", github: "heartcombo/devise", branch: "main"
gem "bootstrap", '~> 5.3'
gem "dartsass-sprockets"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "sprockets-rails"

group :development, :test do
  gem 'debug', platforms: [:mri, :windows]
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
end

gem 'tzinfo-data', platforms: [:windows, :jruby]