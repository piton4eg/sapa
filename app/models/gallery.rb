class Gallery < ActiveRecord::Base
  validates :name, presence: true

  has_many :photos, dependent: :destroy

  mount_uploader :image, ImageUploader
end
