class SearchController < ApplicationController
  def search
    @products = SearchCountdown.for(params[:search])
  end
end
