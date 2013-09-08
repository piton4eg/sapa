class GalleriesController < ApplicationController
  before_filter :find_gallery, only: [:show, :edit, :update, :destroy]

  def index
    @galleries = Gallery.all
    if params[:gallery]
      gallery = Gallery.find(params[:gallery])
      @photos = gallery.photos
    else
      @photos = Photo.all
    end
    @uploader = Gallery.new.image
    @uploader.success_action_redirect = new_gallery_url
  end

  def new
    @gallery = Gallery.new(key: params[:key])
  end

  def create
    @gallery = Gallery.new(gallery_params)
    if @gallery.save
      flash[:success] = "Gallery save success!"
      redirect_to galleries_path(gallery: @gallery)
    else
      render :new
    end
  end

  def show
  end

  def edit
    @photos = @gallery.photos
    @uploader = @gallery.photos.new.image
    @uploader.success_action_redirect = new_gallery_photo_url(@gallery)
  end

  def update
    if @gallery.update_attributes(gallery_params)
      flash[:success] = "Gallery edit success!"
      redirect_to galleries_path(gallery: @gallery)
    else
      render :edit
    end
  end

  def destroy
    @gallery.destroy
    redirect_to galleries_path
  end

  private
  def gallery_params
    params.require(:gallery).permit(:name, :image, :key)
  end

  def find_gallery
    @gallery = Gallery.find(params[:id])
  end

end
