require 'rails_helper'

describe 'sessions/new.html.slim' do
  before(:each) do
    render
  end

  it 'has login form' do
    expect(rendered).to have_selector 'form#new_login'
  end

  it 'has email field' do
    expect(rendered).to have_selector '#email'
  end

  it 'has password field' do
    expect(rendered).to have_selector '#password'
  end

  it 'has remember_me field' do
    expect(rendered).to have_selector '#remember_me'
  end

  it 'has submit button' do
    expect(rendered).to have_selector 'input[type="submit"]'
  end
end
