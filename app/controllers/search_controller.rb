class SearchController < ApplicationController

  def index
  end

  def results
    query = URI.encode(permitted_params[:query])
    # entity = URI.encode(permitted_params[:entity])
    response = HTTParty.get("https://itunes.apple.com/search?term=#{query}&entity=album")
    @results = JSON.parse(response.body) || []
    # byebug
  end

  private

  def permitted_params
    # params.require(:search).permit(:query, :entity)
    params.require(:search).permit(:query)
  end
end
