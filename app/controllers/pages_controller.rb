class PagesController < ApplicationController
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
