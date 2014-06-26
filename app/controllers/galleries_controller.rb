class GalleriesController < ApplicationController
  skip_before_filter :authorize, only: [:index, :show]
  before_filter :find_gallery, only: [:show, :edit, :update, :destroy]

  def index
    @galleries = available_galleries
  end

  def new
    @gallery = Gallery.new
  end

  def create
    @gallery = Gallery.new(gallery_params)
    if @gallery.save
      flash[:success] = t(:gallery_save_success) 
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
      flash[:success] = t(:gallery_edit_success)
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
    params.require(:gallery).permit(:name, :avatar_id, :info, :hidden)
  end

  def find_gallery
    @gallery = available_galleries.find(params[:id])
  end

  def available_galleries
    @available_galleries ||= logged_in? ? Gallery.all : Gallery.opened.with_photos
  end
end
