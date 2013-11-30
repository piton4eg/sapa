class Gallery < ActiveRecord::Base
  validates :name, :description, presence: true

  has_many :photos, dependent: :destroy

  def avatar
    # todo: если нет фотографий - пустую картинку
    Photo.where(id: avatar_id).first || Photo.first
  end

  scope :opened, -> { where(hidden: false) }
  scope :hidden, -> { where(hidden: true) }
end
