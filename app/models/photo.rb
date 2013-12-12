class Photo < ActiveRecord::Base
  validates :name, presence: true
  belongs_to :gallery

  mount_uploader :image, PhotoUploader

  def image_name
    File.basename(image.path || image.filename) if image
  end

  scope :on_main, -> { where(main_photo: true) }
  scope :in_portfolio, -> { where(portfolio: true) }
  scope :without_photo, -> (id) { where.not(id: id) }
  scope :with_image, -> { where.not(image: nil) }
end
