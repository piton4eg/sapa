class PhotosController < ApplicationController
  before_filter :find_gallery, except: :index
  before_filter :find_photo, only: [:show, :edit, :update, :destroy]

  def index
    @photos = Photo.all
  end

  def new
    @photo = @gallery.photos.new(key: params[:key])
  end

  def create
    @photo = @gallery.photos.new(photo_params)
    if @photo.save
      flash[:success] = "Photo save success!"
      redirect_to gallery_photo_path(@gallery, @photo)
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
      flash[:success] = "Photo edit success!"
      redirect_to gallery_photo_path(@gallery, @photo)
    else
      render :edit
    end
  end

  def destroy
    @photo.destroy
    redirect_to edit_gallery_path(@gallery)
  end

  private
  def photo_params
    params.require(:photo).permit(:name, :description, :image, :key)
  end

  def find_gallery
    @gallery = Gallery.find(params[:gallery_id])
  end

  def find_photo
    @photo = @gallery.photos.find(params[:id])
  end
end
