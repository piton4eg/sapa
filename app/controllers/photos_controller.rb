class PhotosController < ApplicationController
  before_filter :find_gallery
  skip_before_filter :require_login, only: :show

  def create
    @photo = @gallery.photos.create(photo_params)
  end

  def destroy
    @gallery.photos.where(id: params[:photo_ids]).destroy_all
    redirect_to edit_gallery_path(@gallery)
  end

  private

  def photo_params
    params.require(:photo).permit(:name, :gallery_id, :main_photo, :portfolio, :image_cache, :image, :remote_image_url, :remove_image)
  end

  def find_gallery
    @gallery ||= Gallery.find(params[:gallery_id])
  end
end
