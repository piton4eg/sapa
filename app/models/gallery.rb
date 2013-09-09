class Gallery < ActiveRecord::Base
  validates :name, :description, presence: true

  has_many :photos, dependent: :destroy
  belongs_to :photo
end
