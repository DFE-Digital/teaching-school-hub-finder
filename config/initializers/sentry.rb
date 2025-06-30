if ENV["SENTRY_DSN"].present?
  Sentry.init do |config|
    # add custom sentry configuration here
  end
end
