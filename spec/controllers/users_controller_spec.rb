require "rails_helper"

describe UsersController do
  describe 'GET new' do
    let(:user) { mock_model(User).as_new_record }

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
      end
      it 'redirects to root path' do
        post :create, user: params
        expect(response).to redirect_to root_path
      end
      it 'assigns a success flash message' do
        post :create, user: params
        expect(flash[:notice]).to eq I18n.t('users.create.success')
      end
      it 'sends auto_login method' do
        expect(@controller).to receive(:auto_login).with(user)
        post :create, user: params
      end
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
        expect(flash[:error]).to eq I18n.t('users.create.error')
      end
    end
  end

  describe 'GET edit' do
    context 'by not logged in user' do
      before(:each) { get :edit }
      it_behaves_like 'require_login filter'
    end

    context 'by logged in user' do
      let(:user) { stub_model(User) }
      before(:each) do
        login_user(user)
      end

      it 'sends first message to User class' do
        expect(User).to receive(:first)
        get :edit, id: user
      end
      it 'render edit template' do
        get :edit, id: user
        expect(response).to render_template :edit
      end
    end
  end

  describe 'PUT update' do
    context 'by not logged in user' do
      before(:each) { put :update }
      it_behaves_like 'require_login filter'
    end

    context 'by logged in user' do
      let(:user) { stub_model(User) }
      let(:params) do
        {
          email: 'user@email.com',
          password: 'password',
          password_confirmation: 'password'
        }
      end
      before(:each) do
        login_user(user)
        allow(User).to receive(:first).and_return(user)
      end

      it 'sends first message to User class' do
        expect(User).to receive(:first)
        put :update, user: params
      end
      it 'assigns user' do
        put :update, user: params
        expect(assigns(:user)).to eq user
      end
      it 'sends update message to user' do
        expect(user).to receive(:update).with(params)
        put :update, user: params
      end

      context 'when update return true' do
        before(:each) do
          expect(user).to receive(:update).and_return(true)
        end
        it 'redirects to profile path' do
          put :update, user: params
          expect(response).to redirect_to profile_path
        end
        it 'assigns a success flash message' do
          put :update, user: params
          expect(flash[:notice]).to eq I18n.t('users.update.success')
        end
      end
      context 'when update return false' do
        before(:each) do
          expect(user).to receive(:update).and_return(false)
          put :update, user: params
        end
        it 're-renders edit template' do
          expect(response).to render_template :edit
        end
        it 'assigns a error flash message' do
          expect(flash[:error]).to eq I18n.t('users.update.error')
        end
      end
    end
  end

  # todo:
  # new, create - only one user
end
