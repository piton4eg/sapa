# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWaveDirect::Uploader

  include CarrierWave::RMagick

  include CarrierWave::MimeTypes
  process :set_content_type

  # Create different versions of your uploaded files:
  version :thumb do
     process :resize_to_limit => [200, 200]
  end

  version :mini do
    process :resize_to_limit => [100, 100]
  end
end
