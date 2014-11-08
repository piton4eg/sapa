Given(/^I am guest$/) do
end

When(/^I fill the register form with valid data$/) do
  visit '/signup'
  fill_in 'user_email', with: 'user@email.com'
  fill_in 'user_password', with: 'pass'
  fill_in 'user_password_confirmation', with: 'pass'
  fill_in 'user_password_confirmation', with: 'pass'
  click_button I18n.t('helpers.submit.user.create')
end

Then(/^I should be registered in application$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should be logged in$/) do
  pending # express the regexp above with the code you wish you had
end
