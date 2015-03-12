class SearchController < ApplicationController
  def search
    render json: SearchCountdown.for(params[:search])
  end
end
