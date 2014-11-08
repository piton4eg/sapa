require "rails_helper"

describe UsersController do
  describe 'GET new' do
    let(:user) { mock_model("User").as_new_record }

    before(:each) do
      allow(User).to receive(:new).and_return(user)
      get :new
    end

    it 'assigns @user' do
      expect(assigns(:user)).to eq user
    end
    it 'render new template' do
      expect(response).to render_template :new
    end
  end
end
