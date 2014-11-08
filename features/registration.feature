Feature: Registration

Scenario:
  Given I am guest
  When I fill the register form with valid data
  Then I should be registered in application
  And I should be logged in
