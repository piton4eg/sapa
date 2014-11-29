Feature: Authentication feature

Scenario: Login
  Given I am a guest
  And user with "user@email.com" exists
  When I fill the login form with valid data for "user@email.com" user
  Then I should be logged in as user

Scenario: Logout
  Given I am "user@email.com" user
  When I go to logout
  Then I should be logged out
