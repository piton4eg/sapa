class PhotosController < ApplicationController
  before_filter :find_gallery
  skip_before_filter :require_login, only: :show
  before_filter :find_photo, only: [:show, :edit, :update, :destroy]

  def new
    @photo = @gallery.photos.new
  end

  def create
    @photo = @gallery.photos.new(photo_params)
    if @photo.save
      flash[:success] = t('photos.create.success')
      redirect_to edit_gallery_photo_path(@gallery, @photo)
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
      # На главной может быть только одна фотография
      if photo_params[:main_photo] == '1'
        Photo.on_main.without_photo(@photo.id).update_all(main_photo: false)
      end
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
