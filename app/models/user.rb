class User < ActiveRecord::Base
  authenticates_with_sorcery!

  validates :password, length: { minimum: 3 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  validates :email, uniqueness: true

  after_destroy :ensure_an_admin_remains

  mount_uploader :avatar, AvatarUploader

  def avatar_name
    File.basename(avatar.path || avatar.filename) if avatar
  end

  private

  def ensure_an_admin_remains
    if User.count.zero?
      raise t('users.cannot_be_deleted')
    end
  end
end
