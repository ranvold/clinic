source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

gem "rails", "~> 7.0.4"
gem 'sprockets-rails', '~> 3.4', '>= 3.4.2'
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem 'jsbundling-rails', '~> 1.0', '>= 1.0.3'
gem 'cssbundling-rails', '~> 1.1', '>= 1.1.1'
gem 'devise', '~> 4.8', '>= 4.8.1'

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

group :development do
  gem "web-console"
end

