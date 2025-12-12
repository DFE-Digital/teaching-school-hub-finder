class SearchController < ApplicationController
  def form
    @search = SearchForm.new
  end

  def results
    @search = SearchForm.new(params.permit(:location))

    return render 'form', status: :unprocessable_entity unless @search.valid?

    @search.hubs # Eager load to catch geocoding errors
  rescue LocalAuthority::ServiceUnavailable
    @service_unavailable = true
    render 'form'
  end

  def validate
    @names = LocalAuthority.pluck(:name)
    @hubs = Hub.all
  end

end
