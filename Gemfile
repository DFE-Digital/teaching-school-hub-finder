source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.3.0"

gem "activerecord-postgis-adapter"
gem "bootsnap", require: false
gem "bundler", "~> 2.4"
gem 'geocoder'
gem "pg", "~> 1.1"
gem "puma", "~> 6.4"
gem "rails", "~> 7.1.3"
gem "rgeo"
gem "rgeo-geojson"
gem "rgeo-proj4"

gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

gem "cssbundling-rails"
gem "jsbundling-rails"
gem "propshaft"

gem "govuk-components"
gem "govuk_design_system_formbuilder"

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
