class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
	@movie = Movie.find(params[:id])
	render(:partial => 'movie', :object => @movie) if request.xhr?
  end
end
