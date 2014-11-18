shared_examples 'require login filter' do
  it 'redirects to login url' do
    expect(response).to redirect_to(login_url)
  end
end
