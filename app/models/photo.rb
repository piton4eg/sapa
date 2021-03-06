class Photo < ActiveRecord::Base
  belongs_to :gallery

  mount_uploader :image, PhotoUploader

  def image_name
    File.basename(image.path || image.filename) if image
  end

  scope :on_main, -> { where(main_photo: true) }
  scope :without_photo, -> (id) { where.not(id: id) }
  scope :with_image, -> { where.not(image: nil) }
end
