class User < ActiveRecord::Base
  validates :name, presence: true
  after_destroy :ensure_an_admin_remains

  has_secure_password

  mount_uploader :avatar, AvatarUploader

  def avatar_name
    File.basename(avatar.path || avatar.filename) if avatar
  end

  private
  def ensure_an_admin_remains
    if User.count.zero?
      raise "You can't be deleted"
    end
  end
end
