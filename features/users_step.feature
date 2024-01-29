Feature: User Registration

  Scenario: User signs up with valid information
    Given I am on the new user registration page
    When I fill in the registration form with valid information
    And I press the "Sign up"
    Then I should be redirected to the login page


  Scenario: User signs up with invalid information
    Given I am on the new user registration page
    When I fill in the registration form with invalid information
    And I press the "Sign up"
    Then I should be on the registration page
    And I should see error messages
