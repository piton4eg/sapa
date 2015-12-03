class AvatarUploader < ImageUploader
  process resize_to_limit: [500, 500]

  version :thumb do
    process resize_to_fill: [300, 300]
  end
end
