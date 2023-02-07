class ReviewsController < ApplicationController
  before_action :has_moviegoer_and_movie, :only => [:new, :create]

  protected
  def has_moviegoer_and_movie
    unless @current_user
      flash[:warning] = 'You must be logged in to post reviews'
      redirect_to movies_path
    end
    unless (@movie = Movie.where(id: params[:movie_id]).first)
      flash[:warning] = 'Review can be posted for an existing movie only'
      redirect_to movies_path
    end
  end

  public
  def new
    @review = @movie.reviews.build
  end

  def create
    @current_user.reviews << @movie.reviews.build(params[:review])
    redirect_to movie_path(@movie)
  end

  def show
    @review = Review.find(params[:id])
  end
end
