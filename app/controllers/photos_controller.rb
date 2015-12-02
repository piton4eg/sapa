class PhotosController < ApplicationController
  before_filter :find_gallery
  skip_before_filter :require_login, only: :show
  before_filter :find_photo, only: [:show, :edit, :update, :destroy]

  def new
    @photo = @gallery.photos.new
  end

  def create
    @photo = @gallery.photos.create(photo_params)
  end

  def show
  end

  def edit
  end

  def update
    if @photo.update_attributes(photo_params)
      flash[:success] = t('photos.edit.success')
      redirect_to edit_gallery_photo_path(@gallery, @photo)
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
    params.require(:photo).permit(:name, :gallery_id, :main_photo, :portfolio, :image_cache, :image, :remote_image_url, :remove_image)
  end

  def find_photo
    @photo = Photo.find(params[:id])
  end

  def find_gallery
    @gallery ||= Gallery.find(params[:gallery_id])
  end
end
