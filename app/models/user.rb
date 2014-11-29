class User < ActiveRecord::Base
  authenticates_with_sorcery!

  validates :password, presence: true, length: { minimum: 3 }, confirmation: true
  validates :password_confirmation, presence: true
  validates :email, presence: true, uniqueness: true, email: true

  after_destroy :ensure_an_admin_remains

  mount_uploader :avatar, AvatarUploader

  def avatar_name
    File.basename(avatar.path || avatar.filename) if avatar
  end

  private

  def ensure_an_admin_remains
    raise I18n.t('users.cannot_be_deleted') if User.count.zero?
  end
end
