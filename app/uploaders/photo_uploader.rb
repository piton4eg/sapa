class PhotoUploader < ImageUploader
  process resize_to_limit: [800, 800]

  version :thumb do
    process resize_to_fill: [300, 300]
  end

  version :mini, from_version: :thumb do
    process resize_to_fill: [100, 100]
  end
end
