class Photo < ActiveRecord::Base
  validates :name, :description, presence: true
  belongs_to :gallery

  mount_uploader :image, ImageUploader

  def image_name
    File.basename(image.path || image.filename) if image
  end
end
