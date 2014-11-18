require "rails_helper"

describe SessionsController do
  describe 'GET new' do
    context 'when logged in' do
      before do
        allow(@controller).to receive(:logged_in?).and_return(true)
      end
      it 'redirects to profile page' do
         get :new
         expect(response).to redirect_to profile_path
      end
    end
    context 'when guest' do
      before do
        allow(@controller).to receive(:logged_in?).and_return(false)
      end
      it 'render new template' do
        get :new
        expect(response).to render_template :new
      end
    end
  end

  describe 'POST create' do
    let(:params) do
      {
        email: 'user@email.com',
        password: 'password'
      }
    end

    it 'sends login method' do
      expect(@controller).to receive(:login)
      post :create, params: params
    end

    context 'when login is success' do
      before(:each) do
        allow(@controller).to receive(:login).and_return(true)
      end

      it 'redirects to root url' do
        post :create, params: params
        expect(response).to redirect_to root_url
      end
      it 'assigns a success flash message' do
        post :create, params: params
        expect(flash[:notice]).to eq I18n.t('sessions.create.success')
      end
    end

    context 'when login is not success' do
      before(:each) do
        allow(@controller).to receive(:login).and_return(false)
      end

      it 're-render new template' do
        post :create, params: params
        expect(response).to render_template :new
      end
      it 'assigns a error flash message' do
        post :create, params: params
        expect(flash[:error]).to eq I18n.t('sessions.create.error')
      end
    end
  end

  describe 'DELETE destroy' do
    let(:user) { create(:user) }
    before(:each) do
      login_user(user)
    end
    it 'sends logout' do
      expect(@controller).to receive(:logout)
      delete :destroy
    end
    it 'redirects to root url' do
      delete :destroy
      expect(response).to redirect_to root_url
    end
    it 'assigns a flash message' do
      delete :destroy
      expect(flash[:notice]).to eq I18n.t('sessions.destroy.success')
    end
  end
end
