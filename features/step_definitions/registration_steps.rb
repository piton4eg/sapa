Given(/^I am a guest$/) do
end

When(/^I fill the register form with valid data$/) do
  visit '/signup'
  fill_in 'user_email', with: 'user@email.com'
  fill_in 'user_password', with: 'pass'
  fill_in 'user_password_confirmation', with: 'pass'
  click_button I18n.t('helpers.submit.user.create')
end

Then(/^I should be registered in application$/) do
  expect(User.find_by(email: 'user@email.com')).not_to be_nil
end

Then(/^I should be logged in$/) do
  expect(page).to have_content(I18n.t('top_menu.profile'))
end

When(/^I fill the register form with invalid data$/) do
  visit '/signup'
  fill_in 'user_email', with: 'user'
  fill_in 'user_password', with: 'pass'
  fill_in 'user_password_confirmation', with: 'pass'
  click_button I18n.t('helpers.submit.user.create')
end

Then(/^I should see the register form again$/) do
  expect(page).to have_selector('form#new_user')
end

Then(/^I should not be registered in application$/) do
  expect(User.find_by(email: 'user')).to be_nil
end

When(/^I go to home page$/) do
  visit root_url
end

Then(/^I should see guest menu$/) do
  expect(page).to have_selector('#top-menu')
  expect(page).to have_link(I18n.t('top_menu.signup_title'), href: signup_path)
end

Given(/^I am "(.*?)" user$/) do |email|
  step "user with \"#{email}\" exists"
  step "I fill the login form with valid data for \"#{email}\" user"
end

Then(/^I should see "(.*?)" user menu$/) do |email|
  expect(page).to have_content(I18n.t('top_menu.profile'))
end

Given(/^user with "(.*?)" exists$/) do |email|
  User.create(email: email, password: 'password', password_confirmation: 'password')
end

When(/^I fill the login form with valid data for "(.*?)" user$/) do |email|
  visit login_url
  fill_in "email", with: email
  fill_in "password", with: 'password'
  click_button I18n.t('sessions.create.submit')
end

Then(/^I should be logged in as "(.*?)" user$/) do |email|
  expect(page).to have_content(I18n.t('top_menu.profile'))
end

When(/^I go to logout$/) do
  click_link I18n.t('top_menu.logout_title')
end

Then(/^I should be logged out$/) do
  expect(page).not_to have_content(I18n.t('top_menu.profile'))
end
