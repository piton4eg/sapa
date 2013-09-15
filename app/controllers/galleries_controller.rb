class GalleriesController < ApplicationController
  before_filter :find_gallery, only: [:show, :edit, :update, :destroy]

  def index
    if params[:gallery]
      gallery = Gallery.find(params[:gallery])
      @photos = gallery.photos
    else
      @photos = Photo.all
    end
  end

  def new
    @gallery = Gallery.new
  end

  def create
    @gallery = Gallery.new(gallery_params)
    if @gallery.save
      flash[:success] = 'Gallery save success!'
      redirect_to gallery_path(@gallery)
    else
      render :new
    end
  end

  def show
  end

  def edit
    @photos = @gallery.photos
  end

  def update
    if @gallery.update_attributes(gallery_params)
      flash[:success] = 'Gallery edit success!'
      redirect_to gallery_path(@gallery)
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
    params.require(:gallery).permit(:name, :description)
  end

  def find_gallery
    @gallery = Gallery.find(params[:id])
  end

end
