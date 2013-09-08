class Photo < ActiveRecord::Base
  validates :name, :description, presence: true

  belongs_to :gallery

  mount_uploader :image, ImageUploader
end
