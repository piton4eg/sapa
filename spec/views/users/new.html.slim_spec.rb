require 'rails_helper'

describe 'users/new.html.slim' do
  before do
    user = mock_model('User').as_new_record.as_null_object
    assign(:user, user)
    render
  end

  it 'has new_user form' do
    expect(rendered).to have_selector 'form#new_user'
  end

  it 'has user_email field' do
    expect(rendered).to have_selector '#user_email'
  end

  it 'has user_password field' do
    expect(rendered).to have_selector '#user_password'
  end

  it 'has user_password_confirmation field' do
    expect(rendered).to have_selector '#user_password_confirmation'
  end

  it 'has submit button' do
    expect(rendered).to have_selector 'input[type="submit"]'
  end

  it 'has not user_info field' do
    expect(rendered).not_to have_selector '#user_info'
  end

  it 'has not user_avatar field' do
    expect(rendered).not_to have_selector '#user_avatar'
  end

  it 'has not user_remote_avatar_url field' do
    expect(rendered).not_to have_selector '#user_remote_avatar_url'
  end

  it 'has not user_remove_avatar field' do
    expect(rendered).not_to have_selector '#user_remove_avatar'
  end
end
