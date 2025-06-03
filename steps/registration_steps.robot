*** Settings ***
Library           SeleniumLibrary
Library           ../robotfile.py
Resource          ../resources/registration_keywords.robot
Library           GherkinLibrary

*** Test Cases ***
BDD Scenario: Successful registration with valid details
    [Tags]    registration
    Given I open the registration page
    When I enter "test@example.com" into the email field
    And I enter "John Doe" into the name field
    And I enter "Password123" into the password field
    And I enter "Password123" into the confirm password field
    And I click the register button
    Then I should see a successful registration message
    And the email "test@example.com" should be valid
