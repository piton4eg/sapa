require "rails_helper"

describe User do

  describe "validations" do
    subject { build(:user) }

    it { should be_valid }
    it { should validate_presence_of :password }
    it { should validate_length_of(:password).is_at_least(3) }
    it { should validate_confirmation_of :password }
    it { should validate_presence_of :password_confirmation }
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }

    it 'is invalid if email is invalid' do
      user = build(:user, email: 'email')
      expect(user.valid?).to be_falsy
    end
  end
end
