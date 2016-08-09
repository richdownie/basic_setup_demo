Feature: E-Xact Auth Scenarios

Scenario: Login as an invalid user
  * I am on the login page
  * I login with an Invalid User
  * I should see "Incorrect login." on the page
  * I should be on the "/?lang=en" page