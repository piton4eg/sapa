Feature: Top menu

Guest should see link to registration and login
User should see profile link and logout link

Scenario: Guest user
  Given I am a guest
  When I go to home page
  Then I should see guest menu

Scenario: User
  Given I am "user@email.com" user
  When I go to home page
  Then I should see "user@email.com" user menu
