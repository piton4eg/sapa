Feature: Top menu

Guest should see link to registration and login
User should see profile link and logout link

Scenario: Guest user
  Given I am a guest
  When I go to home page
  Then I should see guest menu

Scenario: Guest user with existing user
  Given I am a guest
  And user with "user@email.com" exists
  When I go to home page
  Then I should see guest menu without registration

Scenario: User
  Given I am "user@email.com" user
  When I go to home page
  Then I should see user menu
