class Gallery < ActiveRecord::Base
  validates :name, :description, presence: true

  has_many :photos, dependent: :destroy

  def avatar
    Photo.where(id: avatar_id).first || Photo.first
  end
end
