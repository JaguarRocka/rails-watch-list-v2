class MoviesController < ApplicationController

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(params[:movie])

    if @movie.save
    redirect_to movie_path(@movie)
    else
    render :new, status: :unprocessable_entity
    end
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
  end

  def index
    @movies = Movie.all
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :overview, :poster_url, :rating)
  end

end
