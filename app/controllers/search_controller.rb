class SearchController < ApplicationController
  def form
    @search = SearchForm.new
  end

  def results
    @search = SearchForm.new(params.permit(:location) )

    render 'form', status: :unprocessable_entity unless @search.valid?
  end

  def validate
    @names = LocalAuthority.pluck(:name)
    @hubs = Hub.all
  end

end
