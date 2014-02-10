namespace :carrierwave do
  namespace :recreate do
    task photos: :environment do
      Photo.all.each do |photo|
        photo.image.recreate_versions! if photo.image?
      end
    end
    task users: :environment do
      User.all.each do |user|
        user.avatar.recreate_versions! if user.avatar?
      end
    end
  end
end
