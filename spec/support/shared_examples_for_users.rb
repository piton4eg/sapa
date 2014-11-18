shared_examples 'require_login filter' do
  it 'redirects to login url' do
    expect(response).to redirect_to(login_url)
  end
end
