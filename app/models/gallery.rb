class Gallery < ActiveRecord::Base
  validates :name, presence: true

  has_many :photos, dependent: :destroy

  def avatar
    # todo: если нет фотографий - пустую картинку
    photos.find_by(id: avatar_id) || photos.first
  end

  def hidden?
    hidden
  end

  scope :opened, -> { where(hidden: false) }
  scope :hidden, -> { where(hidden: true) }
  scope :with_photos, -> { select('DISTINCT galleries.*').joins(:photos) }
end
