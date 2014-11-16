require "rails_helper"

describe 'application/_header.html.slim' do
  let(:user) { create(:user) }

  subject { rendered }

  before do
    allow(self).to receive(:current_page?).and_return(false)
  end

  context 'for all users' do
    before(:each) do
      allow(view).to receive(:current_user)
      render
    end

    it { should have_css '#top-menu' }
    it { should include current_link_to t('top_menu.root'), root_path }
    it { should include current_link_to t('top_menu.galleries'), galleries_path }
    it { should include current_link_to t('top_menu.about'), about_path }
    it { should include current_link_to t('top_menu.contacts'), contacts_path }
  end

  context 'for user' do
    before(:each) do
      allow(view).to receive(:current_user).and_return(user)
      render
    end

    it { should include current_link_to t('top_menu.profile'), profile_path }
    it { should include link_to t('top_menu.logout_title'), logout_path, method: :delete }
    it { should_not include current_link_to t('top_menu.signup_title'), signup_path }
    it { should_not include current_link_to t('top_menu.login_title'), login_path }
  end

  context 'for guest' do
    before(:each) do
      allow(view).to receive(:current_user).and_return(nil)
      render
    end

    it { should_not include current_link_to t('top_menu.profile'), profile_path }
    it { should_not include link_to t('top_menu.logout_title'), logout_path, method: :delete }
    it { should include current_link_to t('top_menu.signup_title'), signup_path }
    it { should include current_link_to t('top_menu.login_title'), login_path }
  end
end
