source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

gem "bootsnap", require: false
gem "bundler", "~> 2.4"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "rails", "~> 7.0.5"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

gem "cssbundling-rails"
gem "jsbundling-rails"
gem "propshaft"

gem "govuk-components"
gem "govuk_design_system_formbuilder"

group :development do
  gem 'annotate', require: false
  gem 'prettier_print', require: false
  gem 'solargraph', require: false
  gem 'solargraph-rails', require: false
  gem 'syntax_tree', require: false
  gem 'syntax_tree-haml', require: false
  gem 'syntax_tree-rbs', require: false
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "selenium-webdriver"
  gem "shoulda-matchers"
  gem "webdrivers"
end

group :test, :development do
  gem "byebug"
  gem "dotenv-rails"
  gem "rspec"
  gem "rspec-rails"
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "brakeman", require: false
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem 'rubocop-govuk', require: false
end
