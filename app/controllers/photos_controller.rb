class PhotosController < ApplicationController
  before_filter :find_photo, only: [:show, :edit, :update, :destroy]

  def index
    @photos = Photo.all

  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      flash[:success] = 'Photo save success!'
      redirect_to photo_path(@photo)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @photo.update_attributes(photo_params)
      flash[:success] = 'Photo edit success!'
      redirect_to photo_path(@photo)
    else
      render :edit
    end
  end

  def destroy
    @photo.destroy
    redirect_to photos_path
  end

  private
  def photo_params
    params.require(:photo).permit(:name, :description, :image, :gallery_id)
  end

  def find_photo
    @photo = Photo.find(params[:id])
  end
end
