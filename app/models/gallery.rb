class Gallery < ActiveRecord::Base
  validates :name, :description, presence: true

  has_many :photos, dependent: :destroy
end
