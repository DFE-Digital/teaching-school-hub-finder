source "https://rubygems.org", cooldown: 3
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby file: ".ruby-version"

gem "activerecord-postgis-adapter"
gem "bootsnap", require: false
gem "bundler"
gem "geocoder"
gem "pg", "~> 1.6"
gem "puma", "~> 8.0"
gem "rails", "8.0.5.1"
gem "rails_semantic_logger"
gem "rgeo"
gem "rgeo-geojson"
gem "rgeo-proj4"
gem "sentry-rails"

gem "tzinfo-data", platforms: %i[ windows jruby ]

gem "cssbundling-rails"
gem "jsbundling-rails"
gem "propshaft"

gem "govuk-components", "~> 6.4"
gem "govuk_design_system_formbuilder", "~> 6.4"

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
  gem "debug", platforms: %i[ mri windows ]
  gem 'rubocop-govuk', require: false
  gem 'vcr'
  gem 'webmock'
end
