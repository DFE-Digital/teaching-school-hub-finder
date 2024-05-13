class PagesController < ApplicationController
  def privacy_policy
  end

  def cookies_policy
  end

  def accessibility
  end

  def terms
  end

  def healthcheck
    head :ok
  end
end
