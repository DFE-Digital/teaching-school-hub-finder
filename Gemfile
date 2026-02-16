source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby file: ".ruby-version"

gem "activerecord-postgis-adapter"
gem "bootsnap", require: false
gem "bundler", "~> 2.4"
gem "geocoder"
gem "pg", "~> 1.6"
gem "puma", "~> 7.2"
gem "rails", "~> 8.0.4"
gem "rails_semantic_logger"
gem "rgeo"
gem "rgeo-geojson"
gem "rgeo-proj4"
gem "sentry-rails"

gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

gem "cssbundling-rails"
gem "jsbundling-rails"
gem "propshaft"

gem "govuk-components", "~> 5.13.1"
gem "govuk_design_system_formbuilder", "~> 5.13.0"

group :development do
  gem 'prettier_print', require: false
  gem "web-console"
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "capybara-screenshot"
  gem "selenium-webdriver"
  gem "shoulda-matchers"
  gem "webdrivers"
end

group :test, :development do
  gem "amazing_print"
  gem "byebug"
  gem "dotenv-rails"
  gem "pry"
  gem "pry-byebug"
  gem "rspec"
  gem "rspec-rails"
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "brakeman", require: false
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem 'rubocop-govuk', require: false
  gem 'vcr'
  gem 'webmock'
end
