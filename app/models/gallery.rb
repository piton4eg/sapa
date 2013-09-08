class Gallery < ActiveRecord::Base
  validates :name, presence: true

  has_many :photos, dependent: :destroy

  mount_uploader :image, ImageUploader

  after_save :enqueue_image

  def image_name
    File.basename(image.path || image.filename) if image
  end

  def enqueue_image
    ImageWorker.perform_async(id, key) if key.present?
  end

  class ImageWorker
    include Sidekiq::Worker

    def perform(id, key)
      gallery = Gallery.find(id)
      gallery.key = key
      gallery.remote_image_url = gallery.image.direct_fog_url(with_path: true)
      gallery.save!
      gallery.update_column(:image_processed, true)
    end
  end
end
