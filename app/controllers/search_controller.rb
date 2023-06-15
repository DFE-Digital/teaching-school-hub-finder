class SearchController < ApplicationController
  def form
    @search = SearchForm.new
  end

  def results
    @search = SearchForm.new(params.permit(:location) )

    if @search.valid?
      raise NotImplementedError
    else
      render 'form', status: :unprocessable_entity
    end
  end
end
