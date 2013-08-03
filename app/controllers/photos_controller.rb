class PhotosController < ApplicationController
  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      flash[:success] = "Photo save success!"
      redirect_to photo_path(@photo)
    else
      render :new
    end
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:id])
    if @photo.update_attributes(photo_params)
      flash[:success] = "Photo edit success!"
      redirect_to photos_path
    else
      render :edit
    end
  end

  private
  def photo_params
    params.require(:photo).permit(:name, :description, :image)
  end

end
