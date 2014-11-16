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

  describe 'POST create' do
    let(:user) { stub_model(User) }
    let(:params) do
      {
        email: 'user@email.com',
        password: 'password',
        password_confirmation: 'password'
      }
    end
    before(:each) do
      allow(User).to receive(:new).and_return(user)
    end
    it 'sends new message to User class' do
      expect(User).to receive(:new).with(params)
      post :create, user: params
    end
    it 'sends save message to user model' do
      expect(user).to receive(:save)
      post :create, user: params
    end

    context 'when save message return true' do
      before(:each) do
        expect(user).to receive(:save).and_return(true)
        post :create, user: params
      end
      it 'redirects to profile path' do
        expect(response).to redirect_to root_path
      end
      it 'assigns a success flash message' do
        expect(flash[:notice]).to eq I18n.t('users.user_create_success')
      end
      # it 'sends auto_login method' do
      #   expect(@controller).to receive(:auto_login)
      # end
    end

    context 'when save message return false' do
      before(:each) do
        expect(user).to receive(:save).and_return(false)
        post :create, user: params
      end
      it 're-renders new template' do
        expect(response).to render_template :new
      end
      it 'assigns @user' do
        expect(assigns(:user)).to eq user
      end
      it 'assigns a error flash message' do
        expect(flash[:error]).not_to be_nil
      end
    end
  end
end
