require 'cloudinary'

class ListsController < ApplicationController
  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    image = params[:list][:photo]
    if image.present?
      cloudinary_url = Cloudinary::Uploader.upload(image)
      @list.image = cloudinary_url["secure_url"]
    end
    if @list.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @list = List.find(params[:id])
    @bookmarks = @list.bookmarks
  end

  def index
    @lists = List.all
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
    image = params[:list][:photo]
    if image.present?
      cloudinary_url = Cloudinary::Uploader.upload(image)
      @list.image = cloudinary_url["secure_url"]
    end
    if @list.update(list_params)
      redirect_to @list, notice: 'Merci pour vos modifications'
    else
      render :edit
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to lists_path
  end

  # def count_movies(list)
  #   movies = list.bookmarks
  #   puts movies.length
  # end

  private

  def list_params
    params.require(:list).permit(:name, :image_url, :comment, :photo)
  end
end
